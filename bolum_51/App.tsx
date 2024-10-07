import React, { Component } from "react";
import { FlatList, RefreshControl, SafeAreaView, ScrollView, Text, TextInput, View } from "react-native";
import axios from "axios";
import ListItem from "./src/componets/ListItem";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isRefreshing : true,
      images: [],
      changeText: ""
    };
  }

  componentDidMount() {
      this.getUsers();
  }

  getUsers = ()=>{
    axios.get("https://jsonplaceholder.typicode.com/photos").then((res) => {
      const data = res.data;
      this.setState({
        images: data,
        isRefreshing : false,
      });
    }).catch((err) => {
      console.log(err);
    });
  }

  refreshUsers = ()=>{
    this.setState({
      isRefreshing : true
    },()=>{
      this.getUsers();
    });
  }

  _renderItem = ({ item, index }) => {
    return (
      <ListItem item={item} index={index} />
    );
  };

  render() {
    const { images, changeText,isRefreshing } = this.state;

    return (
      <SafeAreaView style={{ flex: 1, backgroundColor: "#fff" }}>
        <FlatList
          ListHeaderComponent={() => (
          <View>
            <Text>Üst Veriler</Text>
            <Text>Üst Veriler</Text>
            <Text>Üst Veriler</Text>
            <Text>Üst Veriler</Text>
          </View>
        )}

          refreshControl={
            <RefreshControl refreshing={isRefreshing} onRefresh={this.refreshUsers}/>
          }
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
                  )} numColumns={2} showsVerticalScrollIndicator={false} bounces data={images}
                  keyExtractor={(item, index) => index}
                  renderItem={this._renderItem} />
      </SafeAreaView>
    );
  }
}
