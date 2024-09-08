import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

export default class Home extends Component {
  render() {
    const {navigation} = this.props;

    return (
      <View style={{flex : 1,justifyContent : "center",alignItems : "center"}}>
        <Text style={{fontWeight : "bold",fontSize : 16}}> Burası Anasayfa </Text>
        <TouchableOpacity onPress={()=>navigation.navigate("Detail",{
          name : "MFSoftware Blog"
        })} style={{padding : 10,backgroundColor : "#004856",marginTop : 10,borderRadius : 20}}>
          <Text style={{color : "white",fontWeight : "bold",fontSize : 20}}>Detaya Git</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
