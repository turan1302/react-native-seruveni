import React, { Component } from 'react'
import { NavigationContainer } from '@react-navigation/native';
import { createDrawerNavigator } from '@react-navigation/drawer';
import Home from "../screens/Home";
import Profile from "../screens/Profile";
import DrawerDesign from "../components/DrawerDesign";
import Coupons from "../screens/Coupons";
import { Text, View } from "react-native";

const Drawer = createDrawerNavigator();
export default class Routes extends Component {
  render() {
    return (
      <NavigationContainer>
        <Drawer.Navigator drawerContent={({navigation})=><DrawerDesign navigation={navigation}/>} screenOptions={({navigation,route})=>{
          return {
            headerShadowVisible : false,
            headerTintColor : "gray",
            drawerStyle : {
              borderBottomEndRadius : 10,
              width : "80%"
            },
            headerRight : ()=>{
              return (
                <View>
                  <Text>sdas</Text>
                </View>
              )
            },
            headerRightContainerStyle : {
              paddingRight : 10
            }
          }
        }} initialRouteName={"Home"}>
          <Drawer.Screen name="Home" component={Home} />
          <Drawer.Screen name="Profile" options={()=>{
            return {
              title  :"Profil"
            }
          }} component={Profile} />
          <Drawer.Screen name="Coupons" component={Coupons} />
        </Drawer.Navigator>
      </NavigationContainer>
    )
  }
}

/*
    npm start -- --reset-cache
 */
