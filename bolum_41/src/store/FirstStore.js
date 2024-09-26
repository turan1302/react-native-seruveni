import { observable, action, makeAutoObservable, autorun, reaction } from "mobx";

class FirstStore {
  name = "MFSoftware Blog";
  city = "KONYA";

  constructor() {
    makeAutoObservable(this, {
      name: observable,
      checkName: action,
    });

    reaction(()=>this.city,city=>{
      if (city==="Istanbul"){
        alert("Istanbul'a hoş geldiniz :)");
      }
    })
  }

  checkName = (name) => {
    this.name = name;
    this.city = "Istanbul";
  };
}

export default new FirstStore();
