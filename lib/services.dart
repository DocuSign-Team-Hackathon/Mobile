import 'package:dio/dio.dart';
import 'package:docusign/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PowerForm {
  Future<void> sendDataToPowerForm(Map<String, dynamic> queryParameters , BuildContext context) async {
    Dio dio = Dio();
    var response = await dio.get(
        'https://demo.docusign.net/Member/PowerFormSigning.aspx?PowerFormId=cc332d81-dd07-4f59-8938-8e6e42623cd0&env=demo&acct=70effc48-d52c-4e4d-adb8-828bf793ebca&v=2',
        queryParameters: queryParameters);

    String baseUrl = response.request.uri.toString().replaceAll('++=', '=');
    Provider.of<PowerFormProvider>(context, listen: false).url = baseUrl;
    print(baseUrl);

  }
}
