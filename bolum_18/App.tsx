import React, { Component } from "react";
import { Image, Text, View } from "react-native";

export default class App extends Component {
  render() {
    return (
      <Image
        onLoadStart={()=>console.log("Yükleme Başladı")}
        onLoadEnd={()=>console.log("Yükleme Bitti")}
        resizeMode={"contain"} style={{
        width: 300,
        height: 300,
        borderRadius: 20,
        marginTop: 20
      }}
             source={{uri : "https://mfsoftware.net/storage/logo/mfsoftware-blog.png"}} />
    );
  }
}
