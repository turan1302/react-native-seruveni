import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container : (position,width)=>({
    padding : 10,
    backgroundColor : "#785af1",
    position : "absolute",
    borderRadius : 30,
    bottom : 10,
    borderWidth : 2,
    borderColor : "#fff",
    width : (position==="LANDSCAPE") ? width * 0.075 : null
  })
});

export default styles;
