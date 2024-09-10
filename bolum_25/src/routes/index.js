import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Home from "../screens/Home";
import Profile from "../screens/Profile";

const Tab = createBottomTabNavigator();

export default class Routes extends Component {
  render() {
    return (
     <NavigationContainer>
       <Tab.Navigator screenOptions={()=>{
         return {
           headerShown : false,
           tabBarShowLabel : true,
           tabBarActiveTintColor  :"red",
           tabBarInactiveTintColor : "black",
           tabBarIconStyle : {
             display  :"none"
           },
           tabBarLabelStyle : {
             marginBottom : 15,
             fontSize : 10,
             fontWeight : "bold"
           },
         }
       }}>
         <Tab.Screen options={({route,navigation})=>{
           return {

             headerShown : true,
             headerShadowVisible : false,
             /*
             title : "Anasayfa",
             headerTitleAlign : "center",
             headerLeft : ()=>(
               <Text>Geri</Text>
             ),
             headerLeftContainerStyle : {
               paddingLeft : 10
             },
             headerRight : ()=>(
               <Text>İleri</Text>
             ),
             headerRightContainerStyle : {
               paddingRight : 10
             }

              */
             header : ()=>(
               <View style={{height : 40,backgroundColor : "white",justifyContent : "space-between",alignItems  :"center",flexDirection : "row",paddingHorizontal : 10}}>
                 <Text>asda</Text>
                 <Text>asda</Text>
                 <Text>asda</Text>
               </View>
             ),
             tabBarIconStyle : {
               display : "flex"
             },
             tabBarLabelStyle : {
               marginBottom : 3,
               display  :"none"
             },
              tabBarIcon : ({focused,color,size})=>{
               if (focused===true){
                 console.log("Anaayfaya geldin")
               }
               return (
                <View style={{height : 50,backgroundColor : "blue",justifyContent : "center",alignItems : "center",paddingHorizontal : 13,marginBottom : 20,borderRadius : 30}}>
                  <Text style={{color : "white"}}>Anasayfa</Text>
                </View>
               )
              }
           }
         }} name="Home" component={Home} />
         <Tab.Screen name="Profile" component={Profile} />
       </Tab.Navigator>
     </NavigationContainer>
    )
  }
}
