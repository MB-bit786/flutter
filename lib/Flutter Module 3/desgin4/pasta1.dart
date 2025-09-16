import 'package:flutter/material.dart';

class Pasta1 extends StatefulWidget {
  const Pasta1({super.key});

  @override
  State<Pasta1> createState() => _Pasta1State();
}

class _Pasta1State extends State<Pasta1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.search, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //   color: Colors.blueGrey,
            //   border: BorderDirectional(
            //       bottom: BorderSide(
            //           color: const Color.fromARGB(155, 158, 158, 158),
            //           width: 1)),
            // ),
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 30,
                  child: Container(
                    height: 50,
                    width: 150,
                    // color: Colors.yellow,
                    child: Text(
                      "Restaurant",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 30,
                  child: Container(
                    height: 50,
                    width: 250,
                    // color: Colors.orange,
                    child: Text(
                      " 20-30 min  2.4 km Restaurant ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 350,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.restaurant,
                      color: Colors.black,
                    )),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 30,
                  child: Text(" Orange sandwich is delicious ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
                Positioned(
                    top: 120,
                    left: 360,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        ),
                        Text(
                          "4.7",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
                Positioned(
                  top: 180,
                  left: 30,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.black,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade600,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  " Recommanded ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  " Popular ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  " Noodles ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/Screenshot_2025-08-13_at_12.06.35-removebg-preview.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Soba Soup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Text(
                            "No1. in sales",
                            style: TextStyle(color: const Color.fromARGB(255, 255, 181, 7)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, right: 30),
                          child: Text(
                            "\$12",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        )
                      ],
                    )
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:70,left:100),
                    child: Container(
                      height: 50,
                      width:50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.arrow_forward_ios),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                      )
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/images/sei_ua-removebg-preview.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              "Sei ua Samun Phari",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Container(
                              child: Text(
                                "No1. in sales",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, right: 140),
                            child: Text(
                              "\$12",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          )
                        ],
                      )
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:70),
                      child: Container(
                        height: 50,
                        width:50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.arrow_forward_ios),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                        )
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/images/pasta-removebg-preview.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              "Ratatoullie Pasta",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Container(
                              child: Text(
                                "No1. in sales",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, right: 140),
                            child: Text(
                              "\$12",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          )
                        ],
                      )
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:70),
                      child: Container(
                        height: 50,
                        width:50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.arrow_forward_ios),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                        )
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            width:MediaQuery.of(context).size.width / 1.1,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:100,
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border:Border.all(color: Colors.yellow)
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )
                  ],
                  ),
                ),
                   Padding(
                     padding: const EdgeInsets.only(top:10),
                     child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color:Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:Icon(Icons.shopping_bag_outlined)
                      ),
                   )
              ],
            ),
          )
        ],
      ),
    );
  }
}
