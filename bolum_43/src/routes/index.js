import React, { Component } from 'react'
import Home from "../screens/Home";
import Detail from "../screens/Detail";

import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
const Stack = createNativeStackNavigator();

export default class Routes extends Component {
  render() {
    return (
      <NavigationContainer>
        <Stack.Navigator screenOptions={{
          headerShown : false
        }} initialRouteName={"Detail"}>
          <Stack.Screen name={"Home"} component={Home}/>
          <Stack.Screen name={"Detail"} component={Detail}/>
        </Stack.Navigator>
      </NavigationContainer>
    )
  }
}
