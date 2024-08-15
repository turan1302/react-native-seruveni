import { Component } from "react";
import { Text, View, StyleSheet } from "react-native";
export default class App extends Component {
  render() {
    return (
      <View style={[styles.container,styles.custom_container]}>
        <Text style={styles.item}>MFSoftware Blog</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: "orange",
    marginTop: 50
  },
  custom_container : {elevation : 5,borderRadius : 20},
  item: { textAlign: "right", paddingTop: 20, fontWeight: "bold" }
});
