import React, { Component } from 'react'
import { Text, View } from 'react-native'

export default class App extends Component {
  render() {
    return (
        <Text style={{
          textAlign : "center",
          alignSelf : "center",
          marginTop : 30,
          backgroundColor : "red",
          padding : 10,
          color  : "white",
          fontSize : 30,
          fontWeight : "300",
          letterSpacing : 0,
          textDecorationLine : "line-through",
          textTransform  :"lowercase",

          borderWidth : 2,
          borderColor : "green",
          borderTopRightRadius : 10,
          borderBottomRightRadius: 30
        }}>
          asdas
        </Text>
    )
  }
}
