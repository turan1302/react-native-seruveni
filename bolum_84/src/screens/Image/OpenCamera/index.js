import React, { Component } from "react";
import { Text, TouchableOpacity, View } from "react-native";
import { RNCamera } from "react-native-camera";
import styles from "./styles";

export default class OpenCamera extends Component {

  constructor(props) {
    super(props);

    this.state = {
      isBlock: false,
    };
  }

  takePicture = async () => {
    const { navigation } = this.props;
    this.setState({
      isBlock: true,
    });

    if (this.camera) {
      const options = { quality: 0.5, base64: true };
      const data = await this.camera.takePictureAsync(options);

      navigation.navigate("NewImage", {
        img_image: data.uri,
      });
    }
  };

  render() {
    const { isBlock } = this.state;

    return (
      <View style={styles.container}>
        <RNCamera
          ref={ref => {
          this.camera = ref;
        }}
          style={styles.preview}
          type={RNCamera.Constants.Type.back}
          flashMode={RNCamera.Constants.FlashMode.on}
        >
          <View style={styles.capture_area}>
            <TouchableOpacity disabled={isBlock} onPress={this.takePicture.bind(this)} style={styles.capture}/>
          </View>
        </RNCamera>
      </View>
    );
  }
}
