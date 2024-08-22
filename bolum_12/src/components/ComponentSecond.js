import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

export default class ComponentSecond extends Component {
  render() {
    const {name,getMessage} = this.props;

    return (
      <View>
        <Text style={{color :"black",fontSize : 20}}>{name}</Text>
        <TouchableOpacity style={{backgroundColor : "yellow",padding : 10,width : 150}} onPress={getMessage}>
          <Text style={{color : "black"}}>Değiştir</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
