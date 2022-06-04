import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/view/profile_screen.dart';
import 'package:qr_code_scanner_example/view/qr_create_screen.dart';
import 'package:qr_code_scanner_example/view/qr_scan_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_QR_For_visitor_screen.dart';
import 'create_visitor_screen.dart';
import 'login_screen.dart';

class Home_Screen extends StatefulWidget {
  static String id = "Home_Screen";

  const Home_Screen({Key key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.movie_creation_rounded),
                text: 'Create QR CODE',
              ),
              Tab(
                icon: Icon(Icons.scanner_outlined),
                text: 'SCAN QR CODE',
              ),
              Tab(
                icon: Icon(Icons.person_add_alt_1_outlined),
                text: 'Create Visitor',
              ),
            ],
          ),
          centerTitle: true,
          title: Text('Home'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Profile_screen.id);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  backgroundImage: AssetImage('adham.jpg'),
                  radius: 20,
                ),
              ),

            )
            ,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () async{
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('rember_me', false);
                  Navigator.pushReplacementNamed(context,  Login_Screen.id);
                },
                child: Icon(Icons.exit_to_app,color: Colors.white,size: 35,),
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [Create_QRCODE_vistor(), QRViewExample(), Create_Visitor()],
        ),
      ),
    );
  }
}
