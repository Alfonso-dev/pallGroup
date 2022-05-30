import 'package:flutter/material.dart';

class ProviderDatas with ChangeNotifier {
  String namePlayer = '';
  String dni = '';
  String date = '';
  String phone = '';
  String mail = '';
  bool btnPress = false;

  String get getNamePlayer {
    return namePlayer;
  }

  set setNamePlayer(data) {
    namePlayer = data;
    notifyListeners();
  }

  String get getDni {
    return dni;
  }

  set setDni(data) {
    dni = data;
    notifyListeners();
  }

  String get getDate {
    return date;
  }

  set setDate(data) {
    date = data;
    notifyListeners();
  }

  String get getPhone {
    return phone;
  }

  set setPhone(data) {
    phone = data;
    notifyListeners();
  }

  String get getMail {
    return mail;
  }

  set setMail(data) {
    mail = data;
    notifyListeners();
  }

  bool get getBtnPress {
    return btnPress;
  }

  set setBtnPress(data) {
    btnPress = data;
    notifyListeners();
  }
}
