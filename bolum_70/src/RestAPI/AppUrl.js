class AppUrl {
  static baseURL = "http://127.0.0.1:8000";
  static storageURL = "http://127.0.0.1:8000/storage/";
  static apiURL = this.baseURL + "/api/mobile";

  // client
  static register = this.apiURL+"/client/register";
  static login = this.apiURL+"/client/login";
  static check = this.apiURL+"/client/check";
  static profile = this.apiURL+"/client/profile";
  static update_profile = this.apiURL+"/client/update-profile";
  static logout = this.apiURL+"/client/logout";
}

export default AppUrl;
