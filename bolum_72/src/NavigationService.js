import {createNavigationContainerRef} from "@react-navigation/native";
export const navigationRef = createNavigationContainerRef();

export function back(){
  if (navigationRef.isReady()){
    navigationRef.goBack();
  }else{

  }
}

export function navigate(name,params){
  if (navigationRef.isReady()){
    navigationRef.navigate(name,params);
  }else{

  }
}

export function reset(){
  if (navigationRef.isReady()){
    navigationRef.reset({
      index : 0,
      routes : [
        {name : "Welcome"}
      ]
    })
  }else{

  }
}
