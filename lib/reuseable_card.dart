import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {

  ReuseableCard({@required this.colour, this.cardChild}); //Constructor created so that Resuable card can change color.
  //@required keyword tells the constructor that a colour is required.
  
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: 
      BoxDecoration(
        color: colour, //Note here we need to 
                                    //keep this code inside BoxDecoration not as a property of the container.
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}