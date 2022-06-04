import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner_example/view/print_qrcode_screen.dart';
import 'package:qr_code_scanner_example/view/profile_screen.dart';
import 'package:qr_code_scanner_example/view/qr_create_screen.dart';
import 'package:qr_code_scanner_example/view/admin_home_screen.dart';
import 'package:qr_code_scanner_example/view/create_QR_For_visitor_screen.dart';
import 'package:qr_code_scanner_example/view/home_screen.dart';
import 'package:qr_code_scanner_example/view/login_screen.dart';
import 'package:qr_code_scanner_example/view/create_visitor_screen.dart';
import 'package:qr_code_scanner_example/view/show_visitor_data_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool rember_me=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
 rember_me= await prefs.getBool('rember_me');
 print('main'+rember_me.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.black,
        ),
    initialRoute:rember_me==true?Home_Screen.id: Login_Screen.id,
    routes: {
      Login_Screen.id: (context) => Login_Screen(),
      Create_Visitor.id: (context) => Create_Visitor(),
      Home_Screen.id: (context) => Home_Screen(),
      Admin_Home_Screen.id:(context)=>Admin_Home_Screen(),
      Admin_Home_Screen.id:(context)=>Admin_Home_Screen(),
      Create_QRCODE_vistor.id:(context)=>Create_QRCODE_vistor(),
      QRCreatePage.id:(context)=>QRCreatePage(),
      Show_Visitor_Data.id:(context)=>Show_Visitor_Data(),
      PDFSave.id:(context)=>PDFSave(),
      Profile_screen.id:(context)=>Profile_screen()
    },
  );
}

// class MainPage extends StatefulWidget {
//   final String title;
//
//   const MainPage({
//     @required this.title,
//   });
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ButtonWidget(
//                 text: 'Create QR Code',
//                 onClicked: () => Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => QRCreatePage(),
//                 )),
//               ),
//               const SizedBox(height: 32),
//               ButtonWidget(
//                 text: 'Scan QR Code',
//                 onClicked: () => Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => QRViewExample(),
//                 )),
//               ),
//             ],
//           ),
//         ),
//       );
// }
/// to run server flutter run -d web-server --web-hostname 192.168.2.114 --web-port 8080