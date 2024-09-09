import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

export default class Detail extends Component {
  render() {
    const {params} = this.props.route;

    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text style={{ fontWeight: "bold", fontSize: 20 }}>Burası Detay</Text>
        <Text style={{ fontWeight: "bold", fontSize: 20 }}>İsim: {params.name} | Yaş: {params.age} | Renk: {params.color[0]}</Text>
      </View>
    )
  }
}
