import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React from "react";

const ListComponent = ({item,removeTodo})=>{
  return (
    <View style={styles.item_area}>
      <Text style={styles.item_text}>{item.name}</Text>
      <TouchableOpacity onPress={()=>removeTodo(item.id)}>
        <Text style={styles.button_text}>Sil</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  item_area : {
    flexDirection : "row",
    justifyContent : "space-between",
    alignItems : "center",
    marginHorizontal : 5,
    backgroundColor : "orange",
    padding : 10,
    borderRadius : 10,
    marginBottom : 10
  },
  item_text : {color : "black"},
  button_text : {color : "black"}
});

export default ListComponent;
