import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class Profile extends StatefulWidget {
  String name = "";
  String money = "";
  String rank = "";
  String proUrl = "";
  String level = "";

  Profile(@required this.name, @required this.money, @required this.rank, @required this.proUrl, @required this.level, );

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: GradientAppBar(

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share), color: Colors.black.withOpacity(0.7),),
          
          IconButton(onPressed: (){}, icon: Icon(Icons.person_add),color: Colors.black.withOpacity(0.7),),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF37205B),
            //Color(0xFF563F75),
            Color(0xFFF9F5FC),
          ]
        ),
        title: Text("Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.4)
          ),
        ),

        centerTitle: true,

      ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(3),
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF37205B),
                  Color(0xFFF9F5FC),
                ]
              ),
              borderRadius: BorderRadius.circular(15)

            ),

            child: Column(
              children: [
                SizedBox(height: 8,),
                Stack(
                  children:[
                    CircleAvatar(
                    backgroundImage: NetworkImage(widget.proUrl),
                    radius: 50,
                  ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.3)
                        ),
                        child: Icon(Icons.edit,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    )
                  ]
                ),

                SizedBox(height: 10,),

                Text(widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),

                Divider(thickness: 1,indent: 20, endIndent: 20,),

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(widget.level,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: Colors.black.withOpacity(0.7)
                          ),
                        ),

                        Text("Level",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7)
                          ),
                        ),
                      ],
                    ),



                    Column(
                      children: [
                        Text(widget.rank,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                              color: Colors.black.withOpacity(0.7)
                          ),
                        ),

                        Text("Rank",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7)
                          ),
                        )
                      ],
                    ),

                  ],

                )
              ],


            ),
          ),
          
          Text("LeaderBoard",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          
          Container(
            margin: EdgeInsets.all(5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height-427,
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                          ),
                          SizedBox(width: 5,),
                          Text("vkrm 100ran",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5)
                            ),
                          ),
                        ],
                      ),
                      
                      leading: Text("#${index+1}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      trailing: Text("Rs.${(200000/(index+1)).toString().substring(0,5)}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(thickness: 1,color: Color(0xFF37205B), indent: 20, endIndent: 20,),
                  itemCount: 20),
            ),
          )
          
          
          
        ],
      ),




    );
  }
}







