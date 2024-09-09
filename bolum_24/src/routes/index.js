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
         <Stack.Screen name="Home" component={Home} />
         <Stack.Screen options={({navigation,route})=>{

           return {
             headerShown : true,
             headerBackVisible : false,
             title : "Detay",
             headerShadowVisible : false,
             headerTitleAlign : "center",
             headerRight : ()=>(
               <View>
                 <Text style={{color : "black"}}>Ayarlar</Text>
               </View>
             ),
             headerTintColor : "red",
             headerStyle : {
               backgroundColor : "transparent",
             },
             headerTransparent : true
             /*
             headerLeft : ()=>(
               <Text>Geri</Text>
             )

              */
             /*
             header : ()=>(
               <View>
                 <Text>Header</Text>
               </View>
             )

              */
           }
         }} name="Detail" component={Detail} />
       </Stack.Navigator>
     </NavigationContainer>
    )
  }
}
