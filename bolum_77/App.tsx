import React, { Component } from "react";
import { Platform, SafeAreaView, Text, View } from "react-native";
import Routes from "./src/routes";
import { Provider } from "mobx-react";
import Store from "./src/store";
import { AlertNotificationRoot } from "react-native-alert-notification";
import { checkMultiple, openSettings, PERMISSIONS, requestMultiple } from "react-native-permissions";

export default class App extends Component {

  constructor(props) {
    super(props);

    this.controlPermissions();
  }

  controlPermissions = () => {
    const camera = Platform.select({
      android: PERMISSIONS.ANDROID.CAMERA
    });

    const microphone = Platform.select({
      android: PERMISSIONS.ANDROID.RECORD_AUDIO
    });

    const read_external = Platform.select({
      android: PERMISSIONS.ANDROID.READ_EXTERNAL_STORAGE
    });

    const write_external = Platform.select({
      android: PERMISSIONS.ANDROID.WRITE_EXTERNAL_STORAGE
    });

    checkMultiple([camera,microphone,read_external,write_external]).then((check)=>{
      if (check[camera]==="denied" || check["microphone"]==="denied" || check[read_external]==="denied" || check[write_external]==="denied"){
        requestMultiple([camera,microphone,read_external,write_external]).then((res)=>{
          if (
            (res[camera]==="denied" || res[camera]==="blocked") ||
            (res[microphone]==="denied" || res[microphone]==="blocked") ||
            (res[read_external]==="denied" || res[read_external]==="blocked") ||
            (res[write_external]==="denied" || res[write_external]==="blocked")
          ){
            openSettings().catch((err)=>console.log(err));
          }
        }).catch((err)=>{
          console.log(err);
        })
      }
    }).catch((err)=>{
      console.log(err);
    })
  };

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
