import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import ProfileInfo from "../screens/Profile/ProfileInfo";

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
     </Stack.Navigator>
    )
  }
}
