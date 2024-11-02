import React, { Component } from "react";
import { ActivityIndicator, Text, View } from "react-native";
import styles from "./styles";

export default class Loader extends Component {
  render() {
    return (
      <View style={styles.container}>
        <ActivityIndicator color={"black"} size={50} />
      </View>
    );
  }
}
