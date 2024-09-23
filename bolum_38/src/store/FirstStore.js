import { observable, action } from "mobx";

class FirstStore {
  @observable name = "MFSoftware Blog";

  @action checkName = (name)=>{
    this.name = name;
  }
}

export default new FirstStore();
