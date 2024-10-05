import React, { Component } from 'react'
import { Text, View } from 'react-native'
import styles from "./styles";

export default class ListItem extends Component {
  render() {
    const {item,index} = this.props;

    return (
      <View style={styles.item_container}>
        <Text style={styles.item_text}>{item.title}</Text>
      </View>
    )
  }
}
