import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container : {flex : 1,backgroundColor : "#fcfcff",paddingHorizontal : 10},
  page_area : {marginBottom : 20},

  profile_info_container : {
    justifyContent : "center",
    alignItems : "center",
    marginTop : 100
  },
  profile_name : {
    fontWeight : "bold",
    fontSize : 20,
    color : "#000"
  },

  report_area : {
    marginTop : 20,
    flexDirection : "row",
    alignItems : "center"
  },

  left_report_area : {
    backgroundColor : "#fff",
    borderWidth : 1,
    borderColor : "#ccc",
    borderRadius : 10,
    flex : 1,
    justifyContent : "center",
    alignItems : "center",
    padding : 20
  },
  left_report_title : {
    color : "#000",
    fontWeight : "bold",
    fontSize : 15
  },
  left_report_text : {
    marginTop : 15,
    fontSize : 20,
    color : "#000",
    fontWeight : "bold"
  },

  right_report_area : {
    backgroundColor : "#fff",
    borderWidth : 1,
    borderColor : "#ccc",
    borderRadius : 10,
    flex : 1,
    marginLeft : 20,
    justifyContent : "center",
    alignItems : "center",
    padding : 20
  },
  right_report_title : {
    color : "#000",
    fontWeight : "bold",
    fontSize : 15
  },
  right_report_text : {
    marginTop : 15,
    fontSize : 20,
    color : "#000",
    fontWeight : "bold"
  },

  logout_area : {
    marginVertical : 40,
    justifyContent : "center",
    alignItems : "center"
  },
  logout_button : {
    padding : 10,
    borderWidth : 0.7,
    borderColor : "#ccc",
    borderRadius : 8
  },
  logout_text : {
    color : "#000",
    fontWeight : "bold",
    fontSize : 20
  },

  last_photos_area : {
    flexDirection : "row",
    justifyContent : "space-between",
    alignItems : "center"
  },
  last_photos_left_title : {
    fontWeight : "bold",
    color : "#000"
  },
  last_photos_right_text : {
    fontWeight : "bold",
    color : "#785af1"
  },

  last_photos_card_area : {
    padding : 10,
    borderWidth : 1,
    borderColor : "#ccc",
    borderRadius : 10,
    flexDirection : "row",
    marginTop : 15
  },
  last_photos_card_image : (position,width,height)=>({
    width : (position==="PORTRAIT") ? width*0.20 : height*0.20,
    height : (position==="PORTRAIT") ? width*0.20 : height*0.20,
    objectFit : "contain"
  }),

  last_photos_detail_area : {
    marginLeft : 20,
    flex : 1,
    justifyContent : "center"
  },

  last_photos_detail_date : {
    color : "#000",
    fontWeight : "bold",
    alignSelf : "flex-end"
  },

  last_photos_detail_info : {
    marginTop : 10
  },

  last_photos_detail_name : {
    color : "#000",
    fontWeight : "bold"
  },
  last_photos_detail_text : {
    color : "#000",
    fontWeight : "bold"
  },
});

export default styles;
