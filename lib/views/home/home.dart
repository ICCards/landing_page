import 'package:flutter/material.dart';
import 'package:landing_page/views/page1/page1.dart';
import 'package:landing_page/views/page2/page2.dart';
import 'package:landing_page/views/page3/page3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: const[
          Page1(),
          Page2(),
          Page3()
        ],),
      ),
    );
  }
}
