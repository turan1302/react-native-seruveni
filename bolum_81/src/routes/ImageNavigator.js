import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import NewImage from "../screens/NewImage";
import OpenCamera from "../screens/OpenCamera";

const Stack = createNativeStackNavigator();

export default class ImageNavigator extends Component {
  render() {
    return (
     <Stack.Navigator initialRouteName={"NewImage"} screenOptions={({navigation,route})=>{
       return {
         headerShown : false
       }
     }}>
       <Stack.Screen name={"NewImage"} component={NewImage}/>
       <Stack.Screen name={"OpenCamera"} component={OpenCamera}/>
     </Stack.Navigator>
    )
  }
}
