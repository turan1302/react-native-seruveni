import React, { Component } from "react";
import { Text, TouchableOpacity, View } from "react-native";

export default class Home extends Component {
  render() {
    const { navigation } = this.props;

    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text style={{ fontWeight: "bold", fontSize: 20 }}>Burası Anasayfa</Text>
        <TouchableOpacity onPress={() => navigation.navigate("Detail",{
          name : "MFSoftware Blog",
          age : 25,
          color : ["red","green"]
        })}
                          style={{ backgroundColor: "black", paddingVertical: 10,paddingHorizontal  :20,marginTop : 10,borderRadius : 20}}>
          <Text style={{ color: "white", fontSize: 14, fontWeight: "bold" }}>Detaya Git</Text>
        </TouchableOpacity>
      </View>
    );
  }
}
