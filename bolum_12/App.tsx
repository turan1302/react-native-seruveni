import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";
import ComponentFirst from "./src/components/ComponentFirst";
import ComponentSecond from "./src/components/ComponentSecond";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      name1 : "Ali",
      name2 : "Veli"
    }
  }

  changeName = ()=>{
    this.setState({
      name1: "Sabri",
      name2 : "Nuri"
    })
  }

  showMessage = ()=>{
    alert("Show Message Çalıştı");
  }

  render() {
    const {name1,name2} = this.state;

    return (
      <View>
        <Text>{name1}</Text>
        <Text>{name2}</Text>

        <View style={{marginTop : 50}}>
          <ComponentFirst change={this.changeName} kisi1={name1}/>
          <ComponentSecond getMessage={this.showMessage} name={name2} />
        </View>
      </View>
    )
  }
}
