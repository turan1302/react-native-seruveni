import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";
import FirstStore from "./src/store/FirstStore";
import { observer } from "mobx-react";
@observer

export default class App extends Component {

  checkName = (value)=>{
    FirstStore.checkName(value);
  }

  checkCity = (value)=>{
    FirstStore.checkCity(value);
  }

  render() {
    return (
      <View style={{flex : 1,justifyContent : "center",alignItems :"center"}}>
        <Text style={{color : "black",fontSize : 15}}>{FirstStore.name}</Text>
        <Text style={{color : "black",fontSize : 15}}>{FirstStore.city}</Text>
        <TouchableOpacity onPress={()=>this.checkName("MFS")} style={{backgroundColor : "gray",marginTop : 20,padding : 20,borderRadius : 8}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Değiştir</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={()=>this.checkCity("MFS")} style={{backgroundColor : "gray",marginTop : 20,padding : 20,borderRadius : 8}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Şehir Değiştir</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
