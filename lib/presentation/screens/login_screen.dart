import 'package:breaking_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Back..!',
        ),
        backgroundColor: MyColors.myCoffee,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.only(top: 50, left: 5, right: 5),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  width: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/BreakingBad.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3, color: MyColors.myCoffee),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3, color: MyColors.myCoffee),
                  ),
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    wordSpacing: 2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(width: 3, color: MyColors.myCoffee),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(width: 3, color: MyColors.myCoffee),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      wordSpacing: 2,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'homelayout');
                },
                child: const Text('Login'),
                padding: EdgeInsets.all(15),
                fillColor: MyColors.myCoffee,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
    );
  }
}
