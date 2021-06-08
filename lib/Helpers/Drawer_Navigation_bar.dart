import 'package:butter/screens/Categories_screen.dart';
import 'package:butter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("yagnic"),
              accountEmail: Text("yagnic@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                    radius: 40, backgroundImage: AssetImage("assets/sky.jpg")),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black, Colors.purple])),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
            ),
            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.category),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Categories_screen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
