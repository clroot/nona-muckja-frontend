import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartySigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '파티 생성',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 15),
                child: Text("완료",
                  style: TextStyle(
                    color: Color.fromARGB(255, 127, 91, 255),
                    fontSize: 21,
                  ),
                ),
              ),
            )
          ],
        ),
        body: BuildPartySigninPage());
  }
}



class BuildPartySigninPage extends StatefulWidget {

  @override
  State<BuildPartySigninPage> createState() => _BuildPartySigninPageState();
}

class _BuildPartySigninPageState extends State<BuildPartySigninPage> {
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 12);

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            Container(
                //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),

                width: MediaQuery.of(context).size.width * 0.95,
                child: Form(

                    child: TextField(
                      style: TextStyle(height: 2.5),
                      decoration: InputDecoration(

                        labelText : '매장 링크',
                      ),


                    )
                ),
            ),
            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Form(
                  child: TextField(
                    style: TextStyle(height: 2.5),
                    decoration: InputDecoration(

                      labelText : '파티 제목',
                    ),


                  )
              ),
            ),

            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Form(
                  child: TextField(
                    style: TextStyle(height: 2.5),
                    decoration: InputDecoration(
                      labelText : '모임 위치',
                    ),


                  )
              ),
            ),
            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Form(
                  child: TextField(
                    style: TextStyle(height: 2.5),
                    decoration: InputDecoration(

                      labelText : '파티 인원 수',
                    ),


                  )
              ),
            ),
            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),

              child: Form(
                child: ListTile(
                  title: const Text('카테고리 설정'),
                  trailing: Icon(Icons.arrow_forward_ios),

                ),
              ),
            ),

            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),

              child: Form(
                child: ListTile(
                  //richtext
                  title: Text('모임 시간 : '+'${time!.hour.toString()}:${time!.minute.toString()}',
                              style: TextStyle(color:Color.fromARGB(255, 127, 91, 255), ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(context: context, initialTime: time!);
                    if(newTime != null) {
                      setState(() {
                        time = newTime;
                      }
                      );



                    }
                  },

                ),
              ),
            ),

          ],
        );
  }
}
