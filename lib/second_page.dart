import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff221935),
      appBar: AppBar(
        backgroundColor: Color(0xff221935),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'BMI Result',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: Color(0xff0A001F),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Норма',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff08E82C),
                  ),
                ),
                Text(
                  '24.6',
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Ваш вес в норме',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CalculateWidget(
        calcText: 'Посчитать',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
