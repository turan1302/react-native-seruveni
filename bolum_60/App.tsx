import React, { Component } from 'react'
import { Text, View, BackHandler, Alert } from "react-native";

import NetInfo from "@react-native-community/netinfo";

export default class App extends Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.isConnect();
  }

  isConnect = ()=>{
    NetInfo.fetch().then(state=>{
      console.log(state);
      if (state.isWifiEnabled===false){
        Alert.alert("Bir Ricam Var","İnternete Bağlanır Mısın :)", [
        {
          text : "Tamamdır",
          onPress : ()=>BackHandler.exitApp()
        }
      ])
      }
    })
  }

  render() {
    return (
      <View>
        <Text> TextInComponent </Text>
      </View>
    )
  }
}
