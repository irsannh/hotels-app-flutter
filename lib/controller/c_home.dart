import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CHome extends GetxController {
  final _indexPage = 0.obs;
  int get indexPage => _indexPage.value;
  set indexPage(n) => _indexPage.value = n;
}