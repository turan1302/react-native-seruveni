import React, { Component } from "react";
import { Platform, Text, View } from "react-native";
import { openSettings, PERMISSIONS, request, requestMultiple } from "react-native-permissions";

export default class App extends Component {

  /*
    granted ---> izin verildi
    denied ---> izin verilmemiş
    blocked ---> izin kilitlenmiş

    openSettings()
   */

  componentDidMount() {
    const CameraPermission = Platform.select({
      android: PERMISSIONS.ANDROID.CAMERA,
      ios: PERMISSIONS.IOS.CAMERA
    });

    const MicrophonePermission = Platform.select({
      android: PERMISSIONS.ANDROID.RECORD_AUDIO,
      ios: PERMISSIONS.IOS.MICROPHONE
    });

    const MediaPermission = Platform.select({
      android: PERMISSIONS.ANDROID.READ_EXTERNAL_STORAGE,
      ios: PERMISSIONS.IOS.MEDIA_LIBRARY
    });


    requestMultiple([CameraPermission,MicrophonePermission,MediaPermission]).then((res)=>{
      console.log("Kamera: ",res[CameraPermission]);
      console.log("Mikrofon: ",res[MicrophonePermission]);
      console.log("Media: ",res[MediaPermission]);

      if ((res[CameraPermission]==="denied" || res[CameraPermission]==="blocked") ||
        (res[MicrophonePermission]==="denied" || res[MicrophonePermission]==="blocked") ||
        (res[MediaPermission]==="denied" || res[MediaPermission]==="blocked")
      ){
        openSettings().catch((err)=>alert(err));
      }

    }).catch((err)=>{
      console.log(err);
    })

    /*
        tekil izin isteme

    request(CameraPermission).then((res)=>{
      console.log(res);
    }).catch((err)=>{
      console.log(err);
    })

     */
  }

  render() {
    return (
      <View>
        <Text> TextInComponent </Text>
      </View>
    );
  }
}
