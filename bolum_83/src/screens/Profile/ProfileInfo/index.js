import React, { Component } from "react";
import { Dimensions, Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import { inject, observer } from "mobx-react";
import AuthLayout from "../../../components/Layout/AuthLayout";
import styles from "./styles";
import CustomHeader from "../../../components/Profile/ProfileInfo/CustomHeader";
import FontAwesome5 from "react-native-vector-icons/FontAwesome5";
import RestClient from "../../../RestAPI/RestClient";
import AppUrl from "../../../RestAPI/AppUrl";
import { ALERT_TYPE, Dialog } from "react-native-alert-notification";
import { format } from "date-fns";
import Loader from "../../../components/Profile/ProfileInfo/Loader";
import Empty from "../../../components/common/Empty";

@inject("AuthStore")
@observer

export default class ProfileInfo extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isLoading: true,
      client: {},
      total_image: 0,
      total_month: 0,
      last_photo: {},
      windowDimensions: Dimensions.get("window"),
    };
  }

  componentDidMount() {
    const { navigation } = this.props;
    this.dimensionsSubscription = Dimensions.addEventListener("change", this.handleResize);

    navigation.addListener("focus", async () => {
      await this.getUserInfo();
    });

    navigation.addListener("blur", async () => {
      await this.setState({
        client: {},
      });
    });
  }

  getUserInfo = async () => {
    await this.props.AuthStore.getAccessToken();
    const token = this.props.AuthStore.appState.user.access_token;

    await RestClient.getRequest(AppUrl.profile, {
      headers: {
        "Authorization": "Bearer " + token,
      },
    }).then((res) => {
      const result = res.data;
      const status = res.status;

      if (status === 200) {
        this.setState({
          isLoading: false,
          client: result.data.user,
          total_image: result.data.total_image,
          total_month: result.data.total_month,
          last_photo: result.data.last_photo,
        });
      }

      if (status === 401) {
        this.props.AuthStore.removeToken();
      }
    }).catch((err) => {
      console.log(err);
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

  dateFormat = (date) => {
    const newDate = new Date(date);

    const formattedDate = format(newDate, "d MMMM yyyy");
    return formattedDate;
  };

  logOut = () => {
    Dialog.show({
      type: ALERT_TYPE.SUCCESS,
      title: "Başarılı",
      textBody: "Çıkış işleminiz gerçekleştiriliyor. Lütfen bekleyiniz...",
      autoClose: 2000,
    });
    setTimeout(() => {
      this.props.AuthStore.removeToken();
    }, 2000);
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
    const { isLoading, client, total_image, total_month, last_photo } = this.state;
    const { width, height } = this.state.windowDimensions;
    const position = width > height ? "LANDSCAPE" : "PORTRAIT";

    const { navigation } = this.props;

    return (
      <AuthLayout>
        {(isLoading) ? <Loader /> : (
          <ScrollView showsVerticalScrollIndicator={false} style={styles.container}>
            <View style={styles.page_area}>
              <CustomHeader />
              <View style={styles.profile_info_container}>
                <Text numberOfLines={1} style={styles.profile_name}>{client.c_name + " " + client.c_surname}</Text>
              </View>
              <View style={styles.report_area}>
                <View style={styles.left_report_area}>
                  <Text style={styles.left_report_title}>Toplam Fotoğraf</Text>
                  <Text style={styles.left_report_text}>{total_image}</Text>
                </View>
                <View style={styles.right_report_area}>
                  <Text style={styles.right_report_title}>Bu Ay Yüklenen</Text>
                  <Text style={styles.right_report_text}>{total_month}</Text>
                </View>
              </View>
              <View style={styles.logout_area}>
                <TouchableOpacity style={styles.logout_button} onPress={this.logOut}>
                  <Text style={styles.logout_text}>
                    <FontAwesome5 name={"door-open"} color={"#000"} size={20} /> Çıkış Yap
                  </Text>
                </TouchableOpacity>
              </View>
              <View>
                <View style={styles.last_photos_area}>
                  <Text style={styles.last_photos_left_title}>Son Eklenen Fotoğraf</Text>
                  <TouchableOpacity onPress={()=>navigation.navigate("GalleryNavigator")}>
                    <Text style={styles.last_photos_right_text}>Tümünü Gör</Text>
                  </TouchableOpacity>
                </View>
                {last_photo !== null ? (
                  <View style={styles.last_photos_card_area}>
                    <Image source={{uri : AppUrl.storageURL+last_photo.img_image}}
                           style={styles.last_photos_card_image(position, width, height)} />
                    <View style={styles.last_photos_detail_area}>
                      <Text style={styles.last_photos_detail_date}>{this.dateFormat(last_photo.img_created_at)}</Text>

                      <View style={styles.last_photos_detail_info}>
                        <Text style={styles.last_photos_detail_name}>{last_photo.img_name}</Text>
                        <Text style={styles.last_photos_detail_text}>{last_photo.img_desc}</Text>
                      </View>
                    </View>
                  </View>
                ) : (<Empty/>)}
              </View>
            </View>
          </ScrollView>
        )}
      </AuthLayout>
    );
  }
}
