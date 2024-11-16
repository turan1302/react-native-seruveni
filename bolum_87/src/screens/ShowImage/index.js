import React, { Component } from "react";
import { Alert, Dimensions, Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import { inject, observer } from "mobx-react";
import AuthLayout from "../../components/Layout/AuthLayout";
import Entypo from "react-native-vector-icons/Entypo";
import RestClient from "../../RestAPI/RestClient";
import AppUrl from "../../RestAPI/AppUrl";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";
import Loader from "../../components/Home/Loader";
import styles from "./styles";

@inject("AuthStore")
@observer

export default class ShowImage extends Component {

  constructor(props) {
    super(props);

    this.state = {
      windowDimensions: Dimensions.get("window"),
      isLoading: true,
      image: {},
    };
  }

  componentDidMount() {
    const { navigation } = this.props;
    this.dimensionsSubscription = Dimensions.addEventListener("change", this.handleResize);

    navigation.setOptions({
      headerShown: true,
      title: "Resim Detay",
      headerShadowVisible: false,
      headerRight: () => (
        <TouchableOpacity onPress={() => {
          Alert.alert("Dikkat!", "Resim silinecektir. Onaylıyor musunuz ?", [
            {
              text: "Sil",
              onPress: () => this.removeImage(),
            },
            {
              text: "Vazgeç",
            },
          ]);
        }}>
          <Entypo name={"trash"} color={"#000"} size={20} />
        </TouchableOpacity>
      ),
    });

    this.getImage();
  }

  getImage = async () => {
    const { navigation, route } = this.props;

    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.getRequest(AppUrl.images_show + `/${route.params.img_id}`, {
      headers: {
        "Authorization": "Bearer " + token,
      },
    }).then((res) => {
      const status = res.status;
      const result = res.data;

      if (status === 200) {
        this.setState({
          isLoading: false,
          image: result.data,
        });
      } else {
        if (status === 404) {
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody: result.message,
            button: "Kapat",
            autoClose: 2000,
          });
          this.props.AuthStore.removeToken();
        } else {
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
    }).catch((err) => {
      Dialog.show({
        type: ALERT_TYPE.DANGER,
        title: "Hata",
        textBody: "Sunucu bazlı bir hata oluştu. Lütfen daha sonra tekrar deneyiniz",
        button: "Kapat",
        autoClose: 2000,
      });
      this.props.AuthStore.removeToken();
    });
  };

  removeImage = async () => {
    const { navigation, route } = this.props;

    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.postRequest(AppUrl.images_delete, {
      img_id: route.params.img_id,
    }, {
      headers: {
        "Authorization": "Bearer " + token,
      },
    }).then((res) => {
      const status = res.status;
      const result = res.data;

      if (status === 200) {
        Dialog.show({
          type: ALERT_TYPE.SUCCESS,
          title: result.title,
          textBody : result.message,
          autoClose : 2000
        });
        setTimeout(()=>{
          navigation.goBack();
        },2000);
      }else{
        if (status===404){
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody : result.message,
            button : "Kapat",
            autoClose : 2000
          });
         this.props.AuthStore.removeToken();
        }else{
          Dialog.show({
            type: ALERT_TYPE.DANGER,
            title: result.title,
            textBody : result.message,
            button : "Kapat",
            autoClose : 2000
          });
          this.props.AuthStore.removeToken();
        }
      }
    }).catch((err)=>{
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

  componentWillUnmount() {
    if (this.dimensionsSubscription) {
      this.dimensionsSubscription.remove();
    }
  }

  handleResize = ({ window }) => {
    this.setState({
      windowDimensions: window,
    });
  };

  render() {
    const {image,isLoading} = this.state;
    const {width,height} = this.state.windowDimensions;
    const position = width>height ? "LANDSCAPE" : "PORTRAIT";


    return (
      <AuthLayout>
        {isLoading ? (<Loader/>) : (
            <ScrollView showsVerticalScrollIndicator={false} bounces style={styles.scroll_container}>
               <Image style={styles.image(width)} source={{uri : AppUrl.storageURL+image.img_image}}/>
               <View style={styles.detail_container_area}>
                 <View style={styles.detail_title_area}>
                   <Text style={styles.detail_title}>{image.img_name}</Text>
                 </View>
                 <Text style={styles.detail_desc}>{image.img_desc}</Text>
               </View>
            </ScrollView>
        )}
      </AuthLayout>
    );
  }
}
