import React, { Component } from 'react'
import { Alert, BackHandler, Text, View } from "react-native";
import VersionNumber from 'react-native-version-number';

export default class App extends Component {

  componentDidMount() {
    // 1.0.0  ---> 1
    // 1.0.1  ---> 2

    const new_version = 1.1;

    if (VersionNumber.appVersion<new_version){
      Alert.alert("Dikkat","Uygulama versiyonunuzu güncellemenizi öneririz",[
        {
          text : "Tamam",
          onPress : ()=>BackHandler.exitApp()
        },
      ]);
    }

  }

  render() {
    return (
      <View>
        <Text style={{color : "black",fontSize : 18}}> Uygulama Versiyonu: {VersionNumber.appVersion}</Text>
        <Text style={{color : "black",fontSize : 18}}> Build Versiyonu: {VersionNumber.buildVersion}</Text>
        <Text style={{color : "black",fontSize : 18}}> Uygulama Kimlik Numarası: {VersionNumber.bundleIdentifier}</Text>
      </View>
    )
  }
}
