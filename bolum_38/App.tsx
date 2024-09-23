import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";
import FirstStore from "./src/store/FirstStore";

export default class App extends Component {

  componentDidMount() {
    alert(FirstStore.name);
  }

  checkName = (name)=>{
    FirstStore.checkName(name);
    alert(FirstStore.name);
  }

  render() {
    return (
      <View style={{flex : 1,justifyContent : "center",alignItems :"center"}}>
        <TouchableOpacity onPress={()=>this.checkName("MFS")} style={{backgroundColor : "gray",padding : 20,borderRadius : 8}}>
          <Text style={{color : "white",fontWeight : "bold"}}>Değiştir</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
