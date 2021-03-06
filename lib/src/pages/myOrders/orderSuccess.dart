import 'package:doubhBookstore_flutter_springboot/src/model/order.dart';
import 'package:doubhBookstore_flutter_springboot/src/pages/myOrders/orderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cartItem.dart';
import 'package:doubhBookstore_flutter_springboot/src/utils/CustomTextStyle.dart';
import 'package:doubhBookstore_flutter_springboot/src/utils/CustomUtils.dart';
import '../checkout/checkoutController.dart';
import '../mainLayout.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({List<CartItem>? items, Key? key}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderSuccessScreen> {
  final _controller = Get.put(CheckoutController());
  final _controller1 = Get.put(OrderController());

  final box = GetStorage();
  var formatter = NumberFormat('#,###,000');
  final prefs = SharedPreferences.getInstance();

  Widget orderInfo() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8, left: 8, top: 8),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: Text(
                        "Mã đơn hàng: 097gex1gaat392${_controller.orderSuccess.id.toString()}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8, left: 8, top: 8),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: Text(
                        "Ngày đặt: ${_controller.orderSuccess.date.toString()}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8, left: 8, top: 8),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: Text(
                        "Trạng thái: ${_controller.orderSuccess.status.toString()}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: Text(
                        "${_controller.orderSuccess.orderItems.length.toString()} sản phẩm:",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(bottom: 4, left: 5),
                        child: Text(
                          "Thành tiền: ",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(bottom: 2, right: 5),
                        child: Text(
                          _controller.orderSuccess.totelPrice.toString() + "đ",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  createOrderItemList(Future<List<Order>> Function() getOrder) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return createOrderItemListItem(
            _controller.orderSuccess.orderItems[index]);
      },
      itemCount: _controller.orderSuccess.orderItems.length,
    );
  }

  createOrderItemListItem(OrderItem orderItem) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 0.5))),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                    width: 60,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        color: Colors.blue.shade200,
                        image: DecorationImage(
                            image: NetworkImage(orderItem.book.image[0].image),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 8, top: 4),
                            child: Text(
                              orderItem.book.name.toString(),
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Utils.getSizedBox(height: 6),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                      ),
                                      child: Text(
                                        "${orderItem.book.category.nameCategory.toString()}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        color: Colors.transparent,
                                        padding: const EdgeInsets.only(
                                            bottom: 2, right: 5, left: 5),
                                        child: Text(
                                          "x" + orderItem.quantity.toString(),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          (orderItem.book.sale != null &&
                                  orderItem.book.sale != "")
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${formatter.format(orderItem.book.price - orderItem.book.price * orderItem.book.sale / 100).toString()}₫",
                                      style: CustomTextStyle.textFormFieldBlack
                                          .copyWith(color: Colors.redAccent),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                      ),
                                      child: Text(
                                        "${formatter.format(orderItem.book.price).toString()}₫",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                      ),
                                      child: Text(
                                        "${formatter.format(orderItem.book.price).toString()}₫",
                                        style: CustomTextStyle
                                            .textFormFieldBlack
                                            .copyWith(color: Colors.redAccent),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    flex: 100,
                  )
                ],
              ),
            ],
          )),
    );
  }

  @override
  void initState() {
    //print("before state");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isEmpty == false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Chi tiết đơn hàng"),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Builder(
          builder: (context) {
            return ListView(
              children: <Widget>[
                orderInfo(),
                createOrderItemList(
                    () async => await _controller1.getUserOrder(context)),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => MainLayout()));
                      },
                      child: Text(
                        "Tiếp tục mua sắm",
                        style: CustomTextStyle.textFormFieldMedium.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                  flex: 10,
                )
              ],
            );
          },
        ),
      );
    } else {
      return emptyCart();
    }
  }

  Scaffold emptyCart() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
                child: Container(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  "assets/empty_shopping_cart.png",
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Bạn chưa có sản phẩm trong giỏ hàng",
                  style: TextStyle(
                    color: Color(0xFF67778E),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
