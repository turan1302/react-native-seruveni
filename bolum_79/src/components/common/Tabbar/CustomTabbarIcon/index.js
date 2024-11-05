import React, { Component } from 'react'
import { Dimensions, Text, TouchableOpacity, View } from "react-native";
import AntDesign from "react-native-vector-icons/AntDesign";
import styles from "./styles";
import * as NavigationService from "../../../../NavigationService";

export default class CustomTabbarIcon extends Component {

  constructor(props) {
    super(props);

    this.state = {
      windowDimensions : Dimensions.get("window")
    }
  }

  componentDidMount() {
    this.dimensionsSubscription = Dimensions.addEventListener("change",this.handleResize)
  }

  componentWillUnmount() {
    if (this.dimensionsSubscription){
      this.dimensionsSubscription.remove();
    }
  }

  handleResize = ({window})=>{
    this.setState({windowDimensions : window});
  }

  render() {
    const {navigation} = this.props;
    const {width,height} = this.state.windowDimensions;
    const position = width > height ? "LANDSCAPE" : "PORTRAIT";


    return (
     <TouchableOpacity onPress={()=>NavigationService.navigate("ImageNavigator")} style={styles.container(position,width)}>
       <AntDesign name={"plus"} size={30} color={"#fff"}/>
     </TouchableOpacity>
    )
  }
}
