import 'package:flutter/material.dart';
import 'package:flutter_app/presenter/homepresenter.dart';

abstract class HomeView {
  void updateCounter(int counter);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) {
    this.homeView = _MyHomePageState();
    this.homePresenter = HomePresentImp();
    homePresenter.setView(homeView);
  }

  final String title;
  HomeView homeView;
  HomePresenter homePresenter;

  @override
  _MyHomePageState createState() => this.homeView;
}

class _MyHomePageState extends State<MyHomePage> implements HomeView {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('Plush'),
              onPressed: widget.homePresenter.plush,
            ),
            FlatButton(
              child: Text('Minus'),
              onPressed: widget.homePresenter.minus,
            ),
            FlatButton(
              child: Text('Reset'),
              onPressed: widget.homePresenter.reset,
            )
          ],
        ),
      ),
    );
  }

  @override
  void updateCounter(int counter) {
    setState(() {
      _counter = counter;
    });
  }
}
