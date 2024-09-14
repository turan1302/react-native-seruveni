import React, { Component } from 'react'
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Home from "../screens/Home";
import Detail from "../screens/Detail";

const Stack = createNativeStackNavigator();

export default class Routes extends Component {
  render() {
    return (
     <NavigationContainer>
       <Stack.Navigator>
         <Stack.Screen options={{headerTitle : "Anasayfa"}} name="Home" component={Home} />
         <Stack.Screen options={{headerTitle : "Detay"}} name="Detail" component={Detail} />
       </Stack.Navigator>
     </NavigationContainer>
    )
  }
}
