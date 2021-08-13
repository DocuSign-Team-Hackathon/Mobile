import 'package:flutter/cupertino.dart';

class PowerFormProvider extends ChangeNotifier{
  Map<String, dynamic> _powerForm = {};

  Map<String, dynamic> get powerForm => _powerForm;

  set powerForm(Map<String, dynamic> value) {
    _powerForm = value;
    notifyListeners();
  }

  String _url ='';

  String get url => _url;

  set url(String value) {
    _url = value;
    notifyListeners();
  }
}