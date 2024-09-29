import React, { Component } from 'react'
import { Text, View } from 'react-native'

import { observer,inject } from "mobx-react";
@inject("FirstStore","AuthStore")
@observer

export default class Detail extends Component {

  componentDidMount() {
    this.props.FirstStore.checkName("Ahmet");
  }

  render() {
    return (
      <View>
        <View style={{borderBottomWidth : 1,borderBottomColor : "gray"}}>
          <Text style={{fontSize : 20,color : "black"}}> {this.props.FirstStore.getUserInfo} </Text>
        </View>
      </View>
    )
  }
}
