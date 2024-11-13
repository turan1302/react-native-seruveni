import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container : {
    flex : 1,
    backgroundColor : "#fcfcff"
  },

  image : {
    width : "100%",
    height : 200,
    objectFit : "contain"
  },

  top_buttons_area : {
    flexDirection : "row",
    justifyContent : "space-between",
    alignItems : "center",
    paddingHorizontal : 10,
    marginTop : 10
  },
  top_left_button : {
    flex : 1,
    backgroundColor : "#fff",
    justifyContent : "center",
    alignItems : "center",
    borderWidth : 1,
    borderColor : "#c7c7cb",
    borderRadius : 6,
    padding : 10
  },
  top_left_button_text : {
    fontWeight : "bold",
    fontSize : 20,
    color : "#000"
  },

  top_right_button : {
    flex : 1,
    backgroundColor : "#fff",
    justifyContent : "center",
    alignItems : "center",
    borderWidth : 1,
    borderColor : "#c7c7cb",
    borderRadius : 6,
    padding : 10,
    marginLeft : 10
  },
  top_right_button_text : {
    fontWeight : "bold",
    fontSize : 20,
    color : "#000"
  },

  form_area : {
    marginTop : 10,
    paddingHorizontal : 10
  },

  title_area : {
    marginTop : 10
  },
  title_text : {
    color : "#000",
    fontWeight : "bold",
    fontSize : 15
  },
  title_input_area : {
    flexDirection : "row",
    backgroundColor : "#e5e5e5",
    marginTop : 5,
    borderRadius : 10
  },
  title_input : {
    flex : 1,
    color : "#000",
    paddingLeft : 10
  },


  desc_area : {
    marginTop : 10
  },
  desc_text : {
    color : "#000",
    fontWeight : "bold",
    fontSize : 15
  },
  desc_input_area : {
    flexDirection : "row",
    backgroundColor : "#e5e5e5",
    marginTop : 5,
    borderRadius : 10
  },
  desc_input : {
    flex : 1,
    color : "#000",
    paddingLeft : 10
  },

  save_button_area : {
    marginTop : 20,
    marginBottom : 40
  },
  save_button : {
    justifyContent : "center",
    alignItems : "center",
    backgroundColor : "#785af1",
    paddingVertical : 15,
    borderRadius : 15
  },
  save_button_text : {
    color : "#fff",
    fontWeight  :"bold",
    fontSize : 15
  },

  error_text : {
    color : "red"
  }

});

export default styles;
