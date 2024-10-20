import React, { Component } from 'react'
import { Text, View } from 'react-native'

export default class Splash extends Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.isAuthenticated();
  }

  isAuthenticated = ()=>{
    const {navigation} = this.props;

    navigation.addListener("focus",()=>{
      setTimeout(()=>{
        navigation.navigate("Login");
      },2000);
    });
  }

  render() {
    return (
      <View>
        <Text> Yükleniyor... </Text>
      </View>
    )
  }
}
