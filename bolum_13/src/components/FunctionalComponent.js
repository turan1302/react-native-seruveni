import { Text, View } from "react-native";
import PropTypes from "prop-types";

const FunctionalComponent = ({city,pc})=>{
  return (
    <View>
      <Text>{city} | {pc}</Text>
    </View>
  )
}

FunctionalComponent.propTypes = {
  city : PropTypes.string,
  pc : PropTypes.string.isRequired
}

FunctionalComponent.defaultProps = {
  city : "Konya"
}

export default FunctionalComponent;

