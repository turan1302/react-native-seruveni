import { Component } from "react";
import { Text, View } from "react-native";

export default class ClassComponent extends Component{
  render() {
    return (
      <View style={{backgroundColor : "blue",height : 100}}>
        <Text style={{color : "white"}}>Bu Class Bazlı Component</Text>
      </View>
    )
  }
}
