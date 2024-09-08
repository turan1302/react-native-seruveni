import React, { Component } from 'react'
import { Text, View } from 'react-native'

export default class Detail extends Component {
  render() {
    const {params} = this.props.route;

    return (
      <View style={{flex : 1,justifyContent : "center",alignItems : "center"}}>
        <Text style={{fontWeight : "bold",fontSize : 16}}> Burası Detay </Text>
        <Text style={{fontWeight : "bold",fontSize : 16}}> İsmin:  {params.name} </Text>
      </View>
    )
  }
}
