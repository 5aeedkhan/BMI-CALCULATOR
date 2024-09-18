import 'package:flutter/material.dart';
import 'package:modularbmi/Widgets/bottom_button.dart';
import 'package:modularbmi/Widgets/reuable_card.dart';
import 'package:modularbmi/Widgets/reuable_container.dart';
import 'package:modularbmi/Widgets/round_icon.dart';
import 'package:modularbmi/calculator_brain.dart';
import 'package:modularbmi/results_page.dart';

enum Gender {
  male,
  female,
}

const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kTextStyle1 =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
const kNumberStyle2 =
    TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white);
Gender? selectedGender;
int height = 150;
int userWeight = 70;
int userAge = 19;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: ListView(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableContainer(
                        colour: selectedGender == Gender.male
                            ? Colors.blue
                            : kActiveCardColour,
                        childContainer: ReusableCard(
                          text: 'MALE',
                          icon: Icons.male,
                        )),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableContainer(
                      colour: selectedGender == Gender.female
                          ? Colors.pink
                          : kActiveCardColour,
                      childContainer: ReusableCard(
                        text: 'FEMALE',
                        icon: Icons.female,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: kActiveCardColour,
              childContainer: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle2,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                  Slider(
                    min: 100,
                    max: 200,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    thumbColor: Color(0xFFEB1555),
                    value: height.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveCardColour,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle1,
                        ),
                        Text(
                          userWeight.toString(),
                          style: kNumberStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(
                                  () {
                                    if (userWeight > 0) {
                                      userWeight--;
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveCardColour,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle1,
                        ),
                        Text(
                          userAge.toString(),
                          style: kNumberStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(
                                  () {
                                    if (userAge > 0) {
                                      userAge--;
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    userAge++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calcBrain =
                  CalculatorBrain(height: height, weight: userWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calcBrain.calculateBMI(),
                            textResult: calcBrain.getResult(),
                            interpretation: calcBrain.getInterpretation(),
                          )));
            },
            bottomText: Text(
              'CALCULATE YOUR BMI',
              style: kTextStyle1,
            ),
          ),
        ],
      ),
    );
  }
}
