import React, { Component } from 'react'
import { Text, View } from 'react-native'

import { observer,inject } from "mobx-react";
@inject("FirstStore","AuthStore")
@observer

export default class Detail extends Component {
  render() {
    return (
      <View>
        <View style={{borderBottomWidth : 1,borderBottomColor : "gray"}}>
          <Text style={{fontSize : 20,color : "black"}}> {this.props.FirstStore.city} </Text>
        </View>

        <View style={{borderBottomWidth : 1,borderBottomColor : "gray"}}>
          <Text style={{fontSize : 20,color : "black"}}> {this.props.AuthStore.user} </Text>
        </View>
      </View>
    )
  }
}
