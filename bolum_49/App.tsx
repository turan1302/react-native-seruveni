import React, { Component } from "react";
import { FlatList, SafeAreaView, ScrollView, Text, TextInput, View } from "react-native";
import axios from "axios";
import ListItem from "./src/componets/ListItem";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      posts: [],
      changeText: ""
    };
  }

  componentDidMount() {
    axios.get("https://jsonplaceholder.typicode.com/posts").then((res) => {
      const data = res.data;
      this.setState({
        posts: data
      });
    }).catch((err) => {
      console.log(err);
    });
  }

  _renderItem = ({ item, index }) => {
    return (
      <ListItem item={item} index={index} />
    );
  };

  render() {
    const { posts, changeText } = this.state;

    return (
      <SafeAreaView style={{ flex: 1, backgroundColor: "#fff" }}>
        <FlatList

          ListHeaderComponent={() => (
          <View>
            <Text>Alt Veriler</Text>
            <Text>Alt Veriler</Text>
            <Text>Alt Veriler</Text>
            <Text>Alt Veriler</Text>
          </View>
        )}
                  ListFooterComponent={() => (
                    <View>
                      <Text>Alt Veriler</Text>
                      <Text>Alt Veriler</Text>
                      <Text>Alt Veriler</Text>
                      <Text>Alt Veriler</Text>
                    </View>
                  )}

                  ListEmptyComponent={() => (
                    <View style={{
                      margin: 10,
                      backgroundColor: "#ff8888",
                      paddingVertical: 10,
                      justifyContent: "center",
                      alignItems: "center",
                      borderRadius: 10
                    }}>
                      <Text style={{ color: "black", fontWeight: "bold", fontSize: 15 }}>Herhangi bir veri
                        bulunamadı</Text>
                    </View>
                  )} numColumns={2} showsVerticalScrollIndicator={false} bounces data={posts}
                  keyExtractor={(item, index) => index}
                  renderItem={this._renderItem} />
      </SafeAreaView>
    );
  }
}
