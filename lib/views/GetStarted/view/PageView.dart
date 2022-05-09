import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'GetStartedPage.dart';
import '../Icons/icons_page_view_model.dart';
import '../model/GetStarted_model.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key, required this.pages}) : super(key: key);
  final List<GetStarted> pages;
  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
        onPageChanged: (value) {
          context.read<IconsPageViewModel>().changePageCount(value);
        },
        itemCount: widget.pages.length,
        itemBuilder: (BuildContext context, int index) {
          return GetStartedBuilder(getStarted: widget.pages[index]);
        },
      )),
    );
  }
}
