import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICYM Mangalore', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState(){
    super.initState();
    Timer(Duration(seconds : 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image(
            image: AssetImage('assets/WhatsApp Image 2024-03-15 at 19.45.55_96c43c74.jpg'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget as(Widget a, String str, String str2,  Color c , bool b, String sth){
    return ListTile(
      onTap : () async {
        if(b){
          controller.loadRequest( Uri.parse(sth));
        }else{
          final Uri _url = Uri.parse(sth);
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }
        }
        Navigator.pop(context);
      }, leading: a, title : Text(str), subtitle : Text(str2), splashColor: Colors.orange.shade800,
      trailing : b ? Icon(Icons.arrow_forward_ios_sharp, color : c) : Icon(Icons.open_in_new_outlined, color : c)

    );
  }

  Widget a(){
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset("assets/WhatsApp_Image_2024-03-15_at_19.45.55_96c43c74-removebg-preview.png"),
            decoration: BoxDecoration(
              color: Colors.indigo.shade500,
            ),
          ),
          as(Icon(Icons.home, color : Colors.green)
              , "Home", "Back to Home Page",  Colors.green, true, "https://registration.icymmangalore.com/"),
          as(Icon(Icons.web_stories, color : Colors.blue)
              , "Website", "Check our Website",  Colors.blue, true, "https://icymmangalore.com/"),
          as(Icon(Icons.mail, color : Colors.indigo)
              , "Contact", "Contact Us",  Colors.indigo, true, "https://www.icymmangalore.com/contact-us"),
          as(Icon(Icons.web_stories, color : Colors.pink)
              , "Open Website", "Open Website in your Browser",  Colors.pink, false, "https://registration.icymmangalore.com/"),
          SizedBox(height : 13),
          Text("   All Forms", style : TextStyle(color : Colors.red, fontSize: 19)),
          as(Icon(Icons.verified_user, color : Colors.redAccent)
              , "ICYM MEMBERS REGISTRATION", "FORM A ",  Colors.redAccent, true, "https://registration.icymmangalore.com/training-form-copy/"),
          as(Icon(Icons.verified_user, color : Colors.purpleAccent)
              , "OFFICE BEARERS REGISTRATION", "FORM B",  Colors.purpleAccent, true, "https://registration.icymmangalore.com/training/"),
          as(Icon(Icons.people, color : Colors.deepOrange)
              , "AFFILIATION", "FORM C",  Colors.deepOrange, true, "https://registration.icymmangalore.com/affiliation-application-form/"),
          as(Icon(Icons.category, color : Colors.indigo)
              , "PARTICIPATION DETAILS", "FORM D",  Colors.indigo, true, "https://registration.icymmangalore.com/affiliation-form-to-keep-existing-name/"),
          as(Icon(Icons.how_to_vote, color : Colors.green)
              , "VOTERS DETAILS", "FORM E",  Colors.green, true, "https://registration.icymmangalore.com/form-e-voters-list/"),
          as(Icon(Icons.assignment, color : Colors.red)
              , "NOMINATION", "FORM F",  Colors.red, true, "https://registration.icymmangalore.com/nomination-form/"),
          as(Icon(Icons.badge, color : Colors.redAccent)
              , "RECOMMENDATION BY PARISH", "FORM G",  Colors.redAccent, true, "https://registration.icymmangalore.com/recommendation-form-by-parish/"),
          as(Icon(Icons.receipt_long, color : Colors.purpleAccent)
              , "RECOMMENDATION BY KNOWN MEMBER", "FORM H",  Colors.purpleAccent, true, "https://registration.icymmangalore.com/recommendation-form-by-known-member/"),
          as(Icon(Icons.leaderboard, color : Colors.deepOrange)
              , "DIOCESAN LEVEL EVENTS", "FORM I",  Colors.deepOrange, true, "https://registration.icymmangalore.com/permission-for-denary-level-form/"),
          as(Icon(Icons.clear, color : Colors.indigo)
              , "LEAVE REQUEST", "FORM J",  Colors.indigo, true, "https://registration.icymmangalore.com/icym-leave-form/"),
          as(Icon(Icons.support_agent, color : Colors.green)
              , "PROBLEM RESOLVE", "FORM K",  Colors.green, true, "https://registration.icymmangalore.com/problem-resolution-request-form-copy-copy-copy/"),
          as(Icon(Icons.how_to_vote, color : Colors.red)
              , "VOTERS LIST", "FORM L- DEANERY",  Colors.red, true, "https://registration.icymmangalore.com/certificate/"),

        ],
      ),
    );
  }

  late final WebViewController controller;
  double progress = 0.0;
  void initState(){
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progres) {
            setState(() {
              progress = progres / 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://cycledekhoj.in/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )..loadRequest(Uri.parse('https://registration.icymmangalore.com/'));
    setState(() {

    });
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? _lastPressedAt;
  @override
  Widget build(BuildContext context) {
    int backButtonPressCount = 0;
    return  WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 2)) {
          if (await controller.canGoBack()) {
            controller.goBack();
          } else {
            _lastPressedAt = DateTime.now();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Press back again to exit'),
                duration: Duration(seconds: 2),
              ),
            );
          }
          return false; // Do not exit the app
        } else {
          return true; // Allow exit the app
        }
      },
      child: Container(
        width : MediaQuery.of(context).size.width,
        height : MediaQuery.of(context).size.height,
        child: Scaffold(
          drawer : a(),
          resizeToAvoidBottomInset: true ,
          key: _scaffoldKey ,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                   icon : Icon(Icons.menu_open_sharp, color : Colors.white, size : 35), onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                ),
                Image.asset("assets/WhatsApp_Image_2024-03-15_at_19.45.55_96c43c74-removebg-preview.png", height : 35),
                SizedBox(width : 10),
                Text("ICYM Mangalore", style : TextStyle(color : Colors.white, fontWeight : FontWeight.w900)),
              ],
            ),
            backgroundColor: Color(0xff2d5be3) ,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(4.0) , // Set the desired height
              child: LinearProgressIndicator(
                value: progress ,
                backgroundColor: Colors.white ,
                valueColor: AlwaysStoppedAnimation<Color>( Color(0xff2d5be3)),
              ),
            ),
          ),
          body: WebViewWidget(controller: controller,
          ),
        ),
      ),
    );
  }

  Future<void> _refreshWebView() async {
    await controller.reload();
  }
}
