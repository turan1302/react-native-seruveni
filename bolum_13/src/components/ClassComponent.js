import React, { Component } from 'react'
import { Text, View } from 'react-native'
import PropTypes from "prop-types";

export default class ClassComponent extends Component {
  render() {
    const {name,age} = this.props;

    return (
      <View style={{borderBottomWidth : 1,borderColor : "black"}}>
        <Text>{name} | {age}</Text>
      </View>
    )
  }
}

ClassComponent.propTypes = {
  name : PropTypes.string.isRequired,
  age : PropTypes.number
}

ClassComponent.defaultProps = {
  age : 30
}
