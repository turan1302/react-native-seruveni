import { Text, TouchableOpacity, View } from "react-native";

const ComponentFirst = ({kisi1,change})=>{
  return (
    <View style={{marginBottom : 50}}>
      <Text style={{fontSize : 20,color : "black"}}>{kisi1}</Text>
      <TouchableOpacity style={{backgroundColor : "blue",padding : 10,width : 150}} onPress={change}>
        <Text style={{color : "white"}}>Değiştir</Text>
      </TouchableOpacity>
    </View>
  )
}

export default ComponentFirst;
