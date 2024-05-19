import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button  extends GetxController{
  String _orderType = 'Required';
  String get orderType => _orderType;
  void setOrderType(String type){
    _orderType = type;
    update();
  }
}