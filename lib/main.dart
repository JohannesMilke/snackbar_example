import 'package:flutter/material.dart';
import 'package:snackbar_example/widget/button_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'SnackBar Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'Action SnackBar',
                  onClicked: () => showActionSnackBar(context),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'Floating SnackBar',
                  onClicked: () => showFloatingSnackBar(context),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'Custom SnackBar',
                  onClicked: () => showCustomSnackBar(context),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'Error SnackBar',
                  onClicked: () => showErrorSnackBar(context),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Text('Tab'),
              title: Text('First'),
            ),
            BottomNavigationBarItem(
              icon: Text('Tab'),
              title: Text('Second'),
            ),
            BottomNavigationBarItem(
              icon: Text('Tab'),
              title: Text('Third'),
            ),
          ],
          onTap: (int index) {},
        ),
      );

  void showActionSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'This SnackBar has an action',
        style: TextStyle(fontSize: 16),
      ),
      action: SnackBarAction(
        label: 'Click Me',
        onPressed: () => print('Clicked on SnackBar Action!'),
      ),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showFloatingSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'This SnackBar is floating',
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showCustomSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'This is a SnackBar info which is a bit longer',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showErrorSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'This is a error message',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
    );

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
