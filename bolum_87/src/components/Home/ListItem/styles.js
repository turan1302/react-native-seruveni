import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  date : {
    paddingHorizontal : 10,
    marginVertical : 10,
    fontWeight : "bold",
    color : "#000"
  },
  item_container : {
    flexDirection : "row",
    flexWrap : "wrap"
  },
  image_style : (width)=>({
    width : width*0.20,
    height : width*0.20,
    objectFit : "contain"
  })
});

export default styles;
