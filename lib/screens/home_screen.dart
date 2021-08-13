import 'package:flutter/material.dart';

import '../styles.dart';
import 'PetPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: oasBlue,
        title: Container(
          height: 60,
          child: Image.asset(
            'assets/OAS_logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              child: Image.asset(
                'assets/Filters.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Pets Available for Adoption',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) =>
                    petTile(breed: 'vdfj j iodjf oidjoi ', i: 1 + index),
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> name = ['Coco', 'Yoshi', 'Ross', 'Bella', 'Oreo', 'Max'];

  Widget petTile({String breed, int i}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PetPage()));
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Image.asset(
                'assets/image$i.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    name[i - 1],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: oasRed),
                  ),
                  Text(
                    'Adult. Large Male. Husky',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
