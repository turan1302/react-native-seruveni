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

  // images
  static images = this.apiURL+"/images"; // anasayfada kullanılacak
  static get_images = this.apiURL+"/images/get-images"; // profil kısmında kullanılacak
  static images_store = this.apiURL+"/images/store";
  static images_show = this.apiURL+"/images/show";
  static images_edit = this.apiURL+"/images/edit";
  static images_update = this.apiURL+"/images/update";
  static images_delete = this.apiURL+"/images/delete";
}

export default AppUrl;
