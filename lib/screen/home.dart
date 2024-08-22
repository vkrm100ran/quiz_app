import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:quiz_app/screen/quiz_intro.dart';
import 'package:quiz_app/services/constant.dart';
import 'package:quiz_app/services/home_fire.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/widgets/sideNavBar.dart';
import 'package:quiz_app/services/home_fire.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   // GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  //--------------------------------------------------------------prince saroha


  ////////////////// ------------------------------- -  this is vkrm100ran -----

  //------------------------------------------post testing

  String name = "ssfasd";
  String rank = "dasfas";
  String money = "-sf";
  String proUrl = "sdfs";
  String level = "scsdsc";


  late List quizzes = [];


  getUserDet() async{
    await LocalDB.getName().then((value){
      setState(() {
        name = value.toString();
      });
    });

    await LocalDB.getMoney().then((value){
      setState(() {
        money = value.toString();
      });
      print("this is money that is saved in local database -------");
      print(money);
    });

    await LocalDB.getRank().then((value){
      setState(() {
        rank = value.toString();
      });
    });

    await LocalDB.getImg().then((value){
      setState(() {
        proUrl = value.toString();
      });
    });

    await LocalDB.getLevel().then((value){
      setState(() {
        level = value.toString();
      });
    });

  }



  getQuiz() async{
    await HomeFire.getQuizzes().then((returned_quizzes){
      setState(() {
        quizzes = returned_quizzes ?? [];
        // print(quizzes);
      });
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDet();
    getQuiz();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text("Vkrm-KBC Quiz App",
        style: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.bold
        ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF37205B),
            Color(0xFFF9F5FC),
          ]
      ),
        elevation: 10,
      ),
      endDrawerEnableOpenDragGesture: true,
      drawer: SideNav(name, money, rank, proUrl, level),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 7),
          child: Column(
            children: [
        
              /// ---------  coursel slider start  -----------  ////
              CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    )
                  ],
                  options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(
                      milliseconds: 2000
                    ),
                    viewportFraction: 0.8
                  )
              ),
              /// ---------  coursel slider end  -----------  ////
        
        
              SizedBox(height: 15,),




              // //// ------  four circles below curselSlider start  -- ------- ////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CircleAvatar(backgroundColor: Colors.grey, radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),

                ],
              ),
              // //// ------  four circles below curselSlider start  -- ------- ////





              SizedBox(height: 15,),


        
              ///  ----------   boxes below coursel slider start ----- ////
              Container(
                padding: const EdgeInsets.all(5),
                child:
                Row(
                  children: [
        
                    Flexible(
                      flex: 1,
                        fit: FlexFit.tight,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                height: 170,
                                child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                              ),
                            ),

                          ],
                        )
                    ),
        
                    SizedBox(width: 10,),
        
        
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 8,

                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                height: 170,
                                child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                              ),
                            ),



                          ],
                        )
                    )
        
        
        
        
                    
                  ],
                ),
              ),

              SizedBox(height: 10,),
        
        
        
              Container(
                padding: const EdgeInsets.all(5),
                child:
                Row(
                  children: [
        
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 8,

                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                height: 170,
                                child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                              ),
                            ),


                          ],
                        )
                    ),
        
                    SizedBox(width: 10,),
        
        
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 8,

                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                height: 170,
                                child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                              ),
                            ),


                          ],
                        )
                    )
        
        
                  ],
                ),
              ),
        
              ///  ----------   boxes below coursel slider end ----- ////
        

              SizedBox(height: 10,),
        
        
              ///  ----------   large box below small boxes start ----- ////
              Container(
                padding: const EdgeInsets.all(5),
                child:
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,

                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ///  ----------   large box below small boxes end ----- ////
              
              
              
              
              
              ////  -------  user data below large box start --------  /////
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Top Player in this week -",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("Last updated 5 days ago -",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                        ),

                        const SizedBox(width: 20,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("vkrm-100ran",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                            Text("Player-ID - ABD-55-3",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            ),

                            Text("RS. - 55 Lakh",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )


                      ],

                    )

                  ],

                ),
              ),

              ////  -------  user data below large box end --------  /////



              const SizedBox(height: 10,),


              ///  ----------   boxes below user data start ----- ////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Unlock new quizs-",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.all(5),
                    child:
                    Row(
                      children: [

                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizIntro(QuizName: (quizzes[1])["quiz_name"], QuizImgUrl: (quizzes[1])["quiz_thumbnail"], QuizTopics: (quizzes[1])["topics"], QuizDuration: (quizzes[1])["duration"], QuizAbout: (quizzes[1])["about_quiz"], QuizId: (quizzes[1])["QuizId"], QuizPrice: (quizzes[1])["quiz_price"] )));

                              },



                              child: Stack(
                                children: [
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      height: 170,
                                      child: Image.network((quizzes[1])["quiz_thumbnail"] ?? "https://static.vecteezy.com/system/resources/previews/001/826/248/original/progress-loading-bar-buffering-download-upload-and-loading-icon-vector.jpg", fit: BoxFit.cover, width: double.infinity,),
                                    ),
                                  ),

                                ],
                              ),
                            )
                        ),

                        const SizedBox(width: 10,),


                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    height: 170,
                                    child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                                  ),
                                ),



                              ],
                            )
                        )





                      ],
                    ),
                  ),

                 const SizedBox(height: 10,),



                  Container(
                    padding: const EdgeInsets.all(5),
                    child:
                    Row(
                      children: [

                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    height: 170,
                                    child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                                  ),
                                ),


                              ],
                            )
                        ),

                       const SizedBox(width: 10,),


                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    height: 170,
                                    child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                                  ),
                                ),


                              ],
                            )
                        )


                      ],
                    ),
                  ),
                ],
              ),

              ///  ----------   boxes below user data end ----- ////


              const SizedBox(height: 10,),



              ///  ----------   large box below small boxes start ----- ////
              Container(
                padding: const EdgeInsets.all(5),
                child:
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,

                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Image.network("https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover,),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ///  ----------   large box below small boxes end ----- ////



              const SizedBox(height: 15,),



              /// ---------  coursel slider start  -----------  ////
              CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1715276611505-fbea90d3e9e3?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            ),
                            fit: BoxFit.cover,
                          )
                      ),
                    )
                  ],
                  options: CarouselOptions(
                      height: 180,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16/9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(
                          milliseconds: 2000
                      ),
                      viewportFraction: 0.8
                  )
              ),
              /// ---------  coursel slider end  -----------  ////



              const SizedBox(height: 15,),




              // //// ------   circles below curselSlider start  -- ------- ////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CircleAvatar(backgroundColor: Colors.grey, radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),

                ],
              ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CircleAvatar(backgroundColor: Colors.grey, radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),

                ],
              ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CircleAvatar(backgroundColor: Colors.grey, radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),

                ],
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CircleAvatar(backgroundColor: Colors.grey, radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),
                  CircleAvatar(backgroundColor: Colors.grey,radius: 40,),

                ],
              ),



              // //// ------   circles below curselSlider start  -- ------- ////





              const SizedBox(height: 15,),


              
              
        
            ],
          ),
        ),

      ),


    );
  }
}



