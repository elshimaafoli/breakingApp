import 'package:breaking_app/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/BreakingBad.png'),
                  ),
                ),
              ),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  'Welcome  !\n to your favourite series',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                    color: MyColors.myCoffee,
                  ),
                  speed: Duration(milliseconds: 80),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Login');
                  },
                  child: Text('login'),
                  padding: EdgeInsets.all(10),
                  fillColor: MyColors.myCoffee,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.myBrown,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
