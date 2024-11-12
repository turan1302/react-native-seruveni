import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  button_area: {
    marginBottom: 20,
    flexDirection: "row",
    alignItems: "center",
    borderWidth: 1,
    borderColor: "#ccc",
    padding: 10,
    borderRadius: 10,
  },

  image: (position, width, height) => ({
    width: (position === "PORTRAIT") ? width * 0.15 : height * 0.15,
    height: (position === "PORTRAIT") ? width * 0.15 : height * 0.15,
    objectFit: "cover",
  }),

  image_detail: {
    flex: 1,
    marginLeft: 10,
  },
  image_detail_text: {
    fontWeight: "bold",
    fontSize : 14,
    color : "#000"
  },
});

export default styles;
