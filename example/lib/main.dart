import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return YourAwesomeApp();
  }
}

class YourAwesomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Sample Appp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flushbar test app")),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("BOTTOM"),
                onPressed: () {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    dismissDirection: DismissDirection.down,
                  )
                    ..title = "Bottom"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("TOP"),
                onPressed: () {
                  Flushbar(flushbarPosition: FlushbarPosition.TOP)
                    ..title = "TOP"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("Linear"),
                onPressed: () {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    forwardAnimationCurve: Curves.linear,
                  )
                    ..title = "Top with Linear animation"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("bounceInOut"),
                onPressed: () {
                  Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      forwardAnimationCurve: Curves.bounceInOut)
                    ..title = "Top with bounceInOut animation"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("easeInOut"),
                onPressed: () {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    forwardAnimationCurve: Curves.easeInOut,
                  )
                    ..title = "Top with easeInOut animation"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("elasticInOut"),
                onPressed: () {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    forwardAnimationCurve: Curves.elasticInOut,
                  )
                    ..title = "Top with elasticInOut animation"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: MaterialButton(
                child: Text("fastOutSlowIn"),
                onPressed: () {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    forwardAnimationCurve: Curves.fastOutSlowIn,
                  )
                    ..title = "Top with fastOutSlowIn animation"
                    ..message = _message()
                    ..duration = Duration(seconds: 3)
                    ..show(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _message() => "Sample text to be shown in flushbar";
}
