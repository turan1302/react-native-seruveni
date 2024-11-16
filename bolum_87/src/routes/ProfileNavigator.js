import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import ProfileInfo from "../screens/Profile/ProfileInfo";
import GalleryNavigator from "./GalleryNavigator";
import ProfileAccount from "../screens/Profile/ProfileAccount";

const Stack = createNativeStackNavigator();

export default class ProfileNavigator extends Component {
  render() {
    return (
     <Stack.Navigator initialRouteName={"ProfileInfo"} screenOptions={({route,navigation})=>{
       return {
         headerShown : false
       }
     }}>
       <Stack.Screen name={"ProfileInfo"} component={ProfileInfo}/>
       <Stack.Screen options={({route,navigation})=>{
         return {
           headerShown : true,
           headerShadowVisible : false,
           title : "Hesap Bilgilerim"
         }
       }} name={"ProfileAccount"} component={ProfileAccount}/>

       <Stack.Screen name={"GalleryNavigator"} component={GalleryNavigator}/>
     </Stack.Navigator>
    )
  }
}
