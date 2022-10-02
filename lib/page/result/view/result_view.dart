import 'package:body_mass/core/constant/gender_enum.dart';
import 'package:body_mass/page/home/home_view.dart';
import 'package:body_mass/page/home/provider/home_provider.dart';
import 'package:body_mass/page/result/provider/result_provider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/base/base_view.dart';

class ResultView extends StatelessWidget {
  final BmiModel model;
  const ResultView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ResultProvider>(
      viewModel: ResultProvider(context),
      onModelReady: (model) {},
      onDispose: (model) {},
      onPageBuilder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: DelayedDisplay(
                    delay: const Duration(milliseconds: 350),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "Your",
                                  style: TextStyle(
                                      color: Color(0xff7776FE),
                                      fontSize: 45.0,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Result",
                                  style: TextStyle(
                                      color: Color(0xff5D5F60),
                                      fontSize: 45.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Neumorphic(
                              padding: const EdgeInsets.all(5),
                              style: const NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 8,
                                  lightSource: LightSource.topLeft,
                                  color: Color(0xffF6F9FE)),
                              child: Image.asset(
                                model.gender == Gender.Male
                                    ? "assets/images/boy.png"
                                    : "assets/images/girl.png",
                                width: 70.0,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DelayedDisplay(
                    delay: const Duration(milliseconds: 700),
                    child: Neumorphic(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            depth: 8,
                            lightSource: LightSource.topLeft,
                            color: const Color(0xffF6F9FE)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                model.status,
                                style: TextStyle(
                                    color: model.statusColor,
                                    fontSize: 38.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                model.bmi.toStringAsFixed(1),
                                style: const TextStyle(
                                    color: Color(0xff7776FE),
                                    fontSize: 52.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "kg/m2",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 122, 124, 126),
                                  fontSize: 19.0,
                                ),
                              ),
                              NeumorphicButton(
                                curve: Neumorphic.DEFAULT_CURVE,
                                child: const Text(
                                  "Save Result",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                pressed: true,
                                onPressed: () {
                                  //hive kaydedicek
                                },
                                style: const NeumorphicStyle(
                                    color: Color(0xff7776FE)),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DelayedDisplay(
                    delay: const Duration(milliseconds: 1050),
                    child: Neumorphic(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            depth: 8,
                            lightSource: LightSource.topLeft,
                            color: const Color(0xffF6F9FE)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(
                              child: Text(
                                "advice",
                                style: TextStyle(
                                    color: Color(0xff7776FE),
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              model.tip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xff626365),
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: DelayedDisplay(
                      delay: const Duration(milliseconds: 1400),
                      child: NeumorphicButton(
                        child: const Text(
                          "RE-CALCULATE YOUR BMI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 23.0),
                        pressed: true,
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage(),
                            ),
                          );
                        },
                        style: const NeumorphicStyle(color: Color(0xff7776FE)),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
