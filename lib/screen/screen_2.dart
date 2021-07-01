import 'package:bank_jago/animation/EnterExitRoute.dart';
import 'package:bank_jago/screen/screen_1.dart';
import 'package:bank_jago/screen/screen_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget{

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen2>{

  //
  String _chosenValue1;
  String _chosenValue2;
  String _chosenValue3;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blueAccent,
      //AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(context,
                EnterExitRoute(exitPage:Screen2(), enterPage: Screen1()));

          },
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        brightness: Brightness.dark,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(

            'Create Account',
            style: TextStyle(
              color: Colors.white, // 3
            ),
          ),),
      ),
      //Body
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: <Widget>[
              //Counting
            //SIZE BOX
            SizedBox(
            height: 100.0,
          ),
               Container(
                  alignment: Alignment.center,
                  //Header
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //1

                      Container(
                        padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,// You can use like this way or like the below line
                          //borderRadius: new BorderRadius.circular(30.0),
                          color: Colors.green,
                          border: Border.all(
                              width: 2
                          ),
                        ),
                        child: new Text("1", style: new TextStyle(color: Colors.white, fontSize: 18.0)),// You can add a Icon instead of text also, like below.
                        //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                      ),//............

                      //divider
                      Container(


                        width: 30.0,
                        height: 5,
                        color: Colors.black,
                      ),

                      //2
                      Container(

                        //width: 50.0,
                        //height: 50.0,
                        padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,// You can use like this way or like the below line
                          //borderRadius: new BorderRadius.circular(30.0),
                          color: Colors.green,
                          border: Border.all(
                              width: 2
                          ),
                        ),
                        child: new Text("2", style: new TextStyle(color: Colors.black, fontSize: 18.0)),// You can add a Icon instead of text also, like below.
                        //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                      ),//.........

                      //divider
                      Container(


                        width: 30.0,
                        height: 5,
                        color: Colors.black,
                      ),

                      //3
                      Container(
                        //width: 50.0,
                        //height: 50.0,
                        padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,// You can use like this way or like the below line
                          //borderRadius: new BorderRadius.circular(30.0),
                          color: Colors.white,
                          border: Border.all(
                              width: 2
                          ),
                        ),
                        child: new Text("3", style: new TextStyle(color: Colors.black, fontSize: 18.0)),// You can add a Icon instead of text also, like below.
                        //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                      ),//.........

                      //divider
                      Container(


                        width: 30.0,
                        height: 5,
                        color: Colors.black,
                      ),

                      //4
                      Container(

                        //width: 50.0,
                        //height: 50.0,
                        padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,// You can use like this way or like the below line
                          //borderRadius: new BorderRadius.circular(30.0),
                          color: Colors.white,
                          border: Border.all(
                              width: 2
                          ),
                        ),
                        child: new Text("4", style: new TextStyle(color: Colors.black, fontSize: 18.0)),// You can add a Icon instead of text also, like below.
                        //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                      ),//.........

                    ],
                  ),
                ),



              //Gritting


              //InputText
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      //Gretting Title
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                              'Personal Information',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                          ),
                        ),

                      //SizeBox
                      SizedBox(
                        height: 30,
                      ),

                      //Gretting Description
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please fill the information below and your goal for digital saving.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),

                      //Spinner 1
                      Container(

                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                            child: Column(
                              children:<Widget> [
                                //Text Label
                                // Container(
                                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                //   child:Align(
                                //     alignment: Alignment.centerLeft,
                                //     child:Text("Goal for activation",
                                //       style: TextStyle(
                                //           color: Colors.blueGrey
                                //
                                //         ),),
                                //   ),
                                // ),
                                //Container Dropdowwn
                                Container(
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButtonFormField<String>(
                                        focusColor:Colors.white,
                                        dropdownColor: Colors.white,
                                        decoration: InputDecoration(
                                          filled: true,

                                          fillColor: Colors.white,
                                          labelText: 'Goal for activation',
                                          labelStyle: TextStyle(fontSize: 12),
                                        ),
                                        value: _chosenValue1,
                                        //elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor:Colors.black,
                                        items: <String>[
                                          'Vacation',
                                          'Education',
                                          'Wedding',
                                          'Other',
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,style:TextStyle(color:Colors.black),),
                                          );
                                        }).toList(),
                                        // hint:Text(
                                        //   "- Choose Option -",
                                        //   style: TextStyle(
                                        //       color: Colors.black,
                                        //       fontSize: 16,
                                        //       fontWeight: FontWeight.w500),
                                        // ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenValue1 = value;
                                          });
                                        },
                                      ),
                                      ),
                                  ),
                                ),
                              ],),

                      ),


                      //Spinner 2
                      Container(

                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children:<Widget> [
                            //Text Label
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            //   child:Align(
                            //     alignment: Alignment.centerLeft,
                            //     child:Text("Goal for activation",
                            //       style: TextStyle(
                            //           color: Colors.blueGrey
                            //
                            //         ),),
                            //   ),
                            // ),
                            //Container Dropdowwn
                            Container(
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField<String>(
                                    focusColor:Colors.white,
                                    dropdownColor: Colors.white,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'Monthly income',
                                      labelStyle: TextStyle(fontSize: 12),
                                    ),
                                    value: _chosenValue2,
                                    //elevation: 5,
                                    style: TextStyle(color: Colors.white),
                                    iconEnabledColor:Colors.black,
                                    items: <String>[
                                      '5.000.000',
                                      '7.000.000',
                                      '10.000.000',
                                      '15.000.000',
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,style:TextStyle(color:Colors.black),),
                                      );
                                    }).toList(),
                                    // hint:Text(
                                    //   "- Choose Option -",
                                    //   style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.w500),
                                    // ),
                                    onChanged: (String value) {
                                      setState(() {
                                        _chosenValue2 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],),

                      ),


                      //Spinner 3
                      Container(

                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children:<Widget> [
                            //Text Label
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            //   child:Align(
                            //     alignment: Alignment.centerLeft,
                            //     child:Text("Goal for activation",
                            //       style: TextStyle(
                            //           color: Colors.blueGrey
                            //
                            //         ),),
                            //   ),
                            // ),
                            //Container Dropdowwn
                            Container(
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField<String>(
                                    focusColor:Colors.white,
                                    dropdownColor: Colors.white,
                                    decoration: InputDecoration(
                                      filled: true,
                                      // Added this
                                      hintText: '-Choose Option-',
                                      fillColor: Colors.white,
                                      labelText: 'Monthly expense',
                                      labelStyle: TextStyle(fontSize: 12),
                                    ),
                                    value: _chosenValue3,
                                    //elevation: 5,
                                    style: TextStyle(color: Colors.white),
                                    iconEnabledColor:Colors.black,
                                    items: <String>[
                                      '2.000.000',
                                      '5.000.000',
                                      '8.000.000',
                                      '10.000.000',
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,style:TextStyle(color:Colors.black),),
                                      );
                                    }).toList(),
                                    // hint:Text(
                                    //   "- Choose Option -",
                                    //   style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontSize: 12),
                                    // ),
                                    onChanged: (String value) {
                                      setState(() {
                                        _chosenValue3 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],),

                      ),

                    ],
                  )

              ),

              //Button Next
              Container(
                margin: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    height: 58,
                    minWidth: double.infinity,
                    onPressed: () {
                      //Move to New Page
                      Navigator.push(context,
                          EnterExitRoute(exitPage:Screen2(), enterPage: Screen3()));

                    },
                    child: const Text('Next', style: TextStyle(fontSize: 20)),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        ),
    );
  }

  //Backpress
  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(context,
        EnterExitRoute(exitPage: Screen2(), enterPage: Screen1()));
  }

}