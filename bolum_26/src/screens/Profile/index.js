import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

export default class Profile extends Component {
  render() {
    const { navigation } = this.props;

    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <TouchableOpacity onPress={()=>navigation.goBack()} style={{backgroundColor : "gray",padding : 15,borderRadius : 10}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Geriye Dön</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
