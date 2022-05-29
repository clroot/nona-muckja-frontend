import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/category_select.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

const List<int> _selectint = <int>[
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11
];

String category = '전체';

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
  int _selectedint= 0;
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));

  }
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
              child: Form(
                  child: ListTile(
                    title: RichText(
                        text: TextSpan(
                          text: '인원 수 : ',
                         style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                          TextSpan(text : _selectint[_selectedint].toString(),
                          style: TextStyle(color:Color.fromARGB(255, 127, 91, 255), ),
                             )
                            ]
                          ),
                    ),


                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => _showDialog(
                      CupertinoPicker(
                        itemExtent: 25,
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            _selectedint = selectedItem;
                          });
                        },
                        children: List<Widget>.generate(_selectint.length, (int index) {
                          return Center(
                            child: Text(
                              _selectint[index].toString(),
                            ),
                          );
                        }),



                      ),

                    )
                  ),
              ),
            ),


            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),

              child: Form(
                child: ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: '카테고리 : ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: category,
                          style: TextStyle(color:Color.fromARGB(255, 127, 91, 255),
                          )
                        )
                      ]
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _navigateAndDisplaySelection(context);
                  },

                ),
              ),
            ),
            Container(
              //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),
              child: Form(
                child: ListTile(

                  title: RichText(
                    text: TextSpan(
                      text: '모임 시간 : ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text : '${time!.hour.toString()}:${time!.minute.toString()}',
                          style: TextStyle(color:Color.fromARGB(255, 127, 91, 255), ),
                        )
                      ]
                    ),
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
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push는 Future를 반환합니다. Future는 선택 창에서
    // Navigator.pop이 호출된 이후 완료될 것입니다.
    final result = await Navigator.push(
      context,
      // 다음 단계에서 SelectionScreen를 만들 것입니다.
      MaterialPageRoute(builder: (context) => CategorySelectPage()),
    );

    setState(() {
      category = result;
    });

  }
}
