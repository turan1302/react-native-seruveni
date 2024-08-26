import React, { Component } from 'react'
import { Text, TouchableOpacity, View } from "react-native";

export default class App extends Component {

  constructor() {
    super();

    this.state = {
      color  : "black"
    }

    console.log("Constructor çağrıldı");
  }

  componentDidMount() {
    console.log("Did Mount Çalıştı");
  }

  componentWillUnmount() {
    console.log("Sayfa Kapandı will unmount çalıştı");
  }

  componentDidUpdate(prevProps: Readonly<{}>, prevState: Readonly<{}>, snapshot?: any) {
    if (prevState.color !== this.state.color){
      console.log("Did update çalıştı");
    }
  }

  shouldComponentUpdate(nextProps: Readonly<{}>, nextState: Readonly<{}>, nextContext: any): boolean {
    if (this.state.color !== nextState.color){
      return true;
    }else{
      console.log("Değişikliğe gerek yok");
      return false;
    }
  }

  render() {
    console.log("Render çalıştı");

    return (
      <View style={{flex : 1,justifyContent : "center",alignItems : "center"}}>
       <TouchableOpacity onPress={()=>this.setState({
         color : "red"
       })} style={{width : "50%",backgroundColor  :"blue",justifyContent : "center",alignItems : "center",padding : 10}}>
         <Text style={{color : "white"}}>Renk Değiştir</Text>
       </TouchableOpacity>
      </View>
    )
  }
}
