import React, { Component } from "react";
import { Text, TouchableOpacity, View } from "react-native";
import PushNotification from "react-native-push-notification";

const CHANNEL_ID = "test";
export default class App extends Component {

  constructor(props) {
    super(props);

    PushNotification.createChannel({
        channelId: CHANNEL_ID,
        channelName: "Benim Bildirim Kanalım",
        channelDescription: "Benim Bildirim Kanalımın Açıklaması",
        sound: "default",
        importance: PushNotification.Importance.HIGH,
        vibrate: true
      },
      (created) => console.log(`Kanal oluşturuldu '${created}'`)
    );

    this.state = {
      channelId : CHANNEL_ID
    }
  }

  sendNotification = ()=>{
    PushNotification.localNotification({
      channelId : this.state.channelId,
      title :  "MFSoftware Blog",
      message : "React Native Serüveni"
    });
  }

  render() {
    return (
     <View style={{flex : 1,justifyContent : "center",alignItems :"center"}}>
      <Text style={{color : "black",fontWeight : "bold"}}>Yerel bildirim gönder</Text>
       <TouchableOpacity onPress={this.sendNotification} style={{backgroundColor : "blue",padding : 10,marginTop : 20,borderRadius : 8}}>
         <Text style={{color : "white"}}>Bildirim Gönder</Text>
       </TouchableOpacity>
     </View>
    );
  }
}
