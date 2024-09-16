import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";

export default class Login extends Component {
  render() {
    const {navigation} = this.props;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false} bounces>
          <View style={styles.image_container}>
            <Image style={styles.image} source={require("../../assets/logo.png")} />
          </View>
          <View>
            <View style={styles.email_area}>
              <TextInput keyboardType={"email-address"} style={styles.input_style} placeholderTextColor={"#949494"}
                         placeholder={"E-Mail adresiniz veya Telefon Numaranız"} />
            </View>
            <View style={styles.password_area}>
              <TextInput secureTextEntry={true} style={styles.input_style} placeholderTextColor={"#949494"}
                         placeholder={"Şifreniz"} />
            </View>
            <TouchableOpacity style={styles.button_style}>
              <Text style={styles.button_text}>Giriş Yap</Text>
            </TouchableOpacity>
          </View>
          <TouchableOpacity onPress={()=>navigation.navigate("Register")} style={styles.footer_button_style}>
            <Text style={styles.footer_button_text}>Henüz yeni misin ?
              Kayıt Ol</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
