import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nonamukja/blocs/user_location_bloc.dart';
import 'package:nonamukja/model/user/user_location_model.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/category_select.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/party_coordinate_select.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:nonamukja/resources/repositories/location/user_location_repository.dart';
import 'package:nonamukja/resources/service/category_maping.dart';

Map<String, dynamic> selectedLocation = {};
List<int> _selectint = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
String category = '치킨';
int _selectedint = 0;
String partyDate = '';
TimeOfDay? time = TimeOfDay.now();
UserLocationModel _userLocationModel = UserLocationModel();
final TextEditingController _partyTitle = TextEditingController();
final TextEditingController _partyLocation = TextEditingController();
final TextEditingController _shopLink = TextEditingController();

class PartySigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _partyInfo = Map<String, dynamic>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '파티 생성',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Center(
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "완료",
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 91, 255),
                      fontSize: 21,
                    ),
                  ),
                ),
                onTap: () {
                  _partyInfo['title'] = _partyTitle.text;
                  _partyInfo['address'] = _userLocationModel
                      .documents!.first.address!.addressName
                      .toString();
                  _partyInfo['roadAddress'] = _userLocationModel
                      .documents!.first.roadAddress!.addressName
                      .toString();
                  _partyInfo['zipCode'] = _userLocationModel
                      .documents!.first.roadAddress!.zoneNo
                      .toString();
                  _partyInfo['x'] = selectedLocation['lat'];
                  _partyInfo['y'] = selectedLocation['lng'];
                  _partyInfo['partyTime'] = partyDate;
                  _partyInfo['foodCategory'] = MappingKorean[category];
                  _partyInfo['limitMemberCount'] = _selectedint + 1;
                  Navigator.pop(context, _partyInfo);
                },
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SelectedLocationBloC _selectedLocationBloC = SelectedLocationBloC();
    UserLocationRepository _userLocationRepository = UserLocationRepository();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          //padding: const EdgeInsets.only(top: 10,right: 5,left: 5,),
          width: MediaQuery.of(context).size.width * 0.95,
          child: Form(
            child: TextField(
              controller: _partyTitle,
              style: TextStyle(height: 2.5),
              decoration: InputDecoration(
                labelText: '파티 제목',
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 10,
            right: 5,
            left: 5,
          ),
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            child: ListTile(
              leading: Icon(Icons.location_on),
              iconColor: Color.fromARGB(255, 127, 91, 255),
              title: Text('위치 설정',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'MinSans-Medium')),
              onTap: () async {
                Position location =
                    await _userLocationRepository.currentUserLocation();
                selectedLocation = await pushNewScreen(context,
                    screen: PartyCoordinateSelect(
                      location: location,
                    ));
                _userLocationModel =
                    await _selectedLocationBloC.fetchSelectedLocation(
                        selectedLocation['lng'].toString(),
                        selectedLocation['lat'].toString());
              },
            ),
          ),
        ),
        StreamBuilder(
          builder: ((context, AsyncSnapshot<UserLocationModel> snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  snapshot.data!.documents!.first.address!.addressName
                      .toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 91, 255),
                      fontSize: 14,
                      fontFamily: 'MinSans-Medium'),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Text('');
            }
          }),
          stream: _selectedLocationBloC.selectedLocation,
        ),
        Container(
          child: Form(
            child: ListTile(
              title: RichText(
                text: TextSpan(
                    text: '인원 수 : ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: _selectint[_selectedint].toString(),
                        style: TextStyle(
                          color: Color.fromARGB(255, 127, 91, 255),
                        ),
                      )
                    ]),
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
                  children:
                      List<Widget>.generate(_selectint.length, (int index) {
                    return Center(
                      child: Text(
                        _selectint[index].toString(),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Form(
            child: ListTile(
              title: RichText(
                text: TextSpan(
                    text: '카테고리 : ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: category,
                          style: TextStyle(
                            color: Color.fromARGB(255, 127, 91, 255),
                          ))
                    ]),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _navigateAndDisplaySelection(context);
              },
            ),
          ),
        ),
        Container(
          child: Form(
            child: ListTile(
              title: RichText(
                text: TextSpan(
                    text: '모임 시간 : ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '${time!.hour.toString()}:${time!.minute.toString()}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 127, 91, 255),
                        ),
                      )
                    ]),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                TimeOfDay? setTime =
                    await showTimePicker(context: context, initialTime: time!);
                setState(() {
                  time = setTime;
                });

                final now = DateTime.now();
                partyDate = DateTime(
                        now.year, now.month, now.day, time!.hour, time!.minute)
                    .toIso8601String();
              },
            ),
          ),
        ),
      ],
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategorySelectPage()),
    );

    setState(() {
      category = result;
    });
  }
}
