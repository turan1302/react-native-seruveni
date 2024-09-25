import { observable, action, makeAutoObservable, autorun } from "mobx";

class FirstStore {
  name = "MFSoftware Blog";
  city = "KONYA";

  constructor() {
    makeAutoObservable(this, {
      name: observable,
      checkName: action,
    });

    autorun(()=>{
      alert(this.city);
    });
  }

  checkName = (name) => {
    this.name = name;
    this.city = "Istanbul";
  };
}

export default new FirstStore();
