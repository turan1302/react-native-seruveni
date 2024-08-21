import React, { Component } from 'react'
import { Image, Text, TouchableOpacity, View } from "react-native";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      youtube : "MFSoftware Blog42",
      age : 25,
      city : "Konya"
    }
  }

  changeState = ()=>{
    this.setState({
      youtube : "M.Fatih",
      age : 2023,
      city : "Ankara",
    },()=>{
      alert("Veriler güncellendi!!!");
    });
  }

  render() {
    const {youtube,age} = this.state;

    return (
      <View style={{flex : 1,justifyContent : "center",alignItems : "center"}}>
        <Text style={{fontSize : 15,fontWeight : "bold",color : "black"}}> {youtube} </Text>
        <Text style={{fontSize : 15,fontWeight : "bold",color : "black"}}> {age} </Text>

        <TouchableOpacity onPress={this.changeState} style={{marginTop : 30,backgroundColor : "#fd9f9f",padding : 10,borderRadius : 20}}>
          <Text style={{color : "black",fontWeight : "bold",fontSize : 15}}>Değiştir</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
