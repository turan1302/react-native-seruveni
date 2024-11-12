import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "column",
    backgroundColor: "transparent",
    justifyContent: "space-between",
  },
  preview : {
    flex : 1,
    justifyContent : "flex-end"
  },

  capture_area : {
    flex : 0,
    backgroundColor : "transparent",
    borderWidth : 3,
    borderColor : "#fff",
    borderRadius : 50,
    marginBottom : 20,
    alignSelf : "center"
  },

  capture : {
    flex : 0,
    backgroundColor : "#fff",
    borderRadius : 30,
    padding : 30,
    alignSelf : "center",
    margin : 3
  }
});

export default styles;
