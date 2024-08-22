import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/AudiencePoll.dart';
import 'package:quiz_app/services/localdb.dart';


class Lifeline_Drawer extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  Lifeline_Drawer({required this.question, required this.opt1, required this.opt2, required this.opt3, required this.opt4, required this.correctAns});


  @override
  State<Lifeline_Drawer> createState() => _Lifeline_DrawerState();
}

class _Lifeline_DrawerState extends State<Lifeline_Drawer> {

  Future<bool> checkAudPollDet() async{
    bool AudPoll = true;
    await LocalDB.getAudPoll().then((value){
      AudPoll = value!;

    });
    return AudPoll;
  }


  Future<bool> checkJokerDet() async{
    bool Joker = true;
    await LocalDB.getJoker().then((value){
      Joker = value!;

    });
    return Joker;
  }


  Future<bool> checkf50Det() async{
    bool f50 = true;
    await LocalDB.get50Data().then((value){
      f50 = value!;

    });
    return f50;
  }


  Future<bool> checkExpDet() async{
    bool Exp = true;
    await LocalDB.getExpData().then((value){
      Exp = value!;

    });
    return Exp;
  }








  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("LifeLines",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
              ),
            ),


            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceAround,

              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () async{
                        if(await checkAudPollDet()){
                          await LocalDB.saveAudPoll(false);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AudiencePoll(question: widget.question, opt1: widget.opt1, opt2: widget.opt2, opt3: widget.opt3, opt4: widget.opt4, correctAns: widget.correctAns)));
                        }else{
                          print("AudiencePoll is already used  ------------------------------------- ");
                        }

                     },

                      child: Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),


                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Icon(Icons.people,
                            size: 41,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    //SizedBox(height: 5,),

                    Text("Audience\nPoll",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                        fontSize: 13
                    ),
                    textAlign: TextAlign.center,
                    )

                  ],
                ),



                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),


                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Icon(Icons.monetization_on_outlined,
                          size: 41,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //SizedBox(height: 5,),

                    Text("Money\n ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13
                      ),
                      textAlign: TextAlign.center,
                    )

                  ],
                ),




                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),


                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Icon(Icons.account_balance_wallet,
                          size: 41,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //SizedBox(height: 5,),

                    Text("Wallet\n ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                        fontSize: 13
                      ),
                      textAlign: TextAlign.center,
                    )

                  ],
                ),




                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),


                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Icon(Icons.add_card,
                          size: 41,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //SizedBox(height: 5,),

                    Text("Add Money\n ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13
                      ),
                      textAlign: TextAlign.center,
                    )

                  ],
                ),




        
        
              ],
            ),

            const SizedBox(height: 5,),

            const Divider(
              color: Colors.black12,
              thickness: 1.6,
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
              child: Text("LifeLines",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),


            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.sizeOf(context).height - 270,
                child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 15,

                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Text("$index",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                        ),

                        title: Text("Rs.${(5000)*(index)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                        ),

                        trailing: Icon(Icons.add_alert_rounded),
                      );
                }),
              ),
            )






          ],
        ),
      ),

    );
  }
}




