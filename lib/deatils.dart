

import 'package:flutter/material.dart';

import 'dummy_data.dart';

class Deatils extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hight = size.height;
    var width = size.width;
    var roomid = ModalRoute.of(context)?.settings.arguments;
    var data = RoomData.firstWhere((element) => element['id'] == roomid );
    var rating =  data['rating'] ~/1;
    List<Widget> ratingList = List.generate(rating, (index){
      return Icon(Icons.star,color: Colors.purple,);
    });
    while(ratingList.length != 5){
      ratingList.add(Icon(Icons.star_border_outlined,color: Colors.purple,));
    }
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: data['id'],
            child: Container(
              height: 400,
              child: Image.network(data['image'],fit: BoxFit.cover,),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("DETAIL",style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal
              ),),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20,right: 20,top: 285),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              SizedBox(height: 5,),
              Wrap(
                spacing: width*0.55,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${data['rating']}/${data['review']} reviews',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ratingList,),
                        Row(
                          children: [

                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            Text(
                              '8 km to LuluMall',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '\$ ${data['price']}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '/per night',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(20, 50),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'DESCRIPTION',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${RoomDis.description}',
                  softWrap: true,style: TextStyle(wordSpacing: 3,letterSpacing: 0.3),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),

    );
  }
}
