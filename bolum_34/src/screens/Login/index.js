import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import Ionicons from "react-native-vector-icons/Ionicons";
import { Formik } from "formik";
import * as Yup from "yup";

export default class Login extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isSecure : true
    }
  }

  _handleSubmit = (values,{setSubmitting,resetForm})=>{
    console.log(values);
    resetForm();
    setSubmitting(false);
  }

  render() {
    const {navigation} = this.props;
    const {isSecure} = this.state;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false} bounces>
          <View style={styles.image_container}>
            <Image style={styles.image} source={require("../../assets/logo.png")} />
          </View>
          <Formik initialValues={{
            email : '',
            password : ''
          }}
                  validationSchema={Yup.object().shape({
                    email : Yup.string().required("E-Mail Adresi Gereklidir").email("Lütfen geçerli bir E-Mail Afresi giriniz"),
                    password : Yup.string().required("Şifre alanı gereklidir").min(8,"Şifreniz minimum 8 karakter olmak zorundadır").max(16,"Şifreniz maksimum 16 karakter olmak zorundadır")
                  })}
                  onSubmit={this._handleSubmit}>
            {({values,touched,errors,handleChange,handleBlur,handleSubmit,isValid,isSubmitting})=>(
            <View>
              <View style={styles.email_area}>
                <TextInput value={values.email} onChangeText={handleChange('email')} onBlur={handleBlur('email')} keyboardType={"email-address"} style={styles.input_style} placeholderTextColor={"#949494"}
                           placeholder={"E-Mail adresiniz veya Telefon Numaranız"} />
              </View>
              {(touched.email && errors.email) && <Text style={styles.error_text}>{errors.email}</Text>}

              <View style={styles.password_area}>
                <TextInput value={values.password} onChangeText={handleChange('password')} onBlur={handleBlur('password')} secureTextEntry={isSecure} style={styles.input_style} placeholderTextColor={"#949494"}
                           placeholder={"Şifreniz"} />
                <TouchableOpacity onPress={()=>this.setState({isSecure : !isSecure})}>
                  <Ionicons name={(isSecure) ? "eye-off" : "eye"} size={20} color={"#ccc"} style={styles.icon_style}/>
                </TouchableOpacity>
              </View>
              {(touched.password && errors.password) && <Text style={styles.error_text}>{errors.password}</Text>}

              <TouchableOpacity disabled={(!isValid || isSubmitting)} onPress={handleSubmit} style={styles.button_style}>
                <Text style={styles.button_text}>Giriş Yap</Text>
              </TouchableOpacity>
            </View>
            )}
          </Formik>
          <TouchableOpacity onPress={()=>navigation.navigate("Register")} style={styles.footer_button_style}>
            <Text style={styles.footer_button_text}>Henüz yeni misin ?
              Kayıt Ol</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
