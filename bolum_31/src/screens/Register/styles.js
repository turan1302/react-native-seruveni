import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#3b3b3b",
    paddingHorizontal: 15,
  },
  image_container: {
    marginTop: 120,
    marginBottom: 60,
    alignItems: "center",
  },
  image: { width: "80%", height: 80, objectFit: "contain" },
  fullname_area: {
    flexDirection: "row",
    backgroundColor: "#595959",
    borderRadius: 10,
    paddingVertical: 3,
  },
  email_area: {
    flexDirection: "row",
    backgroundColor: "#595959",
    borderRadius: 10,
    paddingVertical: 3,
    marginTop: 5,
  },
  password_area: {
    flexDirection: "row",
    backgroundColor: "#595959",
    borderRadius: 10,
    paddingVertical: 3,
    marginTop: 5,
  },
  input_style: { flex: 1, paddingLeft: 15, color: "white" },

  button_style: {
    marginTop: 30,
    justifyContent: "center",
    alignItems: "center",
    paddingVertical: 15,
    borderWidth: 1.5,
    borderColor: "#ababab",
    borderRadius: 10,
  },
  button_text: { color: "white", fontWeight: "bold", fontSize: 15 },

  footer_button_style : { flexDirection: "row", alignItems: "center", justifyContent: "center",marginBottom : 15},
  footer_button_text : { textAlign: "center", marginTop: 25, color: "white", fontWeight: "bold" }
});

export default styles;
