// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //repositories urls
  static const LIVE_SERVER = 'http://139.255.35.91';
  static const TEST_SERVER = 'http://139.255.35.91:8880';
  static const LOCAL_SERVER = 'http://192.168.1.110:800';
  static String BASE_URL = /*kReleaseMode ? _LIVE_SERVER :*/ TEST_SERVER;

  static const String servicePathLogin = '/mobilestaff/auth/google';
  static const String servicePathGeneral = '/mobilestaff/service';
  static const String thumbnailDir = '/document/thumbnails/';
  static const String tokenurl = LIVE_SERVER + '/gdrive/generatetoken';
  //styling
  static BorderRadius containerRadius = BorderRadius.circular(2);
  static const Color linkColor = Colors.blue;
  static const Color primaryColor = Color(0xFF276FBF);
  static TextStyle defaultTextStyle = GoogleFonts.nunitoSans();
  static TextTheme defaultTextTheme = GoogleFonts.nunitoSansTextTheme();
  static String defaultFontFamily = defaultTextStyle.fontFamily!;
  static TextStyle linkStyle = defaultTextStyle.copyWith(
      fontWeight: FontWeight.bold, color: Colors.blue);
  static TextStyle screenTitleStyle =
      TextStyle(fontWeight: FontWeight.bold, fontFamily: defaultFontFamily);
  //global variables
  static bool appleSignInAvailable = false;
  static const loginType = ['GOOGLE', 'APPLE', 'USERPASS'];
  static const allowedExtLMS = [
    'jpg',
    'png',
    'jpeg',
    'pdf',
    'docx',
    'xlsx',
    'pptx'
  ];
  static const imageExtensions = [
    'jpg',
    'png',
    'jpeg',
  ];
  static const allowedFileSizeLMS = 25 * 1024 * 1024;
  static const allowedFileNameLengthLMS = 200;
  static BuildContext? loginContext;

  static const fcmVapidKey =
      'BLwDDAg4ZhuruC3ixuiP_FwYe7WsVEWOzlQ9YQd7r6S0Dq4Buh2M1TDJzY4NUW8yjYjmUfb6eMkHNaNDeACSi0I';
  //from firebase->kissstaff->projectsetting->
}

class MenuID {
  static int menuattendanceid = 182;
  static int menucovid19 = 2832;
  static int menusurvey = 3102;
  static int menulms = 3532;
  static int menureimbursement = 3027;
  static int menuattendancenewclass = 3520;
  static int menuattendancenewperiod = 3547;

  static int menuattendancenew = 1000;
  static int menuteachingschedule = 1001;
  static int menuteachingcalendar = 1002;

  static int menuteachingmaterial = 1002;
  static int menuassignment = 1002;
  static int menuonlinelearning = 1002;
  static int menustdsacovid = -10;
}

Map<String, List<double>> entityPos = {
  'entity0': [-6.159560, 106.846751], //YAYASAN
  'entity1': [-6.159644, 106.846661], //SKK JAKARTA
  'entity2': [-6.180722, 106.633499], //TANGERANG
  'entity3': [-6.814434, 107.144157], //CIANJUR
  'entity4': [-3.320221, 114.595769], //BANJARMASIN
  'entity5': [-0.074802, 109.360323], //KUBURAYA
  'entity6': [-6.1350597, 106.7165928], //KGS JAKARTA
  'entity7': [-6.9694550, 110.396733], //SEMARANG
  'entity8': [-1.626535, 103.6201975], //KGS JAMBI
  'entity100': [-6.15956, 106.8465710], //YAYSAN KANAAN
};
