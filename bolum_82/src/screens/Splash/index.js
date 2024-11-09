import React, { Component } from 'react'
import { ActivityIndicator, Text, View } from "react-native";
import styles from "./styles";
import Entypo from "react-native-vector-icons/Entypo";
import { inject, observer } from "mobx-react";

@inject("AuthStore")
@observer

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
        this.props.AuthStore.getToken();
      },2000);
    });
  }

  render() {
    return (
      <View style={styles.container}>
        <Entypo name={"images"} size={50} color={"#000"}/>
        <ActivityIndicator color={"#000"} size={30} style={styles.indicator_style}/>
      </View>
    )
  }
}
