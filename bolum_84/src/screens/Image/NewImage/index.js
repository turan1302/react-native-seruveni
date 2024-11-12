import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import AuthLayout from "../../../components/Layout/AuthLayout";
import CustomHeader from "../../../components/Image/CustomHeader";
import { inject, observer } from "mobx-react";
import { launchImageLibrary } from "react-native-image-picker";
import styles from "./styles";
import { Formik } from "formik";
import * as Yup from "yup";
import MaterialCommunityIcons from "react-native-vector-icons/MaterialCommunityIcons";
import RestClient from "../../../RestAPI/RestClient";
import AppUrl from "../../../RestAPI/AppUrl";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";

@inject("AuthStore")
@observer

export default class NewImage extends Component {

  constructor(props) {
    super(props);

    this.state = {
      imageUri: null,
    };
  }

  componentDidMount() {
    const { route, navigation } = this.props;
    const { img_image } = route.params || { img_image: null };

    if (img_image) {
      this.setState({
        imageUri: img_image,
      });
    }

    navigation.addListener("blur", () => {
      this.setState({
        imageUri: null,
      });
    });
  }

  getFileExtension = (filePath) => {
    return filePath.split(".").pop();
  };

  componentDidUpdate(prevProps, prevState, snapshot) {
    const { route } = this.props;

    if (prevProps.route.params?.img_image !== route.params?.img_image) {
      const uri = route.params?.img_image;
      this.formikRef.setFieldValue("img_image", {
        uri: uri,
        type: "image/jpeg",
        name: "image.jpeg",
      });

      this.setState({
        imageUri: route.params.img_image,
      });
    }
  }

  componentWillUnmount() {
    this.setState({ imageUri: null });
  }

  selectImage = (setFieldValue) => {
    const options = {
      mediaType: "photo",
      includeBase64: false,
    };

    launchImageLibrary(options, (response) => {
      if (response.didCancel) {
        console.log("Kullanıcı resim seçmeyi iptal etti");
      } else if (response.error) {
        console.log("Image picker error ", response.error);
      } else {
        const uri = response.assets[0];
        //console.log(uri);
        this.setState({
          imageUri: uri.uri,
        }, () => {
          setFieldValue("img_image", {
            uri: uri.uri,
            type: uri.type,
            name: uri.fileName || "image.jpg",
          });
        });
      }
    });
  };

  _handleSubmit = async (values, { resetForm, setSubmitting }) => {
    const {navigation} = this.props;

    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    const formData = new FormData();
    formData.append("img_name",values.img_name);
    formData.append("img_image",values.img_image);
    formData.append("img_desc",values.img_desc);

    await RestClient.postRequest(AppUrl.images_store,formData,{
      headers : {
        "Authorization" : "Bearer "+token,
        "Content-Type" : "multipart/form-data"
      }
    }).then((res)=>{
      const status = res.status;
      const result = res.data;

      if (status===201){
        Dialog.show({
          type : ALERT_TYPE.SUCCESS,
          title : result.title,
          textBody : result.message,
          autoClose : 2000
        });
        resetForm();
        setSubmitting(false);
        setTimeout(()=>{
          this.setState({
            imageUri : null
          },()=>{
            navigation.goBack();
          })
        },2000);
      }else{
        if (status===422){
          Dialog.show({
            type : ALERT_TYPE.DANGER,
            title : result.title,
            textBody : result.message,
            button : "Kapat",
            autoClose : 2000
          });
          setSubmitting(false);
        }else{
          Dialog.show({
            type : ALERT_TYPE.DANGER,
            title : result.title,
            textBody : result.message,
            button : "Kapat",
            autoClose : 2000
          });
          setSubmitting(false);
          this.props.AuthStore.removeToken();
        }
      }
    }).catch((err)=>{
      console.log(err);
      Dialog.show({
        type: ALERT_TYPE.DANGER,
        title: "Hata",
        textBody: "Sunucu bazlı bir hata oluştu. Lütfen daha sonra tekrar deneyiniz",
        button: "Kapat",
        autoClose: 2000,
      });
      setSubmitting(false);
      this.props.AuthStore.removeToken();
    })
  };

  render() {
    const { imageUri } = this.state;
    const { navigation } = this.props;

    return (
      <AuthLayout>
        <View style={styles.container}>
          <CustomHeader />
          <ScrollView showsVerticalScrollIndicator={false} bounces>
            {imageUri !== null && <Image style={styles.image} source={{ uri: imageUri }} />}
            <Formik enableReinitialize={true} innerRef={(ref) => {
              this.formikRef = ref;
            }} initialValues={{
              img_name: "",
              img_desc: "",
              img_image: "",
            }} validationSchema={Yup.object().shape({
              img_name: Yup.string().required("Başlık alanı boş bırakılamaz"),
              img_image: Yup.object().required("Resim alanı gereklidir"),
            })} onSubmit={this._handleSubmit}>
              {({
                  values,
                  errors,
                  touched,
                  handleChange,
                  handleBlur,
                  handleSubmit,
                  isValid,
                  isSubmitting,
                  setFieldValue,
                }) => (
                <View>
                  <View style={styles.top_buttons_area}>
                    <TouchableOpacity onPress={()=>navigation.navigate("OpenCamera")} style={styles.top_left_button}>
                      <MaterialCommunityIcons name={"camera"} color={"#000"} size={40} />
                      <Text style={styles.top_left_button_text}>Kamerayı Aç</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={()=>this.selectImage(setFieldValue)} style={styles.top_right_button}>
                      <MaterialCommunityIcons name={"image-plus"} color={"#000"} size={40} />
                      <Text style={styles.top_right_button_text}>Resim Ekle</Text>
                    </TouchableOpacity>
                  </View>
                  {(touched.img_image && errors.img_image) && <Text style={styles.error_text}>{errors.img_image}</Text>}

                  <View style={styles.form_area}>
                    <View style={styles.title_area}>
                      <Text style={styles.title_text}>Başlık</Text>
                      <View style={styles.title_input_area}>
                        <TextInput style={styles.title_input} value={values.img_name}
                                   onChangeText={handleChange("img_name")} onBlur={handleBlur("img_name")}
                                   placeholderTextColor={"#000"} placeholder={"Başlık Giriniz..."} />
                      </View>
                    </View>
                    {(touched.img_name && errors.img_name) && <Text style={styles.error_text}>{errors.img_name}</Text>}

                    <View style={styles.desc_area}>
                      <Text style={styles.desc_text}>Açıklama</Text>
                      <View style={styles.desc_input_area}>
                        <TextInput style={styles.desc_input} value={values.img_desc}
                                   onChangeText={handleChange("img_desc")} onBlur={handleBlur("img_desc")}
                                   placeholderTextColor={"#000"} placeholder={"Açıklama Giriniz..."} />
                      </View>
                    </View>
                    {(touched.img_desc && errors.img_desc) && <Text style={styles.error_text}>{errors.img_desc}</Text>}

                    <View style={styles.save_button_area}>
                      <TouchableOpacity disabled={(!isValid || isSubmitting)} onPress={handleSubmit} style={styles.save_button}>
                        <Text style={styles.save_button_text}>Yeni Ekle</Text>
                      </TouchableOpacity>
                    </View>

                  </View>
                </View>
              )}
            </Formik>
          </ScrollView>
        </View>
      </AuthLayout>
    );
  }
}
