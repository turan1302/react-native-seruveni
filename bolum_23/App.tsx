import React, { Component } from 'react'
import { SafeAreaView, Text, View } from "react-native";
import Routes from "./src/routes";

export default class App extends Component {
  render() {
    return (
      <SafeAreaView style={{flex : 1,backgroundColor : "white"}}>
        <Routes/>
      </SafeAreaView>
    )
  }
}
