import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

import * as NavigationService from "../../../../NavigationService";
import Ionicons from "react-native-vector-icons/Ionicons";
import styles from "./styles";

export default class CustomHeader extends Component {
  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={()=>NavigationService.back()}>
          <Ionicons name={"arrow-back"} size={30} color={"#000"}/>
        </TouchableOpacity>
        <TouchableOpacity>
          <Ionicons name={"settings-outline"} size={30} color={"#000"}/>
        </TouchableOpacity>
      </View>
    )
  }
}
