import React, { Component } from "react";
import { Platform, Text, View } from "react-native";
import { check, checkMultiple, PERMISSIONS } from "react-native-permissions";

export default class App extends Component {

  /*
      GRANTED ---> İZİN VERİLDİ
      DENIED ---> İZİN VERİLMEDİ
      BLOCKED ---> İZİN İPTAL EDİLDİ
   */

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.permissionControl();
  }

  permissionControl = () => {
    const PermissionCamera = Platform.select({
      android: PERMISSIONS.ANDROID.CAMERA,
      ios: PERMISSIONS.IOS.CAMERA
    });

    const PermissionMicrophone = Platform.select({
      android: PERMISSIONS.ANDROID.RECORD_AUDIO,
      ios: PERMISSIONS.IOS.MICROPHONE
    });

    const PermissionMedia = Platform.select({
      android: PERMISSIONS.ANDROID.READ_EXTERNAL_STORAGE,
      ios: PERMISSIONS.IOS.MEDIA_LIBRARY
    });


    // ÇOĞUL İZİN ALMA
    checkMultiple([PermissionCamera,PermissionMicrophone,PermissionMedia]).then((res)=>{
      console.log("Kamera: ",res[PermissionCamera]);
      console.log("Mikrofon: ",res[PermissionMicrophone]);
      console.log("Medya: ",res[PermissionMedia]);
    }).catch((err)=>{
      console.log(err);
    })

    /*
        TEKIL IZIN ALMA


    check(PERMISSIONS.ANDROID.CAMERA).then((res)=>{
      console.log("Kamera: ",res);
    }).catch((err)=>{
      console.log(err);
    })

    check(PERMISSIONS.ANDROID.RECORD_AUDIO).then((res)=>{
      console.log("Mikrofon: ",res);
    }).catch((err)=>{
      console.log(err);
    })

    check(PERMISSIONS.ANDROID.READ_EXTERNAL_STORAGE).then((res)=>{
      console.log("Medya: ",res);
    }).catch((err)=>{
      console.log(err);
    })

     */
  };

  render() {
    return (
      <View>
        <Text> TextInComponent </Text>
      </View>
    );
  }
}
