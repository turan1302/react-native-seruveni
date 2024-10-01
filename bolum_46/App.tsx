import React, { Component } from "react";
import { FlatList, SafeAreaView, Text, View } from "react-native";
import axios from "axios";
import ListItem from "./src/components/ListItem";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      posts: []
    };
  }

  componentDidMount() {
    axios.get("https://jsonplaceholder.typicode.com/comments").then((res) => {
      const data = res.data;
      this.setState({
        posts: data
      });
    }).catch((err) => {
      console.log(err);
    });
  }

  _renderItem = ({item,index})=>{
    return (
      <ListItem index={index} item={item}/>
    )
  }

  render() {
    const { posts } = this.state;

    return (
      <SafeAreaView style={{ flex: 1 }}>
        <FlatList showsVerticalScrollIndicator={false} data={posts} keyExtractor={(item, index) => index.toString()}
                  renderItem={this._renderItem} />
      </SafeAreaView>
    );
  }
}
