import { observable, action, makeAutoObservable, autorun, reaction } from "mobx";
import { when } from "mobx/src/api/when";

class AuthStore {
  user = "Muhammed Fatih";

  constructor() {
    makeAutoObservable(this, {
      user: observable,
    });
  }
}

export default new AuthStore();
