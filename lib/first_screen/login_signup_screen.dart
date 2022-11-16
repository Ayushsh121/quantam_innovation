import 'package:flutter/material.dart';

import 'Signup_screen.dart';
import 'login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title:Column(
          children: [
            Row(
              children: [
                Text("SOCIAL"),
                Text("X",style: TextStyle(fontSize: 40),)
              ],
            )
          ],
        ),
          bottom: TabBar(tabs: [
            Text("SIGNUP",style: TextStyle(fontSize: 30),),
            Text("LOGIN",style: TextStyle(fontSize: 30,color: Colors.blueGrey),),
          ],
            onTap:(index){
            print(index);
            } ,
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(color: Colors.red,borderRadius:
            BorderRadius.only(topRight:Radius.circular(20))),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: TabBarView(children: [LoginPage(),
              SignupScreen(),
            ],)),
          ],
        ),
      ),
    );
  }
}
