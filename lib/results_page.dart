import 'package:flutter/material.dart';
import 'package:modularbmi/Widgets/bottom_button.dart';
import 'package:modularbmi/Widgets/reuable_card.dart';
import 'package:modularbmi/Widgets/reuable_container.dart';
import 'package:modularbmi/home_screen.dart';

class ResultsPage extends StatefulWidget {
  final String bmiResult;
  final String textResult;
  final String interpretation;
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.interpretation,
      required this.textResult});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kTextStyle1,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kNumberStyle2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: kActiveCardColour,
              childContainer: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.textResult.toUpperCase(),
                    style: kTextStyle1,
                  ),
                  Divider(),
                  Text(
                    widget.bmiResult,
                    style: kTextStyle1,
                  ),
                  Divider(),
                  Text(
                    widget.interpretation,
                    style: kTextStyle1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              bottomText: Text(
                'RE CALCULATE',
                style: kTextStyle1,
              ))
        ],
      ),
    );
  }
}
