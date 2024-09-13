import React, { Component } from "react";
import { ScrollView, StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default class Home extends Component {

  constructor(props) {
    super(props);

    this.state = {
      products: [
        {
          id: 1,
          name: "Product 1",
          desc: "Product 1 güzel ürün",
        },
        {
          id: 2,
          name: "Product 2",
          desc: "Product 2 güzel ürün",
        },
        {
          id: 3,
          name: "Product 3",
          desc: "Product 3 güzel ürün",
        },
        {
          id: 4,
          name: "Product 4",
          desc: "Product 4 güzel ürün",
        },
        {
          id: 5,
          name: "Product 5",
          desc: "Product 5 güzel ürün",
        },
        {
          id: 6,
          name: "Product 6",
          desc: "Product 6 güzel ürün",
        },
        {
          id: 7,
          name: "Product 7",
          desc: "Product 7 güzel ürün",
        },
        {
          id: 8,
          name: "Product 8",
          desc: "Product 8 güzel ürün",
        },
        {
          id: 9,
          name: "Product 9",
          desc: "Product 9 güzel ürün",
        },
        {
          id: 10,
          name: "Product 10",
          desc: "Product 10 güzel ürün",
        },
        {
          id: 11,
          name: "Product 11",
          desc: "Product 11 güzel ürün",
        },
        {
          id: 12,
          name: "Product 12",
          desc: "Product 12 güzel ürün",
        },
        {
          id: 13,
          name: "Product 13",
          desc: "Product 13 güzel ürün",
        },
        {
          id: 14,
          name: "Product 14",
          desc: "Product 14 güzel ürün",
        },
        {
          id: 15,
          name: "Product 15",
          desc: "Product 15 güzel ürün",
        },
        {
          id: 16,
          name: "Product 16",
          desc: "Product 16 güzel ürün",
        },
      ],
    };
  }

  render() {
    const { products } = this.state;
    const { navigation } = this.props;

    return (
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false} bounces>
          {products.map((item, index) => (
            <TouchableOpacity onPress={() => navigation.navigate("Detail",{
             item : item
            })} key={index} style={styles.item_area}>
              <Text style={styles.item_text}>{item.name}</Text>
            </TouchableOpacity>
          ))}
        </ScrollView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 20,
    paddingTop: 10,
    flex  :1,
    backgroundColor : "white"
  },
  item_area: {
    justifyContent: "center",
    alignItems: "center",
    paddingVertical: 20,
    borderWidth: 1,
    marginBottom: 20,
    borderRadius: 20,
  },
  item_text: { fontWeight: "bold", fontSize: 20 },
});
