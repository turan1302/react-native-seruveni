import React, { Component } from "react";
import { ScrollView, StyleSheet, Text, TextInput, TouchableOpacity, View } from "react-native";
import ListComponent from "./src/components/ListComponent";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.state = {
      addTodoText : '',
      todos : []
    }
  }

  addTodoText = (e)=>{
    this.setState({
      addTodoText : e
    });
  }

  addTodo = ()=>{
    const {addTodoText,todos} = this.state;

    if (addTodoText===""){
      alert("Lütfen metin giriniz");
    }else{
      const newTodo = {
        id : Date.now(),
        name : addTodoText
      }

      let newTodoList = [...todos,newTodo];

      this.setState({
        todos : newTodoList,
        addTodoText : ''
      })
    }
  }

  removeTodo = (id)=>{
    const {todos} = this.state;
    const newTodosList = todos.filter(todo=>todo.id!==id);

    this.setState({
      todos : newTodosList
    });
  }

  render() {
    const {todos,addTodoText} = this.state;

    return (
      <View style={styles.home_container}>
        <View style={styles.add_area}>
          <TextInput value={addTodoText} onChangeText={(e)=>this.addTodoText(e)} placeholder={"Metin Giriniz"} style={styles.text_input} />
          <TouchableOpacity onPress={this.addTodo} style={styles.button_area}>
            <Text style={styles.button_text}>Ekle</Text>
          </TouchableOpacity>
        </View>
        <ScrollView showsVerticalScrollIndicator={false}>
          {todos.map((item,index)=>(
           <ListComponent key={index} removeTodo={this.removeTodo} item={item}/>
          ))}
        </ScrollView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  home_container : { flex: 1 },
  add_area : {
    backgroundColor: "red",
    height: 50,
    flexDirection: "row",
    justifyContent: "center",
    padding: 5,
    marginBottom: 10
  },
  text_input : { flex: 1, backgroundColor: "white", borderRadius: 15,paddingLeft: 10 },
  button_area : {
    justifyContent : "center",
    borderRadius : 15,
    alignItems : "center",
    marginLeft : 10,
    backgroundColor : "blue",
    padding : 10
  },
  button_text : {color : "white"}
})
