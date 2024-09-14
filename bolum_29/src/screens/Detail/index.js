import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

export default class Detail extends Component {

  componentDidMount() {
    const {navigation} = this.props;

    navigation.addListener("focus",()=>{
      alert("Detay içerisine giriş yapıldı");
    });
  }

  render() {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text style={{ color: "black", fontSize: 20 }}>Anasayfa</Text>
        <TouchableOpacity onPress={()=>this.props.navigation.goBack()} style={{
          backgroundColor: "red",
          paddingVertical: 20,
          paddingHorizontal: 40,
          marginTop: 15,
          borderRadius: 20,
        }}>
          <Text style={{ color: "white" }}>Geriye Dön</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
