import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "#fcfcff", paddingHorizontal: 20 },
  form_top_area: {
    marginTop: 100,
    alignItems: "center",
  },
  form_top_image: {
    width: "100%",
    height: 100,
  },
  form_top_text: {
    marginTop: 20,
    color: "black",
    fontWeight: "bold",
    fontSize: 20,
  },

  form_area: {
    marginTop: 38,
  },
  form_email_area: {
    flexDirection: "row",
    alignItems: "center",
    borderBottomWidth: 1,
    borderBottomColor: "#000",
  },
  form_email_input: {
    flex: 1,
    color: "#000",
  },
  form_email_icon: { paddingHorizontal: 8 },

  form_password_area : {
    flexDirection : "row",
    alignItems : "center",
    borderBottomWidth : 1,
    borderBottomColor : "#000",
    marginTop : 20
  },
  form_password_input : {
    flex : 1,
    color :"#000"
  },
  form_password_icon : {
    paddingHorizontal : 8
  },

  form_login_button : {
    marginTop : 30,
    alignItems : "center",
    justifyContent : "center",
    backgroundColor : "#cdcdcd",
    paddingVertical : 15,
    borderRadius : 10
  },
  form_login_button_text : {
    color : "black",
    fontWeight : "bold"
  },

  signup_text_area : {
    marginVertical : 20,
    alignItems : "center"
  },
  signup_text : {
    fontSize : 13,
    fontWeight : "bold",
    color : "#000"
  },

  error_text : {color : "red"}
});

export default styles;
