import React, { Component } from 'react'
import { Image, Text, View } from "react-native";
import styles from "./styles";

export default class ListItem extends Component {
  render() {
    const {item,index} = this.props;

    return (
      <View style={styles.item_container}>
        <Image style={{width : 100,height : 100,borderRadius : 50,borderWidth : 3,borderColor : "#ff5800"}} source={{uri : item.url}}/>
      </View>
    )
  }
}
