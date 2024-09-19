import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import Ionicons from "react-native-vector-icons/Ionicons";
import { Formik } from "formik";
import * as Yup from "yup";

export default class Register extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isSecure : true,
      isConfirmSecure : true,
    }
  }

  _handleSubmit = (values,{setSubmitting,resetForm})=>{
    console.log(values);
    resetForm();
    setSubmitting(false);
  }

  render() {
    const {navigation} = this.props;
    const {isSecure,isConfirmSecure} = this.state;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false} bounces>
          <View style={styles.image_container}>
            <Image style={styles.image} source={require("../../assets/logo.png")} />
          </View>

          <Formik initialValues={{
            full_name : '',
            email : '',
            password : '',
            password_confirmation : ''
          }}
                  validationSchema={Yup.object().shape({
                    full_name : Yup.string().required("Ad Soyad Adresi Gereklidir"),
                    email : Yup.string().required("E-Mail Adresi Gereklidir").email("Lütfen geçerli bir E-Mail Afresi giriniz"),
                    password : Yup.string().required("Şifre alanı gereklidir").min(8,"Şifreniz minimum 8 karakter olmak zorundadır").max(16,"Şifreniz maksimum 16 karakter olmak zorundadır"),
                    password_confirmation : Yup.string().required("Şifre  Tekrar alanı gereklidir").min(8,"Şifreniz minimum 8 karakter olmak zorundadır").max(16,"Şifreniz maksimum 16 karakter olmak zorundadır").oneOf([Yup.ref("password"),null],"Şifreler eşleşmiyor")
                  })}
                  onSubmit={this._handleSubmit}>
            {({values,touched,errors,handleChange,handleBlur,handleSubmit,isValid,isSubmitting})=>(
            <View>
              <View style={styles.fullname_area}>
                <TextInput value={values.full_name} onChangeText={handleChange('full_name')} onBlur={handleBlur('full_name')} style={styles.input_style} placeholderTextColor={"#949494"}
                           placeholder={"Adınız Soyadınız..."} />
              </View>
              {(touched.full_name && errors.full_name) && <Text style={styles.error_text}>{errors.full_name}</Text>}

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

              <View style={styles.password_confirmation_area}>
                <TextInput value={values.password_confirmation} onChangeText={handleChange('password_confirmation')} onBlur={handleBlur('password_confirmation')} secureTextEntry={isConfirmSecure} style={styles.input_style} placeholderTextColor={"#949494"}
                           placeholder={"Şifreniz (Tekrar)"} />
                <TouchableOpacity onPress={()=>this.setState({isConfirmSecure : !isConfirmSecure})}>
                  <Ionicons name={(isConfirmSecure) ? "eye-off" : "eye"} size={20} color={"#ccc"} style={styles.icon_style}/>
                </TouchableOpacity>
              </View>
              {(touched.password_confirmation && errors.password_confirmation) && <Text style={styles.error_text}>{errors.password_confirmation}</Text>}

              <TouchableOpacity disabled={(!isValid || isSubmitting)} onPress={handleSubmit} style={styles.button_style}>
                <Text style={styles.button_text}>Kayıt Ol</Text>
              </TouchableOpacity>
            </View>
            )}
          </Formik>
          <TouchableOpacity onPress={()=>navigation.navigate("Login")} style={styles.footer_button_style}>
            <Text style={styles.footer_button_text}>Zaten üye misin? Giriş yap</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
