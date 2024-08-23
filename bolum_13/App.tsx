import React, { Component } from 'react'
import { Text, View } from 'react-native'
import FunctionalComponent from "./src/components/FunctionalComponent";
import ClassComponent from "./src/components/ClassComponent";

export default class App extends Component {
  render() {
    return (
      <View>
        <ClassComponent name={"MFS"}/>
        <FunctionalComponent pc={"Apple"}/>
      </View>
    )
  }
}
