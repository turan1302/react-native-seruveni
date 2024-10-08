import React, { Component } from "react";
import { ActivityIndicator, FlatList, RefreshControl, Text, View } from "react-native";
import axios from "axios";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isLoading: true,
      isLoadMore: false,
      isRefresh: true,
      users: [],
      page: 1
    };
  }

  componentDidMount() {
    this.getUsers();
  }

  getUsers = async (page = 1,loadMore = false) => {
    await axios.get(`http://127.0.0.1:8000?page=${page}`).then((res) => {
      const data = res.data;

      const newResult = (loadMore) ? this.state.users.concat(data.data) : data.data;

      this.setState({
        isLoading: false,
        isLoadMore : false,
        isRefresh: false,
        users: newResult
      });

    }).catch((err) => {
      console.log(err);
    });
  };

  loadMore = ()=>{
    const {page} = this.state;
    this.setState({
      isLoadMore : true,
      page : page + 1
    },()=>{
      setTimeout(()=>{
        this.getUsers(page+1,true);
      },2000);
    });
  }

  refreshUsers = () => {
    this.setState({
      isRefresh: true
    }, () => {
      setTimeout(() => {
        this.getUsers(1,false);
      }, 2000);
    });
  };

  render() {
    const { users, isRefresh, isLoading,isLoadMore } = this.state;

    if (isLoading) {
      return (
        <View style={{ flex: 1, justifyContent: "center" }}>
          <ActivityIndicator color={"green"} size={30} />
        </View>
      );
    }

    return (
      <View style={{ flex: 1 }}>
        <FlatList refreshControl={<RefreshControl refreshing={isRefresh} onRefresh={this.refreshUsers} />} bounces
                  onEndReachedThreshold={0.7}
                  onEndReached={this.loadMore}
                  ListFooterComponent={()=>{
                    if (isLoadMore){
                      return (
                        <View style={{flex : 1,justifyContent :"center"}}>
                          <ActivityIndicator color={"green"} size={30} />
                        </View>
                      )
                    }
                  }}
                  data={users} keyExtractor={(item, index) => index}
                  renderItem={({ item, index }) => (
          <View style={{ backgroundColor: "gray", margin: 10, padding: 10, borderRadius: 10 }}>
            <Text style={{ color: "white" }}>{item.name}</Text>
          </View>
        )} />
      </View>
    );
  }
}
