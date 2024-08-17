import { Component } from "react";
import { Text, View } from "react-native";

export default class App extends Component {
  render() {
    // justify-content:    **** kullanacağımız komutlar
    /*
     | 'flex-start'   ---> en başa hizalar
    | 'flex-end'    ---> en sona hizalar
    | 'center'    ---> ortaya konumlandırır
    | 'space-between'   ----> aralarına boşluk açarak konumlandırır
    | 'space-around'    ---> aralarına boşluk açar, en dış kısımlardan boşluk bırakır
    | 'space-evenly'   ----> aralarına kapsayıcı içerisindeki elementlerin kendi payları kadar boşluk açar, dışarıya da aynı şekilde boşluk verir
     */

    /*
    dikey eksende

      <View style={{flex : 1,flexDirection : "column",justifyContent : "space-between"}}>
          <View style={{height : 150,width : 150,backgroundColor : "red"}}/>
          <View style={{height : 150,width : 150,backgroundColor : "blue"}}/>
      </View>

      yatay eksende
       <View style={{flex : 1,flexDirection : "row",justifyContent : "space-evenly"}}>
        <View style={{height : 90,width : 90,backgroundColor : "red"}}/>
        <View style={{height : 90,width : 90,backgroundColor : "green"}}/>
        <View style={{height : 90,width : 90,backgroundColor : "brown"}}/>
        <View style={{height : 90,width : 90,backgroundColor : "blue"}}/>
      </View>


      column-reverse
        <View style={{ flex: 1, flexDirection: "column-reverse", justifyContent: "space-evenly" }}>
        <View style={{ height: 90, width: 90, backgroundColor: "red" }} />
        <View style={{ height: 90, width: 90, backgroundColor: "green" }} />
        <View style={{ height: 90, width: 90, backgroundColor: "brown" }} />
        <View style={{ height: 90, width: 90, backgroundColor: "blue" }} />
      </View>

      */

    return (
      <View style={{ flex: 1, flexDirection: "row-reverse", justifyContent: "space-evenly" }}>
        <View style={{ height: 90, width: 90, backgroundColor: "red" }} />
        <View style={{ height: 90, width: 90, backgroundColor: "green" }} />
        <View style={{ height: 90, width: 90, backgroundColor: "brown" }} />
        <View style={{ height: 90, width: 90, backgroundColor: "blue" }} />
      </View>
    );
  }
}
