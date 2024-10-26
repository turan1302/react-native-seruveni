import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import Fontisto from "react-native-vector-icons/Fontisto";
import Ionicons from "react-native-vector-icons/Ionicons";
import { Formik } from "formik";
import * as Yup from "yup";
import RestClient from "../../RestAPI/RestClient";
import AppUrl from "../../RestAPI/AppUrl";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";

export default class Login extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isSecure: true,
      isConfirmSecure: true,
    };
  }

  _handleSubmit = async (values, { resetForm, setSubmitting }) => {
    const { navigation } = this.props;

    await RestClient.postRequest(AppUrl.register, values).then((res) => {
      const status = res.status;
      const result = res.data;

      if (status === 201) {
        Dialog.show({
          type: ALERT_TYPE.SUCCESS,
          title: result.title,
          textBody: result.message,
          autoClose: 2000,
        });
        resetForm();
        setSubmitting(false);
        setTimeout(() => {
          navigation.navigate("Login");
        }, 2000);
      } else {
        if (status===422){
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          setSubmitting(false);
        }else{
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: "Hata",
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          setSubmitting(false);
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
      setSubmitting(false);
    });
  };

  render() {
    const { isSecure, isConfirmSecure } = this.state;
    const { navigation } = this.props;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false}>
          <View style={styles.form_top_area}>
            <Image style={styles.form_top_image} resizeMode={"contain"}
                   source={require("../../assets/logo/mfsoftware-blog.png")} />
            <Text style={styles.form_top_text}>Galeri Kayıt Ekranı</Text>
          </View>
          <Formik enableReinitialize={true} initialValues={{
            c_name: "",
            c_surname: "",
            email: "",
            password: "",
            password_confirmation: "",
          }}
                  validationSchema={Yup.object().shape({
                    c_name: Yup.string().required("Adınız alanı zorunludur"),
                    c_surname: Yup.string().required("Soyadınız alanı zorunludur"),
                    email: Yup.string().required("E-Mail adresi alanı zorunludur").email("Lütfen geçerli bir E-Mail adresi giriniz"),
                    password: Yup.string().required("Şİfre alanı zorunludur").min(8, "Şifreniz en az 8 karakter olmak zorundadır").max(16, "Şifreniz en fazla 16 karakter olmak zorundadır"),
                    password_confirmation: Yup.string().required("Şifre Tekrar alanı zorunludur").min(8, "Şifreniz en az 8 karakter olmak zorundadır").max(16, "Şifreniz en fazla 16 karakter olmak zorundadır").oneOf([Yup.ref("password"), null], "Şifreler eşleşmiyor"),
                  })}
                  onSubmit={this._handleSubmit}>
            {({ values, touched, errors, handleChange, handleBlur, handleSubmit, isValid, isSubmitting }) => (
              <View style={styles.form_area}>
                <View style={styles.form_name_area}>
                  <TextInput
                    value={values.c_name} onChangeText={handleChange("c_name")} onBlur={handleBlur("c_name")}
                    style={styles.form_name_input} placeholder={"Adınız..."}
                    placeholderTextColor={"#737373"} />
                  <Fontisto name={"person"} size={23} color={"black"} style={styles.form_name_icon} />
                </View>
                {(touched.c_name && errors.c_name) && <Text style={styles.error_text}>{errors.c_name}</Text>}


                <View style={styles.form_surname_area}>
                  <TextInput
                    value={values.c_surname} onChangeText={handleChange("c_surname")} onBlur={handleBlur("c_surname")}
                    style={styles.form_surname_input} placeholder={"Soyadınız..."}
                    placeholderTextColor={"#737373"} />
                  <Fontisto name={"person"} size={23} color={"black"} style={styles.form_surname_icon} />
                </View>
                {(touched.c_surname && errors.c_surname) && <Text style={styles.error_text}>{errors.c_surname}</Text>}


                <View style={styles.form_email_area}>
                  <TextInput
                    value={values.email} onChangeText={handleChange("email")} onBlur={handleBlur("email")}
                    style={styles.form_email_input} placeholder={"E-Mail Adresiniz..."}
                    keyboardType={"email-address"}
                    placeholderTextColor={"#737373"} />
                  <Fontisto name={"email"} size={23} color={"black"} style={styles.form_email_icon} />
                </View>
                {(touched.email && errors.email) && <Text style={styles.error_text}>{errors.email}</Text>}


                <View style={styles.form_password_area}>
                  <TextInput
                    value={values.password} onChangeText={handleChange("password")} onBlur={handleBlur("password")}
                    style={styles.form_password_input} placeholder={"Şifreniz..."}
                    secureTextEntry={isSecure}
                    placeholderTextColor={"#737373"} />
                  <TouchableOpacity onPress={() => this.setState({ isSecure: !isSecure })}>
                    <Ionicons name={isSecure ? "eye" : "eye-off"} size={23} color={"black"}
                              style={styles.form_password_icon} />
                  </TouchableOpacity>
                </View>
                {(touched.password && errors.password) && <Text style={styles.error_text}>{errors.password}</Text>}


                <View style={styles.form_password_confirm_area}>
                  <TextInput
                    value={values.password_confirmation} onChangeText={handleChange("password_confirmation")}
                    onBlur={handleBlur("password_confirmation")}
                    style={styles.form_password_confirm_input} placeholder={"Şifreniz (Tekrar)..."}
                    secureTextEntry={isConfirmSecure}
                    placeholderTextColor={"#737373"} />
                  <TouchableOpacity onPress={() => this.setState({ isConfirmSecure: !isConfirmSecure })}>
                    <Ionicons name={isConfirmSecure ? "eye" : "eye-off"} size={23} color={"black"}
                              style={styles.form_password_confirm_icon} />
                  </TouchableOpacity>
                </View>
                {(touched.password_confirmation && errors.password_confirmation) &&
                  <Text style={styles.error_text}>{errors.password_confirmation}</Text>}


                <TouchableOpacity
                  onPress={handleSubmit} disabled={(!isValid || isSubmitting)}
                  style={styles.form_register_button}>
                  <Text style={styles.form_register_button_text}>Kayıt Ol</Text>
                </TouchableOpacity>
              </View>
            )}
          </Formik>

          <TouchableOpacity onPress={() => navigation.navigate("Login")} style={styles.signin_text_area}>
            <Text style={styles.signin_text}>Zaten üye misin ? Giriş Yap</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
