import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { checkNotifications, requestNotifications } from "react-native-permissions";

export default class App extends Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.getNotificationPermission();
  }

  getNotificationPermission = ()=>{

    // notification izin isteme
    requestNotifications(["alert","sound"]).then(({status,settings})=>{
      console.log(status,settings);
    })

    // notification izin kontrolü
    checkNotifications().then(({status,settings})=>{
      console.log(status,settings);
    })
  }

  render() {
    return (
      <View>
        <Text> TextInComponent </Text>
      </View>
    )
  }
}
