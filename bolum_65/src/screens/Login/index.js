import React, { Component } from "react";
import { Image, ScrollView, Text, TextInput, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import Fontisto from "react-native-vector-icons/Fontisto";
import Ionicons from "react-native-vector-icons/Ionicons";

export default class Login extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isSecure: true,
    };
  }

  render() {
    const { isSecure } = this.state;
    const {navigation} = this.props;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false}>
          <View style={styles.form_top_area}>
            <Image style={styles.form_top_image} resizeMode={"contain"}
                   source={require("../../assets/logo/mfsoftware-blog.png")} />
            <Text style={styles.form_top_text}>Galeri Giriş Ekranı</Text>
          </View>
          <View style={styles.form_area}>
            <View style={styles.form_email_area}>
              <TextInput style={styles.form_email_input} placeholder={"E-Mail Adresiniz..."}
                         keyboardType={"email-address"}
                         placeholderTextColor={"#737373"} />
              <Fontisto name={"email"} size={23} color={"black"} style={styles.form_email_icon}/>
            </View>

            <View style={styles.form_password_area}>
              <TextInput style={styles.form_password_input} placeholder={"Şifreniz..."}
                         secureTextEntry={isSecure}
                         placeholderTextColor={"#737373"} />
              <TouchableOpacity onPress={()=>this.setState({isSecure  :!isSecure})}>
                <Ionicons name={isSecure ? "eye" : "eye-off"} size={23} color={"black"} style={styles.form_password_icon}/>
              </TouchableOpacity>
            </View>

            <TouchableOpacity style={styles.form_login_button}>
              <Text style={styles.form_login_button_text}>Giriş Yap</Text>
            </TouchableOpacity>
          </View>

          <TouchableOpacity onPress={()=>navigation.navigate("Register")} style={styles.signup_text_area}>
            <Text style={styles.signup_text}>Henüz hesabın yok mu ? Kayıt Ol</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
