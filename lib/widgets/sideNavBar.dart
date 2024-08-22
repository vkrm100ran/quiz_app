import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:marquee/marquee.dart';
import 'package:quiz_app/screen/login.dart';
import 'package:quiz_app/screen/profile.dart';
import 'package:quiz_app/services/FireDB.dart';

import '../services/auth.dart';

class SideNav extends StatefulWidget {
  final String name;
  final String money;
  final String rank;
  final String proUrl;
  final String level;

  SideNav(@required this.name, @required this.money, @required this.rank, @required this.proUrl, @required this.level);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {




  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(15),
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(widget.name, widget.money, widget.rank, widget.proUrl, widget.level)));
              },

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(widget.proUrl),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,  // Adjust height as needed
                                child: Marquee(
                                  text: widget.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  scrollAxis: Axis.horizontal,
                                  blankSpace: 20.0,
                                  velocity: 50.0,
                                  startPadding: 10.0,
                                  accelerationDuration: Duration(seconds: 1),
                                  accelerationCurve: Curves.linear,
                                  decelerationDuration: Duration(seconds: 1),
                                  decelerationCurve: Curves.easeOut,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Rs. ${widget.money}",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

              Container(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "LeaderBoard - ${widget.rank} th Rank",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

                ],
              ),
            ),

            Divider(thickness: 1, indent: 10, endIndent: 10, color: Colors.white,),

            SizedBox(height: 48),


            listItem(
              label: "Daily Quizes",
              icon: Icons.quiz,
              context: context,
              path: MaterialPageRoute(builder: (context) => Home()),
            ),
            listItem(
              label: "LeaderBoard",
              icon: Icons.leaderboard,
              context: context,
              path: MaterialPageRoute(builder: (context) => Home()),
            ),
            listItem(
              label: "How to Use",
              icon: Icons.question_answer,
              context: context,
              path: MaterialPageRoute(builder: (context) => Home()),
            ),
            listItem(
              label: "About Us",
              icon: Icons.face,
              context: context,
              path: MaterialPageRoute(builder: (context) => Home()),
            ),
            listItem(
              label: "Log-out",
              icon: Icons.logout,
              context: context,
              path: MaterialPageRoute(builder: (context) => Login()),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem({
    required String label,
    required IconData icon,
    required BuildContext context,
    required MaterialPageRoute path,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      hoverColor: hoverColor,
      title: Text(
        label,
        style: TextStyle(color: color),
      ),
      onTap: () async {
        await signOut();
        Navigator.pushReplacement(context, path);
      },
    );
  }
}
