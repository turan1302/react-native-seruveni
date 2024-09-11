import React, { Component } from "react";
import { Text, TouchableOpacity, View } from "react-native";

export default class Home extends Component {
  render() {
    const { navigation } = this.props;

    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <TouchableOpacity onPress={()=>navigation.openDrawer()} style={{backgroundColor : "gray",padding : 15,borderRadius : 10}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Menüyü Aç</Text>
        </TouchableOpacity>
      </View>
    );
  }
}
