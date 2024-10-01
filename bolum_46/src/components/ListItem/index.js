import React, { Component } from 'react'
import { Text, View } from 'react-native'

export default class ListItem extends Component {
  render() {
    const {item,index} = this.props;

    return (
      <View style={{ backgroundColor: "#000", marginHorizontal: 10, marginVertical: 20, padding: 20 }}>
        <Text style={{ color: "#fff" }}>{item.name}</Text>
      </View>
    )
  }
}
