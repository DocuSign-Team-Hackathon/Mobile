import 'package:docusign/screens/pre_application.dart';
import 'package:docusign/screens/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import '../services.dart';
import '../styles.dart';

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({Key key}) : super(key: key);

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  TextEditingController q1 = TextEditingController();
  TextEditingController q2 = TextEditingController();
  TextEditingController q3 = TextEditingController();
  TextEditingController q4 = TextEditingController();
  TextEditingController q5 = TextEditingController();
  TextEditingController q6 = TextEditingController();
  TextEditingController q7 = TextEditingController();
  TextEditingController q8 = TextEditingController();
  TextEditingController q9 = TextEditingController();
  TextEditingController q10 = TextEditingController();
  TextEditingController q11 = TextEditingController();
  TextEditingController q12 = TextEditingController();
  TextEditingController q13 = TextEditingController();
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oasBlue,
        title: const Text('Pet Adoption Pre-Application'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              textFieldInput(context,
                  controller: q1, label: 'Why do you want a dog?'),
              textFieldInput(context,
                  controller: q2,
                  label: 'Why did you select this particular dog?'),
              textFieldInput(context,
                  controller: q3,
                  label: 'How many people live in the home?',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q4,
                  label: 'Adults',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q5,
                  label: 'Children',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q6,
                  label: 'Ages',
                  keyboardType: TextInputType.number),
              FormBuilderCheckbox(
                name: 'accept_terms',
                initialValue: false,
                decoration: InputDecoration.collapsed(border: InputBorder.none),
                onChanged: (v) {
                  setState(() {
                    check1 = v;
                  });
                },
                title: Text('Are there children who visit the home regularly?'),
                validator: FormBuilderValidators.equal(
                  context,
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
              textFieldInput(context,
                  controller: q7,
                  label: 'How many other animals do you currently have?',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q8,
                  label: 'Dogs',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q9,
                  label: 'Cats',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q10,
                  label: 'Other',
                  keyboardType: TextInputType.number),
              textFieldInput(context,
                  controller: q11, label: 'If you have dogs, what breeds?'),
              textFieldInput(context,
                  controller: q12,
                  label: 'Why did you select this particular dog?'),
              textFieldInput(context,
                  controller: q13,
                  label: 'Why did you select this particular dog?'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: oasRed,
                onPressed: () {

                  Provider.of<PowerFormProvider>(context, listen: false)
                      .powerForm
                      .addAll({
                  'd_3_1': q1.text,
                  'd_4': q2.text,
                  'd_5': q3.text,
                  'd_5_a': q4.text,
                  'd_5_b': q5.text,
                  'd_5_c': q6.text,
                  'd_6_a': check1,
                  'd_7_a': q8.text,
                  'd_7_b': q9.text,
                  'd_7_c': q10.text,
                  'd_7_d': q11.text,
                    });
                  print(Provider.of<PowerFormProvider>(context, listen: false)
                      .powerForm.toString() + '22222222222222222222');
                  PowerForm().sendDataToPowerForm(   Provider.of<PowerFormProvider>(context, listen: false)
                      .powerForm ,context
                  ).whenComplete(() {
                    //navigate to webview
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WebView()));
                  });
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
