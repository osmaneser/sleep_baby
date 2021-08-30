import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_baby/ui/modules/category/category_view_model.dart';

import 'core/constants/global_constants.dart';
import 'core/init/locator.dart';
import 'ui/modules/home/home_page.dart';
import 'ui/modules/home/home_view_model.dart';


void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  //tz.initializeTimeZones();

  //NotificationService().initNotification();

  //SystemChrome.setEnabledSystemUIOverlays([]);
  await MobileAds.initialize();

  runApp(
    MultiProvider(
      builder: (context, child) {
        return MyApp();
      },
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryViewModel(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalConstant.mainBack,
          appBarTheme: AppBarTheme(backgroundColor: GlobalConstant.alternativeSoft, foregroundColor: GlobalConstant.mainBack)),
      home: AudioServiceWidget(child: HomePage()),
    );
  }
}
