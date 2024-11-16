import React, { Component } from "react";
import { ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import { inject, observer } from "mobx-react";
import AuthLayout from "../../../components/Layout/AuthLayout";
import Loader from "../../../components/Profile/ProfileAccount/Loader";
import styles from "./styles";
import { Formik } from "formik";
import * as Yup from "yup";
import Fontisto from "react-native-vector-icons/Fontisto";
import Ionicons from "react-native-vector-icons/Ionicons";
import RestClient from "../../../RestAPI/RestClient";
import AppUrl from "../../../RestAPI/AppUrl";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";

@inject("AuthStore")
@observer

export default class ProfileAccount extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isLoading: true,
      isSecure: true,
      isConfirmSecure: true,

      client: {},
    };
  }

  componentDidMount() {
    const { navigation } = this.props;

    navigation.addListener("focus", async () => {
      await this.getUserInfo();
    });

    navigation.addListener("blur", async () => {
      this.setState({
        client: {},
      });
    });
  }

  getUserInfo = async ()=>{
    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.getRequest(AppUrl.profile,{
      headers : {
        "Authorization" : "Bearer "+token
      }
    }).then((res)=>{
      const result = res.data;
      const status = res.status;

      if (status===200){
        this.setState({
          isLoading : false,
          client : result.data.user
        });
      }

      if (status===401){
        this.props.AuthStore.removeToken();
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
      this.props.AuthStore.removeToken();
    })
  }

  _handleSubmit = async (values, { resetForm, setSubmitting }) => {
    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.postRequest(AppUrl.update_profile,values,{
      headers : {
        "Authorization" : "Bearer "+token
      }
    }).then((res)=>{
      const result = res.data;
      const status = res.status;

      if (status===200){

        Dialog.show({
          type : ALERT_TYPE.SUCCESS,
          title : result.title,
          textBody : result.message,
          button : "Kapat",
          autoClose : 2000
        });
        setSubmitting(false);
        setTimeout(()=>{
          this.props.AuthStore.removeToken();
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
        }
      }

    }).catch((err)=>{
      Dialog.show({
        type: ALERT_TYPE.DANGER,
        title: "Hata",
        textBody: "Sunucu bazlı bir hata oluştu. Lütfen daha sonra tekrar deneyiniz",
        button: "Kapat",
        autoClose: 2000,
      });
      setSubmitting(false);
      setTimeout(()=>{
        this.props.AuthStore.removeToken();
      },2000);
    });
  };

  render() {
    const { isSecure, isConfirmSecure, client, isLoading } = this.state;
    const { navigation } = this.props;

    return (
      <AuthLayout>
        {isLoading ? (<Loader />) : (
          <View style={styles.container}>
            <ScrollView showsVerticalScrollIndicator={false}>
              <Formik enableReinitialize={true} initialValues={{
                c_name: client.c_name,
                c_surname: client.c_surname,
                email: client.email,
                password: "",
                password_confirmation: "",
              }} validationSchema={Yup.object().shape({
                c_name: Yup.string().required("Adınız alanı zorunludur"),
                c_surname: Yup.string().required("Soyadınız alanı zorunludur"),
                email: Yup.string().required("E-Mail adresi alanı zorunludur").email("Lütfen geçerli bir E-Mail adresi giriniz"),
                password: Yup.string().min(8, "Şifreniz en az 8 karakter olmak zorundadır").max(16, "Şifreniz en fazla 16 karakter olmak zorundadır"),
                password_confirmation: Yup.string().min(8, "Şifre Tekrar alanı en az 8 karakter olmak zorundadır").max(16, "Şifre Tekrar alanı en fazla 16 karakter olmak zorundadır").oneOf([Yup.ref("password"), null], "Şifreler eşleşmiyor"),

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
                  }) => (
                  <View>
                    <View style={styles.form_name_area}>
                      <TextInput value={values.c_name} onChangeText={handleChange("c_name")}
                                 onBlur={handleBlur("c_name")} style={styles.form_name_input} placeholder={"Adınız..."}
                                 placeholderTextColor={"#737373"} />
                      <Fontisto name={"person"} size={23} color={"#000"} style={styles.form_name_icon} />
                    </View>
                    {(touched.c_name && errors.c_name) && <Text style={styles.error_text}>{errors.c_name}</Text>}

                    <View style={styles.form_surname_area}>
                      <TextInput value={values.c_surname} onChangeText={handleChange("c_surname")}
                                 onBlur={handleBlur("c_surname")} style={styles.form_surname_input}
                                 placeholder={"Soyadınız..."} placeholderTextColor={"#737373"} />
                      <Fontisto name={"person"} size={23} color={"#000"} style={styles.form_surname_icon} />
                    </View>
                    {(touched.c_surname && errors.c_surname) &&
                      <Text style={styles.error_text}>{errors.c_surname}</Text>}

                    <View style={styles.form_email_area}>
                      <TextInput value={values.email} onChangeText={handleChange("email")}
                                 onBlur={handleBlur("email")} style={styles.form_email_input}
                                 placeholder={"E-Mail Adresiniz..."} placeholderTextColor={"#737373"} />
                      <Fontisto name={"email"} size={23} color={"#000"} style={styles.form_email_icon} />
                    </View>
                    {(touched.email && errors.email) && <Text style={styles.error_text}>{errors.email}</Text>}

                    <View style={styles.form_password_area}>
                      <TextInput secureTextEntry={isSecure} value={values.password}
                                 onChangeText={handleChange("password")}
                                 onBlur={handleBlur("password")} style={styles.form_password_input}
                                 placeholder={"Şifreniz..."} placeholderTextColor={"#737373"} />
                      <TouchableOpacity onPress={() => this.setState({ isSecure: !isSecure })}>
                        <Ionicons name={isSecure ? "eye" : "eye-off"} size={23} color={"#000"}
                                  style={styles.form_password_icon} />
                      </TouchableOpacity>
                    </View>
                    {(touched.password && errors.password) && <Text style={styles.error_text}>{errors.password}</Text>}

                    <View style={styles.form_password_confirm_area}>
                      <TextInput secureTextEntry={isConfirmSecure} value={values.password_confirmation}
                                 onChangeText={handleChange("password_confirmation")}
                                 onBlur={handleBlur("password_confirmation")} style={styles.form_password_confirm_input}
                                 placeholder={"Şifreniz (Tekrar)..."} placeholderTextColor={"#737373"} />
                      <TouchableOpacity onPress={() => this.setState({ isConfirmSecure: !isConfirmSecure })}>
                        <Ionicons name={isConfirmSecure ? "eye" : "eye-off"} size={23} color={"#000"}
                                  style={styles.form_password_confirm_icon} />
                      </TouchableOpacity>
                    </View>
                    {(touched.password_confirmation && errors.password_confirmation) && <Text style={styles.error_text}>{errors.password_confirmation}</Text>}

                    <TouchableOpacity onPress={handleSubmit} disabled={(!isValid || isSubmitting)} style={styles.form_account_update_button}>
                      <Text style={styles.form_account_update_button_text}>Güncelle</Text>
                    </TouchableOpacity>
                  </View>
                )}
              </Formik>
            </ScrollView>
          </View>
        )}
      </AuthLayout>
    );
  }
}
