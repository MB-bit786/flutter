import 'package:flutter/material.dart';
class task1 extends StatelessWidget {
  const task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/0/0d/Oeschinen_Lake%2C_Kandersteg%2C_Switzerland_%28Unsplash%29.jpg",fit: BoxFit.cover,),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Oeschinen Lake Campground",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Text("Kandersteg, Switzerland",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Icon(Icons.star,color: Colors.red,),
                    Text("41"),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.call,color: Colors.blue,size: 30,),
                      Text("Call",style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                    Column(
                    children: [
                      Icon(Icons.directions,color: Colors.blue,size: 30,),
                      Text("Route",style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                   Column(
                    children: [
                      Icon(Icons.share,color: Colors.blue,size: 30,),
                      Text("Share",style: TextStyle(color: Colors.blue),),
                    ],
                  ),
            
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child:Text("Oeschinensee is accessible by foot from Kandersteg within 1.5 hours. The cable car operates in summer and winter season daily from mornings till evenings - non stop. In summer enjoy swimming in the lake, boat rides on the blue and clear water or just have fun with the toboggan run at the top station of the cable car. Several hotels around the lake offer rooms in summer. Restaurants are open in winter and summer. The region belongs to the Unesco heritage Jungfrau-Aletsch.",style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,) ,
            ),
          )
        ],
      ),
    );
  }
}