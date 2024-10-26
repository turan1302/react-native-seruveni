import React, { Component } from "react";
import { SafeAreaView, Text, View } from "react-native";
import Routes from "./src/routes";
import { Provider } from "mobx-react";
import Store from "./src/store";
import { AlertNotificationRoot } from "react-native-alert-notification";

export default class App extends Component {
  render() {
    return (
      <AlertNotificationRoot>
        <Provider {...Store}>
          <SafeAreaView style={{ flex: 1 }}>
            <Routes />
          </SafeAreaView>
        </Provider>
      </AlertNotificationRoot>
    );
  }
}
