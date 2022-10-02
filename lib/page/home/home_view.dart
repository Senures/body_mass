import 'package:body_mass/core/constant/gender_enum.dart';
import 'package:body_mass/page/home/provider/home_provider.dart';
import 'package:body_mass/page/result/view/result_view.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../core/base/base_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(
      viewModel: HomeProvider(context),
      onModelReady: (model) {},
      onDispose: (model) {},
      onPageBuilder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: DelayedDisplay(
                    delay: const Duration(milliseconds: 350),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.setGender(Gender.Male);
                              },
                              child: Neumorphic(
                                  padding: const EdgeInsets.all(15.0),
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape:
                                          const NeumorphicBoxShape.circle(),
                                      depth: 8,
                                      lightSource: LightSource.topLeft,
                                      color: provider.gender == Gender.Male
                                          ? const Color(0xffC8C7FF)
                                          : const Color(0xffF6F9FE)),
                                  child: Image.asset(
                                    "assets/images/boy.png",
                                    width: 100.0,
                                  )),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  color: const Color(0xff626365),
                                  fontSize: 22.0,
                                  fontWeight: provider.gender == Gender.Male
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.setGender(Gender.Female);
                              },
                              child: Neumorphic(
                                  padding: const EdgeInsets.all(15.0),
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 8,
                                      lightSource: LightSource.topLeft,
                                      color: provider.gender == Gender.Female
                                          ? const Color(0xffC8C7FF)
                                          : const Color(0xffF6F9FE)),
                                  child: Image.asset(
                                    "assets/images/girl.png",
                                    width: 100.0,
                                  )),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: const Color(0xff626365),
                                  fontSize: 22.0,
                                  fontWeight: provider.gender == Gender.Female
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )
                          ],
                        ),
                      ],
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
                              const Text(
                                "HEIGHT",
                                style: TextStyle(
                                  color: Color(0xff626365),
                                  fontSize: 24.0,
                                ),
                              ),
                              Text(
                                provider.height.toInt().toString() + " cm",
                                style: const TextStyle(
                                    color: Color(0xff5D5F60),
                                    fontSize: 29.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              NeumorphicSlider(
                                style: const SliderStyle(
                                  accent: Color(0xff7776FE),
                                ),
                                height: 15,
                                min: 100,
                                max: 210,
                                value: provider.height.toDouble(),
                                onChanged: (percent) =>
                                    provider.setHeight(percent),
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
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 30,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: const Color(0xffF6F9FE)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "AGE",
                                        style: TextStyle(
                                          color: Color(0xff626365),
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      Text(
                                        provider.age.toString(),
                                        style: const TextStyle(
                                            color: Color(0xff5D5F60),
                                            fontSize: 39.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              provider.ageReduction();
                                            },
                                            child: NeumorphicIcon(
                                              Icons.remove_circle,
                                              size: 60,
                                              style: const NeumorphicStyle(
                                                  color: Color(0xffF6F9FE)),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              provider.ageIncrease();
                                            },
                                            child: NeumorphicIcon(
                                              Icons.add_circle,
                                              size: 60,
                                              style: const NeumorphicStyle(
                                                  color: Color(0xffF6F9FE)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 30,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: const Color(0xffF6F9FE)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "WEIGHT",
                                        style: TextStyle(
                                          color: Color(0xff626365),
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      Text(
                                        provider.weight.toInt().toString(),
                                        style: const TextStyle(
                                            color: Color(0xff5D5F60),
                                            fontSize: 39.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              provider.weightReduction();
                                            },
                                            child: NeumorphicIcon(
                                              Icons.remove_circle,
                                              size: 60,
                                              style: const NeumorphicStyle(
                                                  color: Color(0xffF6F9FE)),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              provider.weightIncrease();
                                            },
                                            child: NeumorphicIcon(
                                              Icons.add_circle,
                                              size: 60,
                                              style: const NeumorphicStyle(
                                                  color: Color(0xffF6F9FE)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: DelayedDisplay(
                      delay: const Duration(milliseconds: 1400),
                      child: NeumorphicButton(
                        child: const Text(
                          "CALCULATE YOUR BMI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        pressed: true,
                        onPressed: () {
                          provider.bodyMassCalculate();
                        },
                        style: const NeumorphicStyle(color: Color(0xff7776FE)),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
