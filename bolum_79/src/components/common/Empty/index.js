import React, { Component } from 'react'
import { Text, View } from 'react-native'
import styles from "./styles";

export default class Empty extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}> Herhangi bir kayıt bulunamadı </Text>
      </View>
    )
  }
}
