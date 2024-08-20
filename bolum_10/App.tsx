import { Component } from "react";
import { View } from "react-native";
import ClassComponent from "./src/components/ClassComponent";
import FunctionalComponent from "./src/components/FunctionalComponent";

export default class App extends Component {
  render() {
    return (
      <View style={{ flex: 1, justifyContent: "space-between" }}>
        <ClassComponent />
        <FunctionalComponent />
      </View>
    );
  }
}
