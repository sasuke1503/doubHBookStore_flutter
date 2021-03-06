import 'package:get_storage/get_storage.dart';

import '../model/userLoginInfoModel.dart';

class Config{
  static Map<String, String> APP_API = {
    "book":"/books",
    "login": "/auth/login-user",
    "registration": "/registration",
    "active1": "/registration/activate/:activeCode",
    "active2": "/registration/activate",
    "forgotPassword": "/auth/forgot",
    "resetPassword": "/auth/reset",
    "resetUserData": "/auth/reset/:resetCode",
    "userInfo": "/users/account/info",
    "editProfile": "/users/account/edit",
    "editPassword": "/auth/edit/password",
    "bookDetail": "/books/",
    "makeCart": "/users/makecart",
    "addToCart": "/users/cart/add",
    "getCart": "/users/getcart",
    "deleteCartItem": "/users/cart/delete/",
    "updateCartItem": "/users/cart/update",
    "order": "/users/order",
    "purchase": "/users/orders",
    "addressOrder": "/users/address",
    "addAddress": "/users/address/add",
    "updateAddress": "/users/address/edit/:id",
    "deleteAddress": "/users/address/delete/",
    "getAddressByUser": "/users/address",
    "getAddress": "/users/address/",
    "newBook": "/books/new",
    "bestSellingBook": "/books/best-selling",
    "bestDiscountBook": "/books/best-discount",
    "relatedBooks": "/books/related-products/1",
    "categoryBooks": "/books/categories",
    "booksSearch": "/books/search",
    "addReview": "/users/review/add",
    "addReplyReview": "/users/reviewrep/add",
    "cancelOrder": "/users/orders/canel/:id"
  };

  static Map<String, String>  HTTP_CONFIG = {
    "baseURL": "http://192.168.1.59:8080/api/v1"
  };
  static GetStorage box = GetStorage();
  static dynamic e = (box.read("userInfo"));
  static UserLoginInfoModel userInfo = new UserLoginInfoModel(firstName: e["firstName"], lastName: e["lastName"], email: e["email"], token: e["token"], userRole: e["userRole"]);

  static Map<String, String>  HEADER = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '${userInfo.token.toString()}'
  };
}
