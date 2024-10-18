import React, { Component } from 'react'
import { FlatList, SafeAreaView, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import { SwipeListView } from 'react-native-swipe-list-view';

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      data : ["ali","veli","sabri","nuri"]
    }
  }

  renderItem = ({item,index})=>{
    return (
      <SwipeListView data={[item]}
                     leftOpenValue={60}
                     rightOpenValue={-100}
                     renderHiddenItem={(item,index)=>(
                      <View style={styles.buttons_area}>
                        <TouchableOpacity style={styles.left_button}>
                          <Text style={styles.left_button_text}>Sil</Text>
                        </TouchableOpacity>
                        <TouchableOpacity style={styles.right_button}>
                          <Text style={styles.right_button_text}>Güncelle</Text>
                        </TouchableOpacity>
                      </View>
                     )}
                     renderItem={({item,index})=>(
        <View style={styles.item}>
          <Text style={styles.item_text}>{item}</Text>
        </View>
      )}>
      </SwipeListView>
    )
  }

  render() {
    const {data} = this.state;

    return (
      <SafeAreaView style={{flex : 1,backgroundColor : "#ccc"}}>
        <FlatList style={{marginTop : 20}} data={data} showsVerticalScrollIndicator={false} bounces keyExtractor={(item,index)=>index} renderItem={this.renderItem}/>
      </SafeAreaView>
    )
  }
}

const styles = StyleSheet.create({
  item : {marginHorizontal : 10,marginBottom : 20,flex : 1,backgroundColor : "#fff",padding : 10,borderRadius : 10},
  item_text : {color : "#646464",fontWeight : "bold"},
  buttons_area : {
    flexDirection : "row",
    flex : 1,
    justifyContent : "space-between",
    alignItems : "center"
  },
  left_button : {
    paddingHorizontal : 15,
    paddingVertical : 9,
    marginLeft : 15,
    marginBottom : 20,
    backgroundColor : "red",
    justifyContent : "center",
    alignItems : "center",
    borderRadius : 10
  },
  left_button_text : {
    color :"white",
    fontWeight : "bold"
  },
  right_button : {
    paddingVertical : 9,
    paddingHorizontal : 10,
    marginRight : 15,
    marginBottom : 20,
    backgroundColor : "blue",
    justifyContent : "center",
    alignItems : "center",
    borderRadius : 10
  },
  right_button_text : {
    color :"white",
    fontWeight : "bold"
  }
});

