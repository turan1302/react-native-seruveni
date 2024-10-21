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
      isConfirmSecure : true
    };
  }

  render() {
    const { isSecure,isConfirmSecure } = this.state;
    const {navigation} = this.props;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false}>
          <View style={styles.form_top_area}>
            <Image style={styles.form_top_image} resizeMode={"contain"}
                   source={require("../../assets/logo/mfsoftware-blog.png")} />
            <Text style={styles.form_top_text}>Galeri Kayıt Ekranı</Text>
          </View>
          <View style={styles.form_area}>
            <View style={styles.form_name_area}>
              <TextInput style={styles.form_name_input} placeholder={"Adınız..."}
                         placeholderTextColor={"#737373"} />
              <Fontisto name={"person"} size={23} color={"black"} style={styles.form_name_icon}/>
            </View>

            <View style={styles.form_surname_area}>
              <TextInput style={styles.form_surname_input} placeholder={"Soyadınız..."}
                         placeholderTextColor={"#737373"} />
              <Fontisto name={"person"} size={23} color={"black"} style={styles.form_surname_icon}/>
            </View>

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

            <View style={styles.form_password_confirm_area}>
              <TextInput style={styles.form_password_confirm_input} placeholder={"Şifreniz (Tekrar)..."}
                         secureTextEntry={isConfirmSecure}
                         placeholderTextColor={"#737373"} />
              <TouchableOpacity onPress={()=>this.setState({isConfirmSecure  :!isConfirmSecure})}>
                <Ionicons name={isConfirmSecure ? "eye" : "eye-off"} size={23} color={"black"} style={styles.form_password_confirm_icon}/>
              </TouchableOpacity>
            </View>

            <TouchableOpacity style={styles.form_register_button}>
              <Text style={styles.form_register_button_text}>Kayıt Ol</Text>
            </TouchableOpacity>
          </View>

          <TouchableOpacity onPress={()=>navigation.navigate("Login")} style={styles.signin_text_area}>
            <Text style={styles.signin_text}>Zaten üye misin ? Giriş Yap</Text>
          </TouchableOpacity>
        </ScrollView>
      </View>
    );
  }
}
