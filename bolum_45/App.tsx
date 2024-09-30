import React, { Component } from 'react'
import { Text, View } from 'react-native'
import axios from "axios";

export default class App extends Component {

  componentDidMount() {
    axios.get("http://127.0.0.1:8086/").then((res)=>{
      const data = res.data;
      const status = res.status;
      console.log(status,data);
    }).catch((err)=>{
      console.log(err);
    });
  }

  render() {
    return (
      <View>
        <Text> TextInComponent </Text>
      </View>
    )
  }
}
