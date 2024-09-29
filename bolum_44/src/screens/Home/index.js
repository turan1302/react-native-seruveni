import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";
import { observer,inject } from "mobx-react";
@inject("FirstStore","AuthStore")
@observer

export default class Home extends Component {

  checkName = (value)=>{
    this.props.FirstStore.checkName(value);
  }

  checkCity = (value)=>{
    this.props.FirstStore.checkCity(value);
  }

  render() {
    return (
      <View style={{flex : 1,justifyContent : "center",alignItems :"center"}}>
        <Text style={{color : "black",fontSize : 15}}>{this.props.FirstStore.name}</Text>
        <Text style={{color : "black",fontSize : 15}}>{this.props.FirstStore.city}</Text>
        <TouchableOpacity onPress={()=>this.checkName("MFS")} style={{backgroundColor : "gray",marginTop : 20,padding : 20,borderRadius : 8}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Değiştir</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={()=>this.checkCity("MFS")} style={{backgroundColor : "gray",marginTop : 20,padding : 20,borderRadius : 8}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Şehir Değiştir</Text>
        </TouchableOpacity>

        <View style={{marginTop : 30}}>
          <Text style={{color : "black",fontSize : 15}}>{this.props.AuthStore.user}</Text>
        </View>
      </View>
    )
  }
}
