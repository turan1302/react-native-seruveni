import { Text, TouchableOpacity, View } from "react-native";

const DrawerDesign = ({navigation})=>{
  return (
    <View style={{flex : 1,paddingHorizontal : 20}}>
      <TouchableOpacity onPress={()=>navigation.navigate("Home")} style={{marginTop : 30}}>
        <Text style={{fontWeight : "bold",color : "black"}}>Anasayfa</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={()=>navigation.navigate("Profile")} style={{marginTop : 30}}>
        <Text style={{fontWeight : "bold",color : "black"}}>Profil</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={()=>navigation.navigate("Coupons")} style={{marginTop : 30}}>
        <Text style={{fontWeight : "bold",color : "black"}}>Kuponlar</Text>
      </TouchableOpacity>
    </View>
  )
}

export default DrawerDesign;
