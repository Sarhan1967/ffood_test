import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final heroTag;
  final foodName;
  final foodPrice;
//--DetailsPage constructor-----------
  DetailsPage(this.heroTag, this.foodName, this.foodPrice);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{

  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//--backgroundColor--------------
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        //====App Bar=========
        //---back arrow icon---------
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.yellow,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Details',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              color: Colors.greenAccent
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            //--more_horiz-----
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow,
                ),
                Positioned (
            //green Box-------
                    top: 75.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0)
                        ),
                        color: Colors.greenAccent,
                      ),
                      height: MediaQuery.of(context).size.height - 220,
                      width: MediaQuery.of(context).size.width,
                    )
                ),
                Positioned(
            //--Herotage(dish)----
                  top: 30,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.heroTag),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                  height: 200,
                  width: 200,
                ),
                Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.foodName,
                        style: TextStyle(
                            fontFamily: 'Playball',
                            fontSize: 22,
                            color: Colors.purple
                            //fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.foodPrice,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.amber
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 1.0,
                            color: Colors.amber,
                          ),
                          Container(
                                        //  -1+  Button-------
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.amber,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  //---  (-  sign)  ------------------
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color(0xFF7A9BEE)
                                      ),
                                      child: Center(
                                        child: Icon(

                                          Icons.remove,
                                          color: Colors.yellowAccent,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                ),
                             //-- (1)--------------------------
                                Text( '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15
                                  ),
                                ),
                                InkWell(
                                  //---  (+  sign)  ------------------
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color(0xFF7A9BEE)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildIfoCard('hignt', '300c', 'G'),
                            SizedBox(width: 10,),
                            _buildIfoCard('low', '400c', 'G'),
                            SizedBox(width: 10,),
                            _buildIfoCard('asdasd', '300c', 'G'),
                            SizedBox(width: 10,),
                            _buildIfoCard('ada', '300c', 'G'),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]
      ),
    );
  }

  Widget _buildIfoCard(String cardTitle,String info, String unit){

    return InkWell(
      onTap: (){
        SelectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
              color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75
          ),
        ),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cardTitle,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: cardTitle == selectedCard ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black,
                    ),
                  )


                ],
              ),


            ),

          ],
        ),
      ),
    );
  }

  SelectCard(cardTitle){
    setState(() {
      selectedCard = cardTitle;
    });
  }
}

