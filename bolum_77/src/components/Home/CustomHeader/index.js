import React, { Component } from 'react'
import { Text, View } from 'react-native'
import styles from "./styles";

export default class CustomHeader extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.title}> MFS GalleryApp </Text>
      </View>
    )
  }
}
