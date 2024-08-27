import React, { Component } from "react";
import { Text, View } from "react-native";

export default class App extends Component {

  checkLayout = (e)=>{
    const {x,y,height,width} = e.nativeEvent.layout;
    console.log("X değeri: ",x);
    console.log("Y değeri: ",y);
    console.log("Width değeri: ",width);
    console.log("Height değeri: ",height);
  }

  render() {
    return (
      <View style={{ backgroundColor: "red", width: 150, height: 150, marginLeft: 30, marginTop: 50 }}
            onLayout={this.checkLayout}>

      </View>
    );
  }
}
