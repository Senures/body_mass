import 'dart:math';

import 'package:body_mass/core/constant/gender_enum.dart';
import 'package:body_mass/page/result/view/result_view.dart';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final BuildContext context;

  double height = 100;
  double weight = 50;
  int age = 19;
  double bmi = 0.0;
  Gender gender = Gender.Female;
  //enum classından değişken
  String status = "";
  String tip = "";
  String moreTips = "";
  Color? statusColor;
  BmiModel? model;

  HomeProvider(this.context);

  setHeight(double h) {
    height = h;
    notifyListeners();
  }

  ageReduction() {
    if (age <= 0) {
      age = 0;
    } else {
      age--;
    }
    notifyListeners();
  }

  ageIncrease() {
    if (age >= 110) {
      age = 110;
    } else {
      age++;
    }
    notifyListeners();
  }

  weightReduction() {
    if (weight <= 0) {
      weight = 0;
    } else {
      weight--;
    }
    notifyListeners();
  }

  weightIncrease() {
    if (weight >= 300) {
      weight = 300;
    } else {
      weight++;
    }
    notifyListeners();
  }

  bodyMassCalculate() {
    bmi = weight / pow((height / 100), 2);
    print("boyy " + height.toString());
    print("kilo " + weight.toString());
    print("vücut kitle endeksisdsdsd: " + bmi.toString());

    if (bmi < 18.5) {
      model = BmiModel(
          status: 'Under Weight',
          tip:
              'Being underweight could be a sign youre not eating enough or you may be ill. ',
          moreTips: '\nIf youre underweight, a GP can help.',
          statusColor: Color(0xffFFC93E),
          bmi: bmi,
          gender: gender);
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultView(model: model!),
        ),
      );
    } else if (bmi >= 18.5 && bmi <= 25) {
      print("vücut kitle endeksi: " + bmi.toString());
      model = BmiModel(
          status: 'Normal',
          tip: 'Keep up the good work! ',
          moreTips:
              '\nFor tips on maintaining a healthy weight, check out the food and diet and fitness sections.',
          statusColor: const Color(0xff0DC9AB),
          bmi: bmi,
          gender: gender);
      /*  status = 'Normal';
      statusColor = ;
      tip = 'Keep up the good work!';
      moreTips =
          '\nFor tips on maintaining a healthy weight, check out the food and diet and fitness sections.'; */
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultView(model: model!),
        ),
      );
      notifyListeners();
    } else if (bmi > 25 && bmi <= 30) {
      print("vücut kitle endeksi: " + bmi.toString());
      model = BmiModel(
          status: 'Over Weight',
          tip:
              'The best way to lose weight if you are overweight is through a combination of diet and exercise. ',
          moreTips:
              '\nThe BMI calculator will give you a personal calorie allowance to help you achieve a healthy weight safely.',
          statusColor: const Color(0xFFe07422),
          bmi: bmi,
          gender: gender);
      /*   status = 'Over Weight';
      tip =
          'The best way to lose weight if you are overweight is through a combination of diet and exercise.';
      moreTips =
          '\nThe BMI calculator will give you a personal calorie allowance to help you achieve a healthy weight safely.';
      statusColor = Colors.orange; */
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultView(model: model!),
        ),
      );
      notifyListeners();
    } else {
      print("vücut kitle endeksi: " + bmi.toString());
      model = BmiModel(
          status: 'Obese',
          tip:
              'The best way to lose weight if you are obese is through a combination of diet and exercise. ',
          moreTips:
              '\nand, in some cases, medicines. See a GP for help and advice.',
          statusColor: const Color(0xffF45656),
          bmi: bmi,
          gender: gender);
      /*   status = 'Obese';
      tip =
          'The best way to lose weight if you are obese is through a combination of diet and exercise.';
      moreTips =
          '\nand, in some cases, medicines. See a GP for help and advice.';
      statusColor = Colors.red; */
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultView(model: model!),
        ),
      );
    }
    notifyListeners();
    print("vücut kitle endeksi: " + bmi.toString());
  }

  setGender(Gender g) {
    gender = g;
    notifyListeners();
  }
}

class BmiModel {
  final String status;
  final String tip;
  final String moreTips;
  final Color? statusColor;
  final double bmi;
  final Gender gender;
  BmiModel(
      {required this.status,
      required this.tip,
      required this.moreTips,
      required this.statusColor,
      required this.bmi,
      required this.gender});
}
