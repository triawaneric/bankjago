import 'package:bank_jago/animation/EnterExitRoute.dart';
import 'package:bank_jago/screen/screen_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math show sin, pi, sqrt;

class Screen3 extends StatefulWidget{
  const Screen3({Key key, this.size = 40, this.color = Colors.white54,
    this.onPressed, @required this.child,}) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  @override
  _ScreenState createState() => _ScreenState();
}


class _CirclePainter extends CustomPainter {
  _CirclePainter(
      this._animation, {
        @required this.color,
      }) : super(repaint: _animation);

  final Color color;
  final Animation<double> _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);

    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);

    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => true;
}


class _ScreenState extends State<Screen3> with SingleTickerProviderStateMixin{
  //Animation
  AnimationController _controller;

  //Date Time
  DateTime _selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  var cDate = TextEditingController();
  var cTime = TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
                Color.lerp(widget.color, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const _PulsateCurve(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),//I used some padding without fixed width and height
              decoration: new BoxDecoration(
                shape: BoxShape.circle,// You can use like this way or like the below line
                //borderRadius: new BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Icon(
                Icons.calendar_today,
                color: Colors.blue,
              ),// You can add a Icon instead of text also, like below.
              //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
            ),//.........

          ),
        ),
      ),
    );
  }




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
                  EnterExitRoute(exitPage:Screen3(), enterPage: Screen2()));

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
                          color: Colors.green,
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



                //Icon calender pulse
                Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: CustomPaint(
                    painter: _CirclePainter(
                    _controller,
                    color: widget.color,
                    ),
                    child: SizedBox(
                      width: widget.size * 2.125,
                      height: widget.size * 2.125,
                      child: _button(),
                    ),
                  ),
                ),


                //InputText
                Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        //Gretting Title
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Schedule Video Call',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        //SizeBox
                        SizedBox(
                          height: 20,
                        ),

                        //Gretting Description
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Choose the data and time that you preferred, we will send a '
                                'link via email to make a video call on that scheduled data and time.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        //Spinner 1
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),

                          child: new TextFormField(
                            autofocus: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: false,
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              labelText: 'Date',
                            ),
                            controller: cDate,
                            onTap: () {
                              _selectDateTender(context);
                            },
                          ),
                        ),






                        //Spinner 2
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),

                          child: new TextFormField(
                            autofocus: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: false,
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              labelText: 'Time',
                              // hintText: "-Choose options-",
                            ),
                            controller: cTime,
                            onTap: () {
                              _selectTime(context);
                            },
                          ),
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
        EnterExitRoute(exitPage: Screen3(), enterPage: Screen2()));
  }


  _selectDateTender(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.blue,
                onPrimary: Colors.white,
                surface: Colors.blue,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      final df = new DateFormat('E,dd MMMM yyyy');
      cDate
        ..text = df.format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: cDate.text.length, affinity: TextAffinity.upstream));
    }
  }

  //Time Picker
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    final now = new DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);

    setState(() {
      selectedTime = picked_s;
      cTime.text = formattedTime; //time convert into string formate

    });
  }

}

class _PulsateCurve extends Curve {
  const _PulsateCurve();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}