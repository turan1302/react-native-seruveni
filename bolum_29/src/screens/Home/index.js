import React, { Component } from "react";
import { Text, TouchableOpacity, View } from "react-native";

export default class Home extends Component {

  componentDidMount() {
    const {navigation} = this.props;

    navigation.addListener("blur",()=>{
      alert("Anasayfa içerisinden çıkış yapıldı");
    });
  }

  render() {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text style={{ color: "black", fontSize: 20 }}>Anasayfa</Text>
        <TouchableOpacity onPress={()=>this.props.navigation.navigate("Detail")} style={{
          backgroundColor: "gray",
          paddingVertical: 20,
          paddingHorizontal: 40,
          marginTop: 15,
          borderRadius: 20,
        }}>
          <Text style={{ color: "white" }}>Detaya Git</Text>
        </TouchableOpacity>
      </View>
    );
  }
}
