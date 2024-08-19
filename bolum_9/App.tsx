import React, { Component } from "react";
import { Text, View } from "react-native";

export default class App extends Component {

  /*

  alignItems   ----> column ise yatayda  || row ise dikeyde işlem yapar

  | 'flex-start'
    | 'flex-end'
    | 'center'
    | 'stretch'
    | 'space-between'
    | 'space-around'


    flexDirection : column üzerinde kullanımı
<View style={{flex : 1,justifyContent : "center",alignItems : "center"}}>
        <View style={{backgroundColor : "red",width : 50,height : 50}}/>
        <View style={{backgroundColor : "blue",width : 50,height : 50}}/>
      </View>

flexDirection : row üzerinde kullanımı
 <View style={{flex : 1,flexDirection : "column",alignItems : "center"}}>
        <View>
          <View style={{backgroundColor : "red",width : 50,height : 50}}/>
          <View style={{backgroundColor : "blue",width : 50,height : 50}}/>
        </View>
      </View>

   */

  render() {
    return (
      <View style={{ flex: 1, flexDirection: "column", alignItems: "center" }}>
        <View>
          <View style={{ backgroundColor: "red", width: 50, height: 50 }} />
          <View style={{ backgroundColor: "blue", width: 50, height: 50 }} />
        </View>
      </View>
    );
  }
}
