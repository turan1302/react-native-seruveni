import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import Fontisto from "react-native-vector-icons/Fontisto";
import Ionicons from "react-native-vector-icons/Ionicons";
import { Formik } from "formik";
import * as Yup from "yup";

import { inject, observer } from "mobx-react";

@inject("AuthStore")
@observer

export default class Login extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isSecure: true,
    };
  }

  _handleSubmit = (values, { resetForm, setSubmitting }) => {
    console.log(values);
  };

  render() {

    const { isSecure } = this.state;
    const { navigation } = this.props;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false}>
          <View style={styles.form_top_area}>
            <Image style={styles.form_top_image} resizeMode={"contain"}
                   source={require("../../assets/logo/mfsoftware-blog.png")} />
            <Text style={styles.form_top_text}>Galeri Giriş Ekranı</Text>
          </View>
          <Formik enableReinitialize={true} initialValues={{
            email: "",
            password: "",
          }}
                  validationSchema={Yup.object().shape({
                    email: Yup.string().required("E-Mail adresi zorunludur").email("Lütfen geçerli bir E-Mail adresi giriniz"),
                    password: Yup.string().required("Şİfre alanı zorunludur").min(8, "Şifreniz en az 8 karakter olmak zorundadır").max(16, "Şifreniz en fazla 16 karakter olmak zorundadır"),
                  })}
                  onSubmit={this._handleSubmit}>
            {({ values, touched, errors, handleChange, handleBlur, handleSubmit, isValid, isSubmitting }) => (
              <View style={styles.form_area}>
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

                <TouchableOpacity
                  onPress={handleSubmit} disabled={(!isValid || isSubmitting)}
                  style={styles.form_login_button}>
                  <Text style={styles.form_login_button_text}>Giriş Yap</Text>
                </TouchableOpacity>
              </View>
            )}
          </Formik>

          <TouchableOpacity onPress={() => navigation.navigate("Register")} style={styles.signup_text_area}>
            <Text style={styles.signup_text}>Henüz hesabın yok mu ? Kayıt Ol</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
