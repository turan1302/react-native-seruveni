import React, { Component } from "react";
import { Dimensions, Image, Text, TouchableOpacity, View } from "react-native";

import { format } from "date-fns";
import * as NavigationService from "../../../NavigationService";
import styles from "./styles";
import AppUrl from "../../../RestAPI/AppUrl";


export default class ListItem extends Component {

  constructor(props) {
    super(props);

    this.state = {
      windowDimensions: Dimensions.get("window"),
    };
  }

  componentDidMount() {
    this.dimensionsSubscription = Dimensions.addEventListener("change", this.handleResize);
  }

  componentWillUnmount() {
    if (this.dimensionsSubscriptions) {
      this.dimensionsSubscription.remove();
    }
  }

  handleResize = ({ window }) => {
    this.setState({
      windowDimensions: window,
    });
  };

  dateFormat = (date) => {
    const newDate = new Date(date);

    const formattedData = format(newDate,"d MMMM yyyy");
    return formattedData;
  };

  render() {
    const {item,index} = this.props;
    const {width,height} = this.state.windowDimensions;
    const position = width>height ? "LANDSCAPE" : "PORTRAIT";

    return (
      <View>
        <Text style={styles.date}>{this.dateFormat(item.date)}</Text>
        <View style={styles.item_container}>
          {item.records.map((item,index)=>(
            <TouchableOpacity key={index}>
              <Image style={styles.image_style(width)} source={{uri : AppUrl.storageURL+item.img_image}}/>
            </TouchableOpacity>
          ))}
        </View>
      </View>
    );
  }
}
