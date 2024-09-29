import { observable, action, makeAutoObservable, autorun, reaction, computed } from "mobx";
import { when } from "mobx/src/api/when";

class FirstStore {
  name = "MFSoftware Blog";
  city = "KONYA";

  constructor() {
    makeAutoObservable(this, {
      name: observable,
      checkName: action,
    });


    /*
    reaction(()=>this.city,city=>{
      if (city==="Istanbul"){
        alert("Istanbul'a hoş geldiniz :)");
      }
    })

     */

    when(() => this.city === "Istanbul", () => alert("İstanbul oldu"));
  }

  checkName = (name) => {
    this.name = name;
    this.city = "Istanbul";
  };

  checkCity = (name) => {
    this.city = "KONYA";
  };


  @computed get getUserInfo() {
    return `${this.name} ${this.city}`;
  }
}

export default new FirstStore();
