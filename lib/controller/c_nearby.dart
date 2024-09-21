import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hotelioapp/model/hotel.dart';
import 'package:hotelioapp/source/hotel_source.dart';

class CNearby extends GetxController {
  final _category = 'All Place'.obs;
  String get category => _category.value;
  set category(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => [
    'All Place',
    'Industrial',
    'Village',
  ];

  final _listHotel = <Hotel>[].obs;
  List<Hotel> get listHotel => _listHotel.value;

  getListHotel() async {
    _listHotel.value = await HotelSource.getHotel();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getListHotel();
    super.onInit();
  }
}