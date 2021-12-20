import 'package:flutter/material.dart';
import "package:ffood_test/DetailsPage.dart";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Food Order'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background
      backgroundColor: Color(0xFF21BFBD),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
              //=====back arrow start====================
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.amber,
                    onPressed: () {},
                  ),
              //=======back arrow finish==================
                  Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    //---filter list start-------
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.redAccent,
                          onPressed: () {},
                        ),
                    //--filter list finish----menu start------------
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  ],
              ),
            ),
                //---menu finish---------------
 ///*           //===========================================================
                        SizedBox(height: 25.0,),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Row(
                            children: <Widget>[
                          //------start   Restaurant----------
                              Text('Restaurant',
                                style: TextStyle(
                                    fontFamily: 'Playball',
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0
                                ),
                              ),
                          //----finish Restaurant word--start  Food word--------
                              SizedBox(width: 10.0,),
                              Text('Food',
                                style: TextStyle(
                                    fontFamily: 'Courgette',
                                    color: Colors.orange,
                                    fontSize: 25.0
                                ),
                              ),
                          //------finish   Food----------------
                            ],
                          ),
                        ),
 //*/             //=================================================
            SizedBox(height: 40.0,),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)
                  )
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300,
                      child: ListView(
                        children: <Widget>[

                           _buildFoodItem('assets/plate1.png', "Dish 1", "\$ 50.00"),
                           _buildFoodItem('assets/plate2.png', "Dish 2", "\$ 24.00"),
                           _buildFoodItem('assets/plate3.png', "Dish 3", "\$ 10.00"),
                           _buildFoodItem('assets/plate4.png', "Dish 4", "\$ 100.00"),
                           _buildFoodItem('assets/plate5.png', "Dish 5", "\$ 60.00"),
                           _buildFoodItem('assets/plate6.png', "Dish 6", "\$ 77.00"),


                        ],
              ),
            ),
        //==============================
        ),
    ],
    ),

      ),

      ],
     ),
    );
  }
//}

Widget _buildFoodItem(String imgPath, String foodName, String price){
  return Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: InkWell(

      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(imgPath, foodName, price)
        ));
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0
                  ),
                ),
                SizedBox(width: 10.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                          fontFamily: 'Playball',
                          fontSize: 20.0,
                          color: Colors.blue
                         // fontWeight: FontWeight.bold

                      ),
                    ),
                 SizedBox(width: 20.0,),
                    Text(
                      price,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.pinkAccent
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}
}
