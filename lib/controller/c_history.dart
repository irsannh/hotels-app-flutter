import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hotelioapp/model/booking.dart';
import 'package:hotelioapp/model/hotel.dart';
import 'package:hotelioapp/source/booking_source.dart';
import 'package:hotelioapp/source/hotel_source.dart';

class CHistory extends GetxController {


  final _listBooking = <Booking>[].obs;
  List<Booking> get listBooking => _listBooking.value;

  getListBooking(String id) async {
    _listBooking.value = await BookingSource.getHistory(id);
    update();
  }
}