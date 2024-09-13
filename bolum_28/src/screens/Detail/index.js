import React, { Component } from 'react'
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default class Detail extends Component {

  componentDidMount() {
    const {params} = this.props.route;
    const {navigation} = this.props;

    navigation.setOptions({
      title : params.item.name,
      headerShadowVisible : true,
    });
  }

  render() {
    const {params} = this.props.route;
    const {navigation} = this.props;

    return (
      <View style={styles.container}>
        <View style={styles.product_area}>
          <Text style={styles.product_name}>Ürün Adı: {params.item.name}</Text>
          <Text style={styles.product_desc}>Ürün Açıklaması: {params.item.desc}</Text>
        </View>
        <View style={styles.button_area}>
          <TouchableOpacity onPress={()=>navigation.goBack()} style={styles.button_style}>
            <Text style={styles.button_text}>Geriye Dön</Text>
          </TouchableOpacity>
        </View>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container : {backgroundColor : "white",flex  :1},
  product_area : {marginTop : 20,paddingHorizontal : 20},
  product_name : {fontWeight : "bold",fontSize : 15},
  product_desc : {fontWeight : "bold",fontSize : 15,marginTop : 8},

  button_area : {marginTop : 30,justifyContent : "center",alignItems : "center"},
  button_style : {backgroundColor : "red",padding  :10,borderRadius : 10},
  button_text : {color : "white",fontSize : 15,fontWeight : "bold"}
});
