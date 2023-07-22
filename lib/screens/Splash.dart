import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital/screens/Home.dart';
import 'package:hospital/widgets/text_widget.dart';
class Splash extends StatefulWidget
{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  bool position=false;
  var opacity=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero,(){
      animator();
    });
  }
  animator() async
  {

    if(opacity==0)
    {
      opacity=1;
      position=true;
    }
    else
    {
      opacity=0;
      position=false;
    }

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
                top: position?60:150,
              left: 20,
              right: 20,
              child:  AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    TextWidget("Complete", 35, Colors.black, FontWeight.bold,letterSpace: 5,),
                    const SizedBox(height: 5,),
                    TextWidget("Health", 35, Colors.black, FontWeight.bold, letterSpace:  5,),
                    const SizedBox(height: 5,),
                    TextWidget("Solution", 35, Colors.black, FontWeight.bold,letterSpace: 5,),
                    const SizedBox(height: 20,),
                    TextWidget("Early Protection for\nFamily Health", 18, Colors.black.withOpacity(.7), FontWeight.bold),
                  ],
                ),
              ),
               ),
            AnimatedPositioned(
              bottom: 1,
                left: position?50:150, duration: const Duration(milliseconds: 400),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: opacity,
                  child: Container(
                    height: 450,
                    width: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/doctor6.png'),
                        fit: BoxFit.fill
                      )
                    ),
            ),
                )),
            AnimatedPositioned(
              bottom: 60,
                duration: const Duration(milliseconds: 400),
                left: position?20:-100,
                child: InkWell(
                  onTap: ()
                  {
                    position=false;
                    opacity=0;
                    setState(() {
                    });
                    Timer(const Duration(milliseconds: 400),() {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                    },);
                  },
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 400),
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child:  TextWidget("Get Started", 17, Colors.white, FontWeight.bold,letterSpace: 0,),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}