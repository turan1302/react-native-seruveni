import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  scroll_container: { flex: 1, backgroundColor: "#fcfcff" },
  image: (width) => ({
    width: width,
    height: width * 0.7,
    objectFit: "contain",
  }),
  detail_container_area: {
    backgroundColor: "#fcfcff",
    marginTop: -20,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
    paddingHorizontal: 10,
    marginBottom: 20,
  },
  detail_title_area: {
    justifyContent: "center",
    alignItems: "center",
    marginTop: 20,
  },
  detail_title: {
    color: "#000",
    fontWeight: "bold",
    fontSize: 20,
  },
  detail_desc: {
    marginTop : 20,
    color : "#000",
    fontSize : 14
  },
});

export default styles;
