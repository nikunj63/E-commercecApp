import 'package:flutter/material.dart';

class OrdreDetailProvider with ChangeNotifier {
  String? paymentMethod = "pay-now";

  void changePaymentMethod(String? value){
    paymentMethod = value ;
    notifyListeners();
  }
}