import 'package:flutter/material.dart';
import 'package:stay_updated/provider/ui/common/strings.dart';

class ProfileViewModel extends ChangeNotifier{
  bool nameReadOnly = true;
  void updateNameReadOnly(bool value){
    nameReadOnly = value;
    notifyListeners();
  }
  bool emailReadOnly = true;
  void updateEmailReadOnly(bool value){
    emailReadOnly = value;
    notifyListeners();
  }

  String fullName = AppStrings.randomName;
  // void updateName(String value){
  //   fullName = value;
  //   notifyListeners();
  // }
  void updateName(){
    fullName = nameController.text;
    notifyListeners();
  }

  String email = '';
  // void updateEmail(String value){
  //   email = value;
  //   notifyListeners();
  // }
  void updateEmail(){
    email = emailController.text;
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
}