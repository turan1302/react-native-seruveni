import React, { Component } from "react";
import { Alert, Dimensions, Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import { inject, observer } from "mobx-react";
import Entypo from "react-native-vector-icons/Entypo";
import { Form, Formik } from "formik";
import * as Yup from "yup";
import RestClient from "../../../../RestAPI/RestClient";
import AppUrl from "../../../../RestAPI/AppUrl";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";
import { launchImageLibrary } from "react-native-image-picker";
import AuthLayout from "../../../../components/Layout/AuthLayout";
import Loader from "../../../../components/ShowImage/Loader";
import styles from "./styles";
import MaterialCommunityIcons from "react-native-vector-icons/MaterialCommunityIcons";

@inject("AuthStore")
@observer

export default class ImageDetail extends Component {

  constructor(props) {
    super(props);

    this.state = {
      windowDimensions: Dimensions.get("window"),
      isLoading: true,
      image: {},
      imageUri: null,
    };
  }

  componentDidMount() {
    const { route, navigation } = this.props;
    const { img_image } = route.params || { img_image: null };

    this.dimensionsSubscription = Dimensions.addEventListener("change", this.handleResize);

    navigation.setOptions({
      headerShown: true,
      title: "Resim Detay",
      headerShadowVisible: false,
      headerRight: () => (
        <TouchableOpacity onPress={() => {
          Alert.alert("Dikkat!", "Resim silinecektir. Onaylıyor musunuz", [
            {
              text: "Sil",
              onPress: this.removeImage,
            },
            {
              text: "Vazgeç",
            },
          ]);
        }}>
          <Entypo name={"trash"} color={"#000"} size={20} />
        </TouchableOpacity>
      ),
    });

    if (img_image) {
      this.setState({
        imgUri: img_image,
      });
    }

    navigation.addListener("blur", () => {
      this.setState({
        imageUri: null,
      });
    });

    this.getImage();
  }

  componentDidUpdate(prevProps, prevState, snapshot) {
    const { route } = this.props;

    if (prevProps.route.params?.img_image !== route.params?.img_image) {
      const uri = route.params?.img_image;
      this.formikRef.setFieldValue("img_image", {
        uri: uri,
        type: "image/jpg",
        name: "image.jpg",
      });

      this.setState({
        imageUri: route.params.img_image,
      });
    }
  }

  getImage = async () => {
    const { navigation, route } = this.props;

    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.getRequest(AppUrl.images_edit + `/${route.params.img_id}`, {
      headers: {
        "Authorization": "Bearer " + token,
      },
    }).then((res) => {
      const status = res.status;
      const result = res.data;

      if (status === 200) {
        this.setState({
          isLoading: false,
          image: result.data,
          imageUri: AppUrl.storageURL + result.data.img_image,
        });
      } else {
        if (status === 404) {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        } else {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        }
      }
    }).catch((err) => {
      Dialog.show({
        type: ALERT_TYPE.DANGER,
        title: "Hata",
        textBody: "Sunucu bazlı bir hata oluştu. Lütfen daha sonra tekrar deneyiniz",
        button: "Kapat",
        autoClose: 2000,
      });
      this.props.AuthStore.removeToken();
    });
  };

  removeImage = async () => {
    const { navigation, route } = this.props;

    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.postRequest(AppUrl.images_delete, {
      img_id: route.params.img_id,
    }, {
      headers: {
        "Authorization": "Bearer " + token,
      },
    }).then((res) => {
      const status = res.status;
      const result = res.data;

      if (status === 200) {
        Dialog.show({
          type: ALERT_TYPE.SUCCESS,
          title: result.title,
          textBody: result.message,
          autoClose: 2000,
        });
        setTimeout(() => {
          navigation.goBack();
        }, 2000);
      } else {
        if (status === 404) {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        } else {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        }
      }

    }).catch((err) => {
      Dialog.show({
        type: ALERT_TYPE.DANGER,
        title: "Hata",
        textBody: "Sunucu bazlı bir hata oluştu. Lütfen daha sonra tekrar deneyiniz",
        button: "Kapat",
        autoClose: 2000,
      });
      this.props.AuthStore.removeToken();
    });
  };

  componentWillUnmount() {
    if (this.dimensionsSubscription) {
      this.dimensionsSubscription.remove();
    }
  }

  handleResize = ({ window }) => {
    this.setState({
      windowDimensions: window,
    });
  };

  selectImage = (setFieldValue) => {
    const options = {
      mediaType: "photo",
      includeBase64: false,
    };

    launchImageLibrary(options, (response) => {
      if (response.didCancel) {
        console.log("Kullanıcı resim seçmeyi iptal etti");
      } else if (response.error) {
        console.log("ImagePicker error", response.error);
      } else {
        const uri = response.assets[0];
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

  _handleSubmit = async (values, { resetForm, setSubmitting, setFieldValue }) => {
    const { navigation, route } = this.props;
    const { image } = this.state;

    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    const formData = new FormData();
    formData.append("img_name", values.img_name);
    formData.append("img_image", values.img_image);
    formData.append("img_desc", values.img_desc);

    await RestClient.postRequest(AppUrl.images_update + `/${image.img_id}`, formData, {
      headers: {
        "Authorization": "Bearer " + token,
        "Content-Type": "multipart/form-data",
      },
    }).then((res) => {
      const status = res.status;
      const result = res.data;

      if (status === 200) {
        Dialog.show({
          type: ALERT_TYPE.SUCCESS,
          title: result.title,
          textBody: result.message,
          autoClose: 2000,
        });
        setSubmitting(false);
        setTimeout(() => {
          this.setState({
            imageUri: null,
          }, () => {
            navigation.goBack();
          });
        }, 2000);
      } else {
        if (status === 422) {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          setSubmitting(false);
        } else {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          setSubmitting(false);
          this.props.AuthStore.removeToken();
        }
      }
    }).catch((err) => {
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
    });
  };

  render() {
    const { image, imageUri, isLoading } = this.state;
    const { width, height } = this.state.windowDimensions;
    const position = width > height ? "LANDSCAPE" : "PORTRAIT";

    const { navigation } = this.props;

    return (
      <AuthLayout>
        {isLoading ? (<Loader />) : (
          <ScrollView showsVerticalScrollIndicator={false} style={styles.container}>
            {imageUri !== null && <Image source={{ uri: imageUri }} style={styles.image} />}
            <Formik innerRef={(ref) => {
              this.formikRef = ref;
            }} enableReinitialize={true} initialValues={{
              img_name: image.img_name,
              img_image: "",
              img_desc: image.img_desc,
            }}
                    validationSchema={Yup.object().shape({
                      img_name: Yup.string().required("Başlık alanı boş bırakılamaz"),
                      img_image: Yup.object(),
                    })}
                    onSubmit={this._handleSubmit}>
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
                    <TouchableOpacity onPress={() => navigation.navigate("OpenCamera")} style={styles.top_left_button}>
                      <MaterialCommunityIcons name={"camera"} color={"#000"} size={40} />
                      <Text style={styles.top_left_button_text}>Kamerayı Aç</Text>
                    </TouchableOpacity>
                    <TouchableOpacity onPress={() => this.selectImage(setFieldValue)} style={styles.top_right_button}>
                      <MaterialCommunityIcons name={"image-plus"} color={"#000"} size={40} />
                      <Text style={styles.top_right_button_text}>Resim Ekle</Text>
                    </TouchableOpacity>
                  </View>
                  {(touched.img_image && errors.img_image) &&
                    <Text style={[styles.error_text, { marginTop: 10 }]}>{errors.img_image}</Text>}

                  <View style={styles.form_area}>
                    <View style={styles.title_area}>
                      <Text style={styles.title_text}>Başlık</Text>
                      <View style={styles.title_input_area}>
                        <TextInput style={styles.title_input} value={values.img_name}
                                   onChangeText={handleChange("img_name")} onBlur={handleBlur("img_name")}
                                   placeholderTextColor={"#000"} placeholder={"Başlık Giriniz..."} />
                      </View>
                    </View>
                    {(touched.img_name && errors.img_name) &&
                      <Text style={[styles.error_text]}>{errors.img_name}</Text>}

                    <View style={styles.desc_area}>
                      <Text style={styles.desc_text}>Açıklama</Text>
                      <View style={styles.desc_input_area}>
                        <TextInput multiline style={styles.desc_input} value={values.img_desc}
                                   onChangeText={handleChange("img_desc")} onBlur={handleBlur("img_desc")}
                                   placeholderTextColor={"#000"} placeholder={"Açıklama Giriniz..."} />
                      </View>
                    </View>
                    {(touched.img_desc && errors.img_desc) &&
                      <Text style={[styles.error_text]}>{errors.img_desc}</Text>}

                    <View style={styles.save_button_area}>
                      <TouchableOpacity disabled={!isValid || isSubmitting} onPress={handleSubmit}
                                        style={styles.save_button}>
                        <Text style={styles.save_button_text}>Güncelle</Text>
                      </TouchableOpacity>
                    </View>
                  </View>
                </View>
              )}
            </Formik>
          </ScrollView>
        )}
      </AuthLayout>
    );
  }
}
