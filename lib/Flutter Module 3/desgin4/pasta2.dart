import 'package:flutter/material.dart';

class Pasta2 extends StatefulWidget {
  const Pasta2({super.key});

  @override
  State<Pasta2> createState() => _Pasta2State();
}

class _Pasta2State extends State<Pasta2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 181, 7, 1),
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
                  child:
                      Icon(Icons.favorite_border_outlined, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 873,
              child: Stack(
                children: [
                  Positioned(
                    top: 120,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 170, left: 60),
                          child: Container(
                            width: 300,
                            height: 50,
                            child: Text(
                              "Sei Ua Samun Phrai",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 300,
                            // height:50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("🕔 50 min",
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                Text("⭐️ 4.8",
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                Text("🔥 325 Kcal",
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 100),
                          child: Container(
                            width: 300,
                            height: 50,
                            // color: Colors.grey, // Background for reference
                            child: Stack(
                              clipBehavior: Clip.none, // Allow overlap outside
                              children: [
                                // Price box
                                Container(
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "\$12",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                // Quantity box overlapping
                                Positioned(
                                  left: 60, // Overlaps with the price box
                                  child: Container(
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(255, 181, 7, 1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "-",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "1",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 300),
                          child: Container(
                            child: Text("Ingredient",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          child: Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                Container(
                                  height: 120,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("🍜",
                                          style: TextStyle(fontSize: 30)),
                                      Text("Noodle",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("🍤",
                                          style: TextStyle(fontSize: 30)),
                                      Text("Shrimp",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("🥚",
                                          style: TextStyle(fontSize: 30)),
                                      Text("Egg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("🥗",
                                          style: TextStyle(fontSize: 30)),
                                      Text("Scallion",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 330),
                          child: Container(
                            child: Text("About",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          child: Container(
                            width: 400,
                            child: Text(
                                "A vibrant thai sausage made with ground chicken plus its is spicy chile dip fom chef parnass savang of atlanta's talat market",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start),
                          ),
                        ),

                         Padding(
                          padding: const EdgeInsets.only(left:300,),
                       child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 181, 7, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.shopping_bag_outlined,
                                  color: Colors.black, size: 30),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                         )
                      ]),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: 40,
                    child: Container(
                      width: 380,
                      height: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/sei_ua-removebg-preview.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
