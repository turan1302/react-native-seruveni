import React, { Component } from "react";
import { Text, View } from "react-native";
import PushNotification from "react-native-push-notification";
import firebase from "@react-native-firebase/app";
import messaging from "@react-native-firebase/messaging";

const CHANNEL_ID = "test";

export default class App extends Component {

  constructor(props) {
    super(props);

    PushNotification.createChannel({
        channelId: CHANNEL_ID,
        channelName: "My Channel",
        channelDescription: "Benim remote notification projem",
        sound: "default",
        importance: PushNotification.Importance.HIGH,
        vibrate: true,
      },
      (created) => console.log(`Kanal Oluşturuldu ${created}`)
    );

    this.state = {
      channelId : CHANNEL_ID
    }
  }

  componentDidMount() {
    messaging().registerDeviceForRemoteMessages().then((res)=>{}).catch((err)=>console.log(err));
    messaging().hasPermission().then((enabled)=>{
      messaging().getToken().then(token=>console.log(token));
    });

    messaging().onMessage(notification=>{
      console.log(notification);
      PushNotification.localNotification({
        channelId : this.state.channelId,
        title : notification.notification?.title,
        message : notification.notification?.body,
      })
    })
  }

  render() {
    return (
      <View>
        <Text> TextInComponent </Text>
      </View>
    );
  }
}

// Must be outside of any component LifeCycle (such as `componentDidMount`).
PushNotification.configure({
  // (optional) Called when Token is generated (iOS and Android)
  onRegister: function(token) {
    console.log("TOKEN:", token);
  },

  // (required) Called when a remote is received or opened, or local notification is opened
  onNotification: function(notification) {
    console.log("NOTIFICATION:", notification);

    // process the notification

    // (required) Called when a remote is received or opened, or local notification is opened
    notification.finish(PushNotificationIOS.FetchResult.NoData);
  },

  // (optional) Called when Registered Action is pressed and invokeApp is false, if true onNotification will be called (Android)
  onAction: function(notification) {
    console.log("ACTION:", notification.action);
    console.log("NOTIFICATION:", notification);

    // process the action
  },

  // (optional) Called when the user fails to register for remote notifications. Typically occurs when APNS is having issues, or the device is a simulator. (iOS)
  onRegistrationError: function(err) {
    console.error(err.message, err);
  },

  // IOS ONLY (optional): default: all - Permissions to register.
  permissions: {
    alert: true,
    badge: true,
    sound: true
  },

  // Should the initial notification be popped automatically
  // default: true
  popInitialNotification: true,

  /**
   * (optional) default: true
   * - Specified if permissions (ios) and token (android and ios) will requested or not,
   * - if not, you must call PushNotificationsHandler.requestPermissions() later
   * - if you are not using remote notification or do not have Firebase installed, use this:
   *     requestPermissions: Platform.OS === 'ios'
   */
  requestPermissions: true
});
