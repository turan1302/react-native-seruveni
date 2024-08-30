import React, { Component } from "react";
import { ImageBackground, Text, View } from "react-native";

export default class App extends Component {
  render() {
    return (
      <ImageBackground
        imageStyle={{
          borderRadius: 20
        }}
        onLoadStart={()=>alert("Başladı")}
        onLoadEnd={()=>alert("Bitti")}
        style={{
          width: 259,
          height: 250,
          marginTop: 50,
          marginLeft: 30,
          justifyContent: "space-between",
          alignItems: "flex-end",
          padding: 20
        }} source={require("./src/assets/turk.jpg")}>
        <Text style={{ fontSize: 20, color: "white" }}>Test</Text>
        <Text style={{ fontSize: 20, color: "white" }}>Test</Text>
      </ImageBackground>
    );
  }
}
