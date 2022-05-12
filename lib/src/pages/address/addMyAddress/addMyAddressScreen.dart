import 'package:doubhBookstore_flutter_springboot/src/model/myInfoModel.dart';
import 'package:doubhBookstore_flutter_springboot/src/model/myInfoUpdate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../model/address.dart';
import '../../../themes/light_color.dart';
import '../../../widgets/input_text.dart';
import 'addMyAddressController.dart';

class AddMyAddressScreen extends StatefulWidget {
  AddMyAddressScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AddMyAddressScreenState createState() => _AddMyAddressScreenState();
}

class _AddMyAddressScreenState extends State<AddMyAddressScreen> {
  @override
  void initState() {
    //c.checkEmpty(context);
    super.initState();
  }
  final _controller = Get.put(AddMyProfileController());
 // final _getProfileController = Get.put(EditMyProfileController());
  final TextEditingController ProvinceController = TextEditingController();
  final TextEditingController districtTownController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController neighborhoodVillageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget Body() {

    return SingleChildScrollView(

       child: Form(

                  key: _formKey,
                  child:Column(
                    children: [
                      InputTextWidget(
                          labelText: "Tỉnh/Thành Phố",
                          // initialValue: myInfoModel.firstName.toString(),
                          controller: ProvinceController,
                          icon: Icons.public,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 25.0,
                      ),
                      InputTextWidget(
                          labelText: "Huyện/Quận/Thành Phố",
                          controller: districtTownController,
                          icon: Icons.family_restroom,
                          obscureText: false,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ), InputTextWidget(
                          labelText: "Xã/Phường",
                          controller: neighborhoodVillageController,
                          icon: Icons.people,
                          obscureText: false,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ), InputTextWidget(
                          labelText: "Địa chỉ",
                          controller: addressController,
                          icon: Icons.person,
                          obscureText: false,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  )));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),

        //elevation: 0.0,
        title: Text("Thêm Địa Chỉ"),
      ),
      body: Column(
        children: [
          Body(),
          Stack(
            children: [
              Container(
                height: 80.0,
                child: ElevatedButton(
                  onPressed: () async {
                    String province = ProvinceController.text;
                    String district = districtTownController.text;
                    String neiborhood = neighborhoodVillageController.text;
                    String address = addressController.text;
                    //Address myAddress = new Address(id: agrs.address.id, provinceCity: province, districtTown: district, neighborhoodVillage: neiborhood, address: address)
                    _controller.addMyProfile(province,district,neiborhood,address, context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0.0,
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 9, bottom: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.blue,
                              offset: const Offset(0, 5),
                              blurRadius: 8.0),
                        ],
                        color: Colors.blue, // Color(0xffF05945/ Color(0xffF05945),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Thêm địa chỉ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'VL_Hapna',
                            color: Colors.white,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
