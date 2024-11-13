import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fcfcff",
    paddingHorizontal: 20,
  },

  form_name_area: {
    flexDirection: "row",
    alignItems: "center",
    borderBottomWidth: 1,
    borderBottomColor: "#000",
  },
  form_name_input: {
    flex: 1,
    color: "#000",
  },
  form_name_icon: {
    paddingHorizontal: 8,
  },

  form_surname_area: {
    marginTop: 20,
    flexDirection: "row",
    alignItems: "center",
    borderBottomWidth: 1,
    borderBottomColor: "#000",
  },
  form_surname_input: {
    flex: 1,
    color: "#000",
  },
  form_surname_icon: {
    paddingHorizontal: 8,
  },

  form_email_area: {
    marginTop: 20,
    flexDirection: "row",
    alignItems: "center",
    borderBottomWidth: 1,
    borderBottomColor: "#000",
  },
  form_email_input: {
    flex: 1,
    color: "#000",
  },
  form_email_icon: {
    paddingHorizontal: 8,
  },

  form_password_area: {
    marginTop: 20,
    flexDirection: "row",
    alignItems: "center",
    borderBottomWidth: 1,
    borderBottomColor: "#000",
  },
  form_password_input: {
    flex: 1,
    color: "#000",
  },
  form_password_icon: {
    paddingHorizontal: 8,
  },

  form_password_confirm_area: {
    marginTop: 20,
    flexDirection: "row",
    alignItems: "center",
    borderBottomWidth: 1,
    borderBottomColor: "#000",
  },
  form_password_confirm_input: {
    flex: 1,
    color: "#000",
  },
  form_password_confirm_icon: {
    paddingHorizontal: 8,
  },

  form_account_update_button: {
    marginVertical: 30,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "#785af1",
    paddingVertical: 15,
    borderRadius: 10,
  },

  form_account_update_button_text: {
    color: "#fff",
    fontWeight: "bold",
  },

  error_text: {
    color: "red",
  },
});

export default styles;
