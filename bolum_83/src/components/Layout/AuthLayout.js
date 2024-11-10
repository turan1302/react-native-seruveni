import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { inject, observer } from "mobx-react";

@inject("AuthStore")
@observer

export default class AuthLayout extends Component {

  constructor(props) {
    super(props);

    this.isAuthenticated();
  }

  isAuthenticated = async ()=>{
    await this.props.AuthStore.tokenControl();
  }

  render() {
    return (
      <>
        {this.props.children}
      </>
    )
  }
}
