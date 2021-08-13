import 'package:docusign/screens/web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import '../styles.dart';

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({Key key}) : super(key: key);

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: oasRed,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => WebView()));
                  // Provider.of<PowerFormProvider>(context, listen: false)
                  //     .powerForm
                  //     .addAll({
                    // 'fullName': '${firstName.text} ${lastName.text}',
                    // 'address': address.text,
                    // 'city': city.text,
                    // 'zip': zipcode.text,
                    // 'phone-cell': phoneNumber.text,
                    // 'phone-home': phoneNumber.text,
                    // 'email': email.text
               //   });
                  // PowerForm().sendDataToPowerForm();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
