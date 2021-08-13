import 'package:docusign/screens/pre_application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class PetPage extends StatefulWidget {
  const PetPage({Key key}) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: oasBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meet Coco',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: Image.asset(
                      'assets/image1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coco is Available',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: oasRed),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      //
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(oasBlue),
                              side: MaterialStateProperty.all(BorderSide(
                                color: oasBlue,
                              ))),
                          child: Text(
                            'SCHEDULE A VISIT',
                            style: TextStyle(color: oasBlue),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: MaterialButton(
                          color: oasRed,
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => PreApplication()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          child: const Text(
                            'Adopt Me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 150,
                    child: Image.asset(
                      'assets/Component.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
