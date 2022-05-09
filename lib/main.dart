import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/GetStarted/Icons/icons_page_view_model.dart';
import 'views/GetStarted/model/GetStarted_model.dart';
import 'views/GetStarted/view/PageView.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => IconsPageViewModel())],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Apart App',
        home: MainPageView(
          pages: GetStartedList.pages,
        ));
  }
}
