import { Component } from "react";
import { Text, View } from "react-native";

export default class App extends Component{
  render() {
    // flexDirection : column - row
    // flex : 1 - 3 - 5

    return (
      /*
      <View style={{flex : 1,flexDirection : "column"}}>
        <View style={{flex : 2,height : "100%",backgroundColor : "red"}}/>
        <View style={{flex :1,height : "100%",backgroundColor : "green"}}/>
        <View style={{flex : 4,height : "100%",backgroundColor : "blue"}}/>
        <View style={{flex : 3,height : "100%",backgroundColor : "purple"}}/>
        <View style={{flex : 5,height : "100%",backgroundColor : "black"}}/>
      </View>

       */

      <View style={{flex : 1}}>
        <View style={{backgroundColor : "red",height : 60,flexDirection : "row",paddingHorizontal : 10}}>
          <View style={{backgroundColor : "white",height : 30,marginTop : 15,flex : 1}}/>
          <Text style={{marginTop : 18,paddingLeft : 10,color : "white"}}>Ara</Text>
        </View>
      </View>
    )
  }
}
