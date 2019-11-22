import 'package:flutter/material.dart';

void main() => runApp(DrawerOnly());

class DrawerOnly extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext ctxt) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("Drawer Header"),
              decoration: new BoxDecoration(
                  color: Colors.orange
              ),
            ),
            new ListTile(
              title: new Text("Item => 1"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstPage()));
              },
            ),
            new ListTile(
              title: new Text("Item => 2"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SecondPage()));
              },
            ),
          ],
        )
    );
  }
}
class DWidget extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(),   // New Line
      appBar: new AppBar(
        title: new Text("Drawer Demo"),
      ),
      body: new Text("Drawer Body"),
    );
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(),    // new Line
      appBar: new AppBar(title: new Text("First Page"),),
      body: new Text("I belongs to First Page"),
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(),    // New Line
      appBar: new AppBar(title: new Text("Second Page"),),
      body: new Text("I belongs to Second Page"),
    );
  }
}