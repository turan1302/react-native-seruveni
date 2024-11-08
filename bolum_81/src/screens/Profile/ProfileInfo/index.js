import React, { Component } from "react";
import { Dimensions, Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import { inject, observer } from "mobx-react";
import AuthLayout from "../../../components/Layout/AuthLayout";
import styles from "./styles";
import CustomHeader from "../../../components/Profile/ProfileInfo/CustomHeader";
import FontAwesome5 from "react-native-vector-icons/FontAwesome5";

@inject("AuthStore")
@observer

export default class ProfileInfo extends Component {

  constructor(props) {
    super(props);

    this.state = {
      windowDimensions: Dimensions.get("window"),
    };
  }

  componentDidMount() {
    this.dimensionsSubscription = Dimensions.addEventListener("change", this.handleResize);
  }


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
    const { width, height } = this.state.windowDimensions;
    const position = width > height ? "LANDSCAPE" : "PORTRAIT";

    return (
      <AuthLayout>
        <ScrollView showsVerticalScrollIndicator={false} style={styles.container}>
          <View style={styles.page_area}>
            <CustomHeader />
            <View style={styles.profile_info_container}>
              <Text numberOfLines={1} style={styles.profile_name}>MFSoftware Blog</Text>
            </View>
            <View style={styles.report_area}>
              <View style={styles.left_report_area}>
                <Text style={styles.left_report_title}>Toplam Fotoğraf</Text>
                <Text style={styles.left_report_text}>5</Text>
              </View>
              <View style={styles.right_report_area}>
                <Text style={styles.right_report_title}>Bu Ay Yüklenen</Text>
                <Text style={styles.right_report_text}>3</Text>
              </View>
            </View>
            <View style={styles.logout_area}>
              <TouchableOpacity style={styles.logout_button}>
                <Text style={styles.logout_text}>
                  <FontAwesome5 name={"door-open"} color={"#000"} size={20} /> Çıkış Yap
                </Text>
              </TouchableOpacity>
            </View>
            <View>
              <View style={styles.last_photos_area}>
                <Text style={styles.last_photos_left_title}>Son Eklenen Fotoğraf</Text>
                <TouchableOpacity>
                  <Text style={styles.last_photos_right_text}>Tümünü Gör</Text>
                </TouchableOpacity>
              </View>
              <View style={styles.last_photos_card_area}>
                <Image source={require("../../../assets/logo/mfsoftware-blog.png")}
                       style={styles.last_photos_card_image(position, width, height)} />
                <View style={styles.last_photos_detail_area}>
                  <Text style={styles.last_photos_detail_date}>19 October 2024</Text>

                  <View style={styles.last_photos_detail_info}>
                    <Text style={styles.last_photos_detail_name}>Minecrafts</Text>
                    <Text style={styles.last_photos_detail_text}>Steves</Text>
                  </View>
                </View>
              </View>
            </View>
          </View>
        </ScrollView>
      </AuthLayout>
    );
  }
}
