import 'package:flutter/material.dart';

Future<T?> navigateToWidget<T>(BuildContext context, Widget widget) {
  return Navigator.of(context).push<T>(MaterialPageRoute(
    builder: (context) {
      return widget;
    },
    fullscreenDialog: true,
    settings: const RouteSettings(),
  ));
}

Future<T?> navigateToUntilRemove<T>(BuildContext context, Widget widget) {
  return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
    return widget;
  }), (route) => false);
}
