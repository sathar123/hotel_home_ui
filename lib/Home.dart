import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_home_ui/dummy_data.dart';
import 'package:sizer/sizer.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {







    Future<bool> showPop() async {
      return await showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: Text('Alert Box'),
          content: Text('Do you want exit app'),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.pop(ctx);
            }, child: Text('No')),
            ElevatedButton(onPressed: () {
              SystemNavigator.pop();
            }, child: Text('Yes')),

          ],
        );
      }) ?? false;
    }
    return WillPopScope(

      onWillPop: showPop,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.cyan,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon((Icons.favorite_border_rounded)),

            )

          ],
          bottom: PreferredSize(

              preferredSize: Size(100.w, 15.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Text('Type your Location',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp,),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Kochi, Kerala',
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  )
                ],
              )

          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Categery(iconData: Icons.hotel,
                      catname: 'Hotel',
                      bgcolor: Colors.pink,),
                    Categery(iconData: Icons.restaurant,
                      catname: 'Restaurant',
                      bgcolor: Colors.blueAccent,),
                    Categery(iconData: Icons.local_cafe,
                      catname: 'Cafe',
                      bgcolor: Colors.orange,),


                  ],
                ),
              ),
              SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.h),
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: RoomData.length,
                      itemBuilder: (context, int index){
                    return ListRoom(id: index,);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListRoom extends StatelessWidget {
   final  id;

  const ListRoom({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var data = RoomData[id];
    return GestureDetector(
      onTap: (){
       Navigator.pushNamed(context, '/Deatils',arguments: id);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Card(
          child: Container(

            height: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Stack(
                  children: [
                    Hero(

                      tag: data['id'],
                      child: Container(
                        height: 25.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                   data['image']))
                        ),
                      ),
                    ),
                    Positioned(
                        right: 4,
                        top: 4,
                        child: Icon(Icons.star_border,color: Colors.white,)),
                    Positioned(
                        right: 1.h,
                        bottom: 3.h,
                        child: Container(
                          color: Colors.white70,
                          height: 4.h,
                          width: 4.h,
                          child: Center(child: Text('\$${data['price'].toString()}')),
                        )
                    )


                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(left: 2.h, top: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      Text(data['title'], style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(data['location'], style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Text('  (${data['review'].toString()} reviews)',
                            style: TextStyle(color: Colors.grey),)
                        ],
                      ),


                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Categery extends StatelessWidget {
  final Color bgcolor;
  final String catname;
  final IconData iconData;

  Categery(
      {required this.iconData, required this.catname, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 12.h,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.white,),
            Text(catname, style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
