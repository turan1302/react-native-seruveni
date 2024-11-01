import React, { Component } from "react";

import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Home from "../screens/Home";
import Ionicons from "react-native-vector-icons/Ionicons";
import Entypo from "react-native-vector-icons/Entypo";
import CustomTabbarIcon from "../components/common/Tabbar/CustomTabbarIcon";

const Tab = createBottomTabNavigator();


export default class WelcomeNavigator extends Component {
  render() {
    return (
      <Tab.Navigator initialRouteName={"Home"} screenOptions={({ route, navigation }) => {
        return {
          tabBarHideOnKeyboard: true,
          headerShown: false,
          tabBarShowLabel: false,
          tabBarStyle: {
            borderTopWidth: 0.2,
            shadowColor: "transparent",
          },
        };
      }}>
        <Tab.Screen options={({ route, navigation }) => {
          return {
            tabBarIcon: ({ focused }) => (
              focused ? (<Ionicons name={"home"} color={"#785af1"} size={24} />) : (
                <Ionicons name={"home-outline"} color={"#000"} size={24} />
              )
            ),
          };
        }} name={"Home"} component={Home} />

        <Tab.Screen options={({ route, navigation }) => {
          return {
            tabBarIcon: ({ focused }) => (
              <CustomTabbarIcon navigation={navigation}/>
            ),
          };
        }} name={"ImageNavigator"} component={Home} />

        <Tab.Screen options={({ route, navigation }) => {
          return {
            tabBarIcon: ({ focused }) => (
              focused ? (<Entypo name={"user"} color={"#785af1"} size={24} />) : (
                <Entypo name={"user"} color={"#000"} size={24} />
              )
            ),
          };
        }} name={"Profile"} component={Home} />

      </Tab.Navigator>
    );
  }
}
