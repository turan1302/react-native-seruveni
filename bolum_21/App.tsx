import React, { Component } from "react";
import { ScrollView, Text, View } from "react-native";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      colors: ["red", "green", "blue", "orange", "yellow", "pink", "brown", "cyan"]
    };
  }

  render() {
    const { colors } = this.state;

    return (
      <View style={{backgroundColor : "#cdcdcd",flex : 1}}>
        <View style={{flexDirection : "row"}}>
        <ScrollView horizontal showsHorizontalScrollIndicator={false}>
          {colors.map((item,index)=>(
            <View key={index} style={{backgroundColor : item,height : 300,width : 300}}/>
          ))}
        </ScrollView>
        </View>
      </View>
    );
  }
}
