import React, { Component } from 'react'
import { Dimensions, Image, Text, TouchableOpacity, View } from "react-native";
import { format } from "date-fns";
import styles from "./styles";

import * as NavigationService from "../../../../../NavigationService";
import AppUrl from "../../../../../RestAPI/AppUrl";

export default class ListItem extends Component {

  constructor(props) {
    super(props);

    this.state = {
      windowDimensions : Dimensions.get("window")
    }
  }

  componentDidMount() {
    this.dimensionsSubcription = Dimensions.addEventListener("change",this.handleResize);
  }

  componentWillUnmount() {
    if (this.dimensionsSubcription){
      this.dimensionsSubcription.remove();
    }
  }

  handleResize = ({window})=>{
    this.setState({
      windowDimensions : window
    });
  }

  dateFormat = (date) => {
    const newDate = new Date(date);

    const formattedDate = format(newDate, "d MMMM yyyy");
    return formattedDate;
  };

  render() {
    const {item} = this.props;
    const {width,height} = this.state.windowDimensions;
    const position = width>height ? "LANDSCAPE" : "PORTRAIT";

    return (
      <TouchableOpacity style={styles.button_area}>
        <Image style={styles.image(position,width,height)} source={{uri : AppUrl.storageURL+item.img_image}}/>
        <View style={styles.image_detail}>
          <Text numberOfLines={1} style={styles.image_detail_text}>{item.img_name}</Text>
          <Text numberOfLines={1} style={styles.image_detail_text}>Tarih: {this.dateFormat(item.img_created_at)}</Text>
        </View>
      </TouchableOpacity>
    )
  }
}
