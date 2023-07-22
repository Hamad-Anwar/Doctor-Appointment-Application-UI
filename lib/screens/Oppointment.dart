import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital/widgets/text_widget.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'Profile.dart';

class Oppointment extends StatefulWidget {
  int index=0;
  Oppointment(this.index, {super.key});
  @override
  State<Oppointment> createState() => _OppointmentState();
}

class _OppointmentState extends State<Oppointment> {
  var images=[

    const AssetImage('assets/images/doctor2.png'),
    const AssetImage('assets/images/doctor3.png'),
    const AssetImage('assets/images/doctor4.png'),
    const AssetImage('assets/images/doctor5.png'),
    const AssetImage('assets/images/doctor6.png'),
    const AssetImage('assets/images/doctor7.png'),
    const AssetImage('assets/images/doctor5.png'),
  ];
  late Size size;
  var animate = false;
  var opacity = 0.0;

  var time = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();
    });
  }

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
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: animate ? 1 : 80,
                left: 1,
                bottom: 1,
                right: 1,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: opacity,
                  child: Container(
                    padding: const EdgeInsets.only(top: 70),
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 5,
                            right: 20,
                            left: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      animator();
                                      Timer(const Duration(milliseconds: 500), () {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.black,
                                    )),
                                TextWidget(
                                  "Oppointment",
                                  25,
                                  Colors.black,
                                  FontWeight.bold,
                                  letterSpace: 0,
                                ),
                                Container(
                                  height: 10,
                                ),
                              ],
                            )),
                        Positioned(
                            top: 70,
                            left: 20,
                            right: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SfDateRangePicker(
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                                backgroundColor: Colors.grey.withOpacity(.1),
                                allowViewNavigation: true,
                                enablePastDates: false,
                                headerHeight: 100,
                                selectionColor: Colors.blue,
                                toggleDaySelection: true,
                                showNavigationArrow: true,
                                selectionShape:
                                    DateRangePickerSelectionShape.circle,
                                onSelectionChanged:
                                    (dateRangePickerSelectionChangedArgs) {},
                                selectionTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                headerStyle: const DateRangePickerHeaderStyle(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                maxDate: DateTime.now(),
                              ),
                            )),
                        Positioned(
                            top: 390,
                            left: 30,
                            child: TextWidget(
                              "Time",
                              25,
                              Colors.black,
                              FontWeight.bold,
                              letterSpace: 0,
                            )),
                        Positioned(
                            top: 440,
                            left: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    changer(0);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    color: time[0] ? Colors.blue : Colors.white,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 110,
                                          child: Center(
                                              child: TextWidget(
                                            "09:00 Am",
                                            17,
                                            Colors.black,
                                            FontWeight.bold,
                                                letterSpace: 1,
                                          ))),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    changer(1);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    color: time[1] ? Colors.blue : Colors.white,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 110,
                                          child: Center(
                                              child: TextWidget(
                                            "09:30 Am",
                                            17,
                                            Colors.black,
                                            FontWeight.bold,
                                                letterSpace: 1,
                                          ))),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    changer(2);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    color: time[2] ? Colors.blue : Colors.white,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 110,
                                          child: Center(
                                              child: TextWidget(
                                            "10:00 Am",
                                            17,
                                            Colors.black,
                                            FontWeight.bold,
                                                letterSpace: 1,
                                          ))),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Positioned(
                            top: 530,
                            left: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    changer(3);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    color: time[3] ? Colors.blue : Colors.white,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 110,
                                          child: Center(
                                              child: TextWidget(
                                            "10:30 Am",
                                            17,
                                            Colors.black,
                                            FontWeight.bold,
                                                letterSpace: 1,
                                          ))),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    changer(4);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    color: time[4] ? Colors.blue : Colors.white,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 110,
                                          child: Center(
                                              child: TextWidget(
                                            "11:00 Am",
                                            17,
                                            Colors.black,
                                            FontWeight.bold,
                                                letterSpace: 1,
                                          ))),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    changer(5);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    color: time[5] ? Colors.blue : Colors.white,
                                    child: Center(
                                      child: SizedBox(
                                          height: 60,
                                          width: 110,
                                          child: Center(
                                              child: TextWidget(
                                            "12:00 Pm",
                                            17,
                                            Colors.black,
                                            FontWeight.bold,
                                                letterSpace: 1,
                                          ))),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Positioned(
                          bottom: 10,
                          left: 30,
                          right: 30,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                barrierColor: Colors.black.withOpacity(.8),
                                backgroundColor: Colors.transparent,
                                isDismissible: true,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.7,
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.9,
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.white,
                                                        blurRadius: 40),
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.topRight,
                                                      colors: [
                                                        Colors.blue,
                                                        Colors.green,
                                                        Colors.red,
                                                        Colors.white,
                                                        Colors.yellow,
                                                        Colors.blue,
                                                        Colors.green,
                                                        Colors.red,
                                                        Colors.white,
                                                        Colors.yellow,
                                                        Colors.blue,
                                                        Colors.green,
                                                        Colors.red,
                                                        Colors.white,
                                                        Colors.yellow,
                                                        Colors.blue,
                                                        Colors.green,
                                                        Colors.red,
                                                        Colors.white,
                                                        Colors.yellow,
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                            40,
                                                          ),
                                                          topRight:
                                                              Radius.circular(
                                                                  40))),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 100,
                                                    left: 20,
                                                    right: 20),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.93,
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                              40,
                                                            ),
                                                            topRight:
                                                                Radius.circular(
                                                                    40))),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Colors
                                                            .black
                                                            .withOpacity(.1),
                                                        radius: 60,
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.check,
                                                            color:
                                                                Colors.orange,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      const Text(
                                                        "Successed",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          blurRadius: 10,
                                                          offset:
                                                              Offset(0, 10)),
                                                      BoxShadow(
                                                          color: Colors
                                                              .transparent,
                                                          offset:
                                                              Offset(10, 0)),
                                                      BoxShadow(
                                                          color: Colors
                                                              .transparent,
                                                          offset:
                                                              Offset(-10, 0))
                                                    ],
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: images[widget.index])),
                                              )),
                                        ],
                                      ));
                                },
                              );
                            },
                            child: Container(
                              height: 65,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue.shade900,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    "Book an appointment",
                                    18,
                                    Colors.white,
                                    FontWeight.w500,
                                    letterSpace: 1,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white.withOpacity(.5),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white.withOpacity(.2),
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void changer(int ind) {
    for (int i = 0; i < 6; i++) {
      if (i == ind) {
        time[i] = true;
      } else {
        time[i] = false;
      }
    }
    setState(() {});
  }
}
