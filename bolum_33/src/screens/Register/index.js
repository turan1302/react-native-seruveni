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

  render() {
    const {navigation} = this.props;
    const {isSecure,isConfirmSecure} = this.state;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false} bounces>
          <View style={styles.image_container}>
            <Image style={styles.image} source={require("../../assets/logo.png")} />
          </View>
          <View>
            <View style={styles.fullname_area}>
              <TextInput style={styles.input_style} placeholderTextColor={"#949494"}
                         placeholder={"Adınız Soyadınız..."} />
            </View>
            <View style={styles.email_area}>
              <TextInput keyboardType={"email-address"} style={styles.input_style} placeholderTextColor={"#949494"}
                         placeholder={"E-Mail adresiniz veya Telefon Numaranız"} />
            </View>
            <View style={styles.password_area}>
              <TextInput secureTextEntry={isSecure} style={styles.input_style} placeholderTextColor={"#949494"}
                         placeholder={"Şifreniz"} />
              <TouchableOpacity onPress={()=>this.setState({isSecure : !isSecure})}>
                <Ionicons name={(isSecure) ? "eye-off" : "eye"} size={20} color={"#ccc"} style={styles.icon_style}/>
              </TouchableOpacity>
            </View>
            <View style={styles.password_confirmation_area}>
              <TextInput secureTextEntry={isConfirmSecure} style={styles.input_style} placeholderTextColor={"#949494"}
                         placeholder={"Şifreniz (Tekrar)"} />
              <TouchableOpacity onPress={()=>this.setState({isConfirmSecure : !isConfirmSecure})}>
                <Ionicons name={(isConfirmSecure) ? "eye-off" : "eye"} size={20} color={"#ccc"} style={styles.icon_style}/>
              </TouchableOpacity>
            </View>
            <TouchableOpacity style={styles.button_style}>
              <Text style={styles.button_text}>Kayıt Ol</Text>
            </TouchableOpacity>
          </View>
          <TouchableOpacity onPress={()=>navigation.navigate("Login")} style={styles.footer_button_style}>
            <Text style={styles.footer_button_text}>Zaten üye misin? Giriş yap</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
