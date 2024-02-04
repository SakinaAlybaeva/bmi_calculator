import 'package:bmi_calculator/second_Page.dart';
import 'package:flutter/material.dart';

Color activeColor = Colors.pink;
Color inacitveColor = const Color(0xff0A001F).withOpacity(0.95);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleColor = inacitveColor;
  Color femaleColor = inacitveColor;
  double heightValue = 155;
  int weight = 35;
  int age = 15;

  void changeGenderColor(int san) {
    if (san == 1) {
      maleColor = activeColor;
      femaleColor = inacitveColor;
    } else if (san == 2) {
      femaleColor = activeColor;
      maleColor = inacitveColor;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff221935),
      appBar: AppBar(
        backgroundColor: const Color(0xff221935),
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderWidget(
                icon: Icons.male,
                text: 'Male',
                onTap: () {
                  changeGenderColor(1);
                },
                tus: maleColor,
              ),
              GenderWidget(
                icon: Icons.female,
                text: 'Female',
                onTap: () {
                  changeGenderColor(2);
                },
                tus: femaleColor,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: const Color(0xff0A001F).withOpacity(0.95),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  'Height'.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      heightValue.toStringAsFixed(0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'cm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: heightValue,
                  onChanged: (value) {
                    setState(() {
                      heightValue = value;
                    });
                  },
                  max: 220,
                  min: 55,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeightAge(
                text: 'Weight',
                onPressedMinus: () {
                  setState(() {});
                  weight = weight - 1;
                  ;
                },
                text2: weight,
                onPressedPlus: () {
                  setState(() {});
                  weight++;
                },
              ),
              WeightAge(
                text: 'Age',
                onPressedMinus: () {
                  setState(() {});
                  age = age - 1;
                },
                text2: age,
                onPressedPlus: () {
                  setState(() {});
                  age++;
                },
              ),
            ],
          ),
          CalculateWidget(
            calcText: 'Calculator',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CalculateWidget extends StatelessWidget {
  const CalculateWidget({
    super.key,
    this.onTap,
    this.calcText,
  });
  final Function()? onTap;
  final String? calcText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            calcText!,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class WeightAge extends StatelessWidget {
  const WeightAge({
    super.key,
    this.text,
    this.onPressedPlus,
    this.text2,
    this.onPressedMinus,
  });
  final String? text;
  final Function()? onPressedPlus;
  final int? text2;
  final Function()? onPressedMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: const Color(0xff0A001F).withOpacity(0.95),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text!.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Text(
            text2!.toString(),
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: onPressedMinus,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: onPressedPlus,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    this.icon,
    this.text,
    this.onTap,
    this.tus,
  });
  final IconData? icon;
  final String? text;
  final Function()? onTap;
  final Color? tus;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: tus,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
            Text(
              text!.toUpperCase(),
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
