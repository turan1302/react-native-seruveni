import React, { Component } from 'react'
import { Text, View } from 'react-native'
import AuthLayout from "../../components/Layout/AuthLayout";

export default class Home extends Component {
  render() {
    return (
     <AuthLayout>
       <View>
         <Text> Anasayfa </Text>
       </View>
     </AuthLayout>
    )
  }
}
