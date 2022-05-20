import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/global/theme_notifier.dart';
import 'package:flutter_booking_application/views/GetStarted/model/get_started_model.dart';
import 'package:flutter_booking_application/views/GetStarted/view/page_view.dart';
import 'package:provider/provider.dart';

import 'views/GetStarted/Icons/icons_page_view_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter(); // Hive sadece int ettin daha fazlasını yapmadın

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(
          create: (_) => IconsPageViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: context.watch<ThemeNotifier>().currentTheme,
      title: 'Apart App',

      // home: const LoginView(),
      home: GetStartedView(
        pages: GetStartedList.pages,
      ),
    );
    // home: MainPageView(
    //   pages: GetStartedList.pages,
    // ));
  }
}
