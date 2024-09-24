import { observable, action, makeAutoObservable } from "mobx";

class FirstStore {
  name = "MFSoftware Blog";
  city = "KONYA";

  constructor() {
    makeAutoObservable(this, {
      name: observable,
      checkName: action,
    });
  }

  checkName = (name) => {
    this.name = name;
    this.city = "Istanbul";
  };
}

export default new FirstStore();
