import React, { Component } from 'react'
import { Alert, Text, TouchableOpacity, View } from "react-native";
import AsyncStorage from '@react-native-async-storage/async-storage';

export default class App extends Component {


  componentDidMount() {
    this.getObjectData();
  }

  getData = async () => {
    try {
      const value = await AsyncStorage.getItem('youtube');
      if (value !== null) {
        alert(value);
      }
    } catch (e) {
      // error reading value
    }
  };


  getObjectData = async () => {
    try {
      const value = await AsyncStorage.getItem('youtube2');

      if (value !== null) {
        const result = JSON.parse(value);
        alert(result.name);
        alert(result.age);
      }
    } catch (e) {
      // error reading value
    }
  };


  storeData = async (value)=>{
    try {
      await AsyncStorage.setItem('youtube', value);
    } catch (e) {
      console.log(e);
    }
  }

  storeObjectData = async ()=>{
    try {
      const data = {
        name : "M.Fatih",
        age : 25
      }

      await AsyncStorage.setItem('youtube2',JSON.stringify(data));
    } catch (e) {
      console.log(e);
    }
  }

  render() {
    return (
      <View style={{flex : 1,justifyContent : "center",alignItems : "center"}}>
       <TouchableOpacity onPress={()=>this.storeData("MFSoftware Blog")} style={{backgroundColor : "blue",alignSelf  :"flex-start",padding : 10}}>
         <Text style={{color : "white"}}>Tıkla</Text>
       </TouchableOpacity>

        <TouchableOpacity onPress={()=>this.storeObjectData()} style={{backgroundColor : "blue",alignSelf  :"flex-start",padding : 10,marginTop : 50}}>
          <Text style={{color : "white"}}>Tıkla Object</Text>
        </TouchableOpacity>
      </View>
    )
  }
}
