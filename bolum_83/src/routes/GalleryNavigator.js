import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Ionicons from "react-native-vector-icons/Ionicons";
import ImagesList from "../screens/Profile/Images/ImagesList";

const Stack = createNativeStackNavigator();

export default class GalleryNavigator extends Component {
  render() {
    return (

      <Stack.Navigator initialRouteName={"ImagesList"} screenOptions={({navigation,route})=>{
        return {
          headerShown : false
        }
      }}>
        <Stack.Screen options={({navigation})=>{
          return {
            headerShown : true,
            headerShadowVisible : false,
            title : "Resimlerim",
            headerLeft : ()=>(
              <TouchableOpacity onPress={()=>navigation.goBack()}>
                <Ionicons name={"arrow-back"} size={30} color={"#000"}/>
              </TouchableOpacity>
            ),
            headerTitleAlign : "center"
          }
        }} name={"ImagesList"} component={ImagesList}/>
      </Stack.Navigator>
    )
  }
}
