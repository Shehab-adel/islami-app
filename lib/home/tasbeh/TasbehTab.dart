import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../main.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({Key? key}) : super(key: key);

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;

  List<String> tasbehlist = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  int currentIndex = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              InkWell(
                onTap: () {
                  sebaCounter();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Transform.rotate(
                      angle: math.pi / 180 * angle,
                      child: Image.asset('assets/images/body of seb7a.png')),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05),
                child: Image.asset('assets/images/head of seb7a.png'),
              ),
            ],
          ),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '$counter',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 80,
                width: 200,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    sebaCounter();
                  },
                  child: Text(
                    tasbehlist[currentIndex],
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  void sebaCounter() {
    angle += 30;
    counter++;
    if (counter > 33) {
      counter = 0;
      currentIndex++;
    }
    if (currentIndex > 2) {
      counter = 0;
      currentIndex = 0;
    }
    setState(() {});
  }
}
