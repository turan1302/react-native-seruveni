import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { NavigationContainer } from '@react-navigation/native';

import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Home from "../screens/Home";
import Detail from "../screens/Detail";
const Stack = createNativeStackNavigator();

export default class Routes extends Component {
  render() {
    return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName={"Home"}>
        <Stack.Screen options={()=>{
          return {
            headerShown : false,

          }
        }} name="Home" component={Home} />
        <Stack.Screen name="Detail" component={Detail} />
      </Stack.Navigator>
    </NavigationContainer>
    )
  }
}
