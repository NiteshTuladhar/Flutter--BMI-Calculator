
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'round_icon_button.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 5;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  
  //1 =male , 2=Female
// void updateColor(Gender selectedgender){
// if (selectedgender == Gender.male){
// if(maleCardColor == inactiveCardColor){
// maleCardColor = activeCardColor;
// femaleCardColor = inactiveCardColor;
// }else{
// maleCardColor = inactiveCardColor;
// }
// }else{
// if(femaleCardColor == inactiveCardColor){
// femaleCardColor = activeCardColor;
// maleCardColor = inactiveCardColor;
// }else{
// femaleCardColor = inactiveCardColor;
// }
// }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: 
            Row(
              children: [
                Expanded(child: 
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                      child: ReuseableCard(    
                      colour: selectedGender == Gender.male? kActiveCardColor:kInactiveCardColor,//if else condition as a ternery operator.
                      cardChild: 
                        IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                    ),
                  ),
                ),
                Expanded(child: 
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableCard(
                      colour: selectedGender == Gender.female? kActiveCardColor:kInactiveCardColor,
                      cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
          ),
          
          
          Expanded(child: 
                  ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT',
                        style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text( height.toString(),
                            style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          //Here we used data:SliderTheme.of(context).copyWith() beacause we need to use the SliderTheme widget
                          //with the default values but also need our own customization.
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: 
                              RoundSliderThumbShape(enabledThumbRadius:15.0),
                            overlayColor: Color(0x29EB1555),
                            overlayShape: 
                              RoundSliderOverlayShape(overlayRadius:30.0),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                          ),
                          child: Slider(
                            value: height.toDouble(), 
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              
                              setState(() {
                                height = newValue.round();//We round the double value to the nearest integeter.
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          Expanded(child: 
            Row(
              children: [
                Expanded(child: 
                  ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if (weight>0)
                                  {
                                  weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: 
                  ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                        style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if (age>0)
                                  {
                                    age--;
                                  }
                                  
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              
              Navigator.push(context, MaterialPageRoute(builder: 
              (context)=> ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
          ),
        ],
      ),
    );
  }
}









