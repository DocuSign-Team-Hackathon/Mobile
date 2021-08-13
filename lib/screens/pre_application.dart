import 'package:docusign/provider.dart';
import 'package:docusign/screens/adoption_form.dart';
import 'package:docusign/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class PreApplication extends StatefulWidget {
  @override
  _PreApplicationState createState() => _PreApplicationState();
}

class _PreApplicationState extends State<PreApplication> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController age = TextEditingController();

  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();

  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget buildApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oasBlue,
        title: const Text('Pet Adoption Pre-Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ListTile(
                  title: Text('Name: Coco'),
                  subtitle: Text('Id : 58183'),
                  trailing: Image.asset('assets/coco.png'),
                ),
              ),
              textFieldInput(controller: firstName, label: 'First Name'),
              textFieldInput(controller: lastName, label: 'Last Name'),
              FormBuilderDropdown(
                name: 'gender',
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                // initialValue: 'Male',
                allowClear: true,
                hint: Text('Select Gender'),
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text('$gender'),
                        ))
                    .toList(),
              ),
              textFieldInput(
                  controller: age,
                  label: 'Age',
                  keyboardType: TextInputType.number),
              textFieldInput(controller: address, label: 'Address'),
              textFieldInput(controller: city, label: 'City'),
              textFieldInput(
                  controller: zipcode,
                  label: 'Zip Code',
                  keyboardType: TextInputType.number),
              textFieldInput(
                  controller: phoneNumber,
                  label: 'Phone Number',
                  keyboardType: TextInputType.number),
              textFieldInput(
                  controller: email,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress),
              FormBuilderCheckbox(
                name: 'accept_terms',
                initialValue: false,
                decoration: InputDecoration.collapsed(border: InputBorder.none),
                title: Text(
                    'Do you understand that your name and information will be  checked in our system to confirm that you do not have any  history of animal abuse, neglect, or irresponsible pet ownership? *'),
                validator: FormBuilderValidators.equal(
                  context,
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
              FormBuilderCheckbox(
                name: 'accept',
                decoration: InputDecoration.collapsed(border: InputBorder.none),
                initialValue: false,
                title: Text(
                    'Are you 18 years or older? * (please be prepared to show valid ID) '),
                validator: FormBuilderValidators.equal(
                  context,
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: oasRed,
                onPressed: () {
                  String fullName =firstName.text+' ' +lastName.text;
                  Provider.of<PowerFormProvider>(context, listen: false)
                      .powerForm
                      .addAll({
                    'fullName': firstName.text,
                    'address': address.text,
                    'city': city.text,
                    'zip': zipcode.text,
                    'phone-cell': phoneNumber.text,
                    'phone-home': phoneNumber.text,
                    'email': email.text
                  });
               PowerForm().sendDataToPowerForm(    Provider.of<PowerFormProvider>(context, listen: false)
                   .powerForm , context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AdoptionForm()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(oasRed),
                    side: MaterialStateProperty.all(BorderSide(
                      color: oasRed,
                    ))),
                child: Text(
                  'Reset',
                  style: TextStyle(color: oasRed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create: (_)=>  PowerFormProvider(),
        child: buildApp(context));
  }

  Widget textFieldInput(
      {String label,
      TextEditingController controller,
      TextInputType keyboardType}) {
    return FormBuilderTextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: label,
      ),
      onChanged: (v) {},
      controller: controller,
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.numeric(context),
        FormBuilderValidators.max(context, 70),
      ]),
      keyboardType: keyboardType ?? TextInputType.name,
    );
  }
}
