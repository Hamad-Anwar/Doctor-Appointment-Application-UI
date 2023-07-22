import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hospital/screens/SeeAll.dart';
import 'package:hospital/widgets/text_widget.dart';
import 'Profile.dart';
class Chat extends StatefulWidget {
  final AssetImage image;
  final String name;
  final String specialist;
  const Chat({super.key, required this.image,required this.name,required this.specialist});
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late Size size;
  var animate = false;
  var opacity = 0.0;

  animator() {
    if (opacity == 0.0) {
      opacity = 1.0;
      animate = true;
    } else {
      opacity = 0.0;
      animate = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 40),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: animate ? 1 : 50,
                bottom: 1,
                left: 1,
                right: 1,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: opacity,
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              height: 70,
                              color: Colors.white,
                              width: size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: ()
                                    {
                                      animator();
                                      Timer(const Duration(milliseconds: 500),()
                                      {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SeeAll(),));
                                      });
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_sharp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async
                                    {
                                      animator();
                                      await Future.delayed(const Duration(milliseconds: 400));
                                      await Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(image: widget.image,name: widget.name,speciality: widget.specialist),));
                                      animator();
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.blue,
                                      backgroundImage: widget.image,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        widget.name,
                                        15,
                                        Colors.black,
                                        FontWeight.bold,
                                        letterSpace: 0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                          ),
                                          TextWidget(
                                            "online",
                                            13,
                                            Colors.black,
                                            FontWeight.normal,
                                            letterSpace: 1,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.video_camera_front,
                                            color: Colors.white.withOpacity(.7),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.wifi_calling_outlined,
                                            color: Colors.white.withOpacity(.7),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                            top: 70,
                            child: Container(
                              height: size.height / 1.35,
                              width: size.width,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30,),
                                  msgBox(size, "Use the Stick on other hand Fandit", "08:20",Colors.blue.withOpacity(.1),Colors.grey),
                                  const SizedBox(height: 30,),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: msgBox(size, "Thanks doc!", "09:20",Colors.blue.shade900,Colors.white),
                                  ),
                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          height: 1,
                                          width: size.width/3,
                                          color: Colors.black.withOpacity(.5),
                                        ),
                                      ),
                                      TextWidget("today", 14, Colors.black.withOpacity(.5),FontWeight.bold),
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          color: Colors.black.withOpacity(.5),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                  msgBox(size, "Morning!\n\nHow the result did it\nwork well", "08:20",Colors.blue.withOpacity(.1),Colors.grey),
                                  const SizedBox(height: 30,),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child:
                                    msgBox(size, "Morning doc,Problem is\nsolved,Thanks doc", "08:25",Colors.blue.shade900,Colors.white),
                                  ),
                                  const Image(image: AssetImage('assets/images/emoji.png',),width: 130,height: 130,)
                                ],
                              ),
                            )),
                        Positioned(
                            bottom: 10,
                            left: 30,
                            right: 30,
                            child: Container(
                              padding: const EdgeInsets.only(left: 40, right: 40),
                              height: size.height / 13,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type Something...",
                                      suffixIcon: Transform.rotate(
                                          angle: -0.7,
                                          child: const Icon(
                                            Icons.send,
                                            color: Colors.blue,
                                            size: 30,
                                          ))),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
  Widget msgBox(Size size,String msg,String time,Color color,Color textColor){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      width: size.width/2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            msg,
            15,
            textColor,
            FontWeight.bold,
            letterSpace: 1,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextWidget(
              time,
              13,
              textColor,
              FontWeight.bold,
              letterSpace: 0,
            ),
          ),
        ],
      ),
    );
  }
}
