import React, { Component } from "react";

import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Ionicons from "react-native-vector-icons/Ionicons";
import Entypo from "react-native-vector-icons/Entypo";
import CustomTabbarIcon from "../components/common/Tabbar/CustomTabbarIcon";
import HomeNavigator from "./HomeNavigator";
import ImageNavigator from "./ImageNavigator";
import {getFocusedRouteNameFromRoute} from "@react-navigation/native";
import ProfileNavigator from "./ProfileNavigator";

const Tab = createBottomTabNavigator();


export default class WelcomeNavigator extends Component {
  render() {
    return (
      <Tab.Navigator initialRouteName={"HomeNavigator"} screenOptions={({ route, navigation }) => {
        return {
          tabBarHideOnKeyboard: true,
          headerShown: false,
          tabBarShowLabel: false,
          tabBarStyle : ((route)=>{
            const tabBarHidden = ["OpenCamera","GalleryNavigator","ProfileAccount"];

            const routeName = getFocusedRouteNameFromRoute(route) ?? "";
              if (tabBarHidden.includes(routeName)) {
                return {
                  display: 'none',
                  borderTopWidth: 0.2,
                  shadowColor: 'transparent',
              }
              } else {
                return {
                  borderTopWidth : 0.2,
                  shadowColor : "transparent"
              }
            }
          })(route)
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
        }} name={"HomeNavigator"} component={HomeNavigator} />

        <Tab.Screen options={({ route, navigation }) => {
          return {
            tabBarIcon: ({ focused }) => (
              <CustomTabbarIcon navigation={navigation}/>
            ),
          };
        }} name={"ImageNavigator"} component={ImageNavigator} />

        <Tab.Screen options={({ route, navigation }) => {
          return {
            tabBarIcon: ({ focused }) => (
              focused ? (<Entypo name={"user"} color={"#785af1"} size={24} />) : (
                <Entypo name={"user"} color={"#000"} size={24} />
              )
            ),
          };
        }} name={"ProfileNavigator"} component={ProfileNavigator} />

      </Tab.Navigator>
    );
  }
}
