import React, { Component } from "react";
import { FlatList, Text, View } from "react-native";
import AuthLayout from "../../components/Layout/AuthLayout";
import { inject, observer } from "mobx-react";
import RestClient from "../../RestAPI/RestClient";
import AppUrl from "../../RestAPI/AppUrl";
import styles from "./styles";
import CustomHeader from "../../components/Home/CustomHeader";
import Loader from "../../components/Home/Loader";
import Empty from "../../components/common/Empty";
import ListItem from "../../components/Home/ListItem";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";

@inject("AuthStore")
@observer

export default class Home extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isLoading: true,
      images: [],
    };
  }

  componentDidMount() {
    const { navigation } = this.props;
    navigation.addListener("focus", async () => {
      await this.getImages();
    });
  }

  getImages = async () => {
    await this.props.AuthStore.getToken();
    const token = this.props.AuthStore.appState?.user?.access_token;

    await RestClient.getRequest(AppUrl.images,{
      headers : {
        "Authorization" : "Bearer "+token
      }
    }).then((res)=>{
      const result = res.data;
      const status = res.status;

      if (status===200){
        this.setState({
          isLoading : false,
          images : result.data
        });
      }else{
        if (status===401 || status===500){
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        }else{
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        }
      }

    }).catch((err)=>{
      console.log(err);
      Dialog.show({
        type: ALERT_TYPE.DANGER,
        title: "Hata",
        textBody: "Sunucu bazlı bir hata oluştu. Lütfen daha sonra tekrar deneyiniz",
        button: "Kapat",
        autoClose: 2000,
      });
      this.props.AuthStore.removeToken();
    })
  };

  render() {
    const {images,isLoading} = this.state;

    return (
      <AuthLayout>
        <View style={styles.container}>
          <CustomHeader/>
          {(isLoading) ? (<Loader/>) : (
           <FlatList ListEmptyComponent={<Empty/>} data={images} keyExtractor={(item,index)=>index} renderItem={({item,index})=>(
             <ListItem item={item} index={index}/>
           )}/>
          )}
        </View>
      </AuthLayout>
    );
  }
}
