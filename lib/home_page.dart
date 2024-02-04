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
              Container(
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
                      'Weight'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      '60',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 40,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 40,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
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
                      'Age'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      '28',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 40,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'CALCULATOR',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
