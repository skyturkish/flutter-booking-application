import 'package:flutter/material.dart';
import 'package:flutter_booking_application/product/constant/Durations/duration_items.dart';
import 'package:flutter_booking_application/product/constant/lottie/lottie_items.dart';
import 'package:flutter_booking_application/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              // context.read<ThemeNotifier>().changeTheme();
              isLight = !isLight;

              Future.microtask(() {
                //bu işlem bittikten sonra bunu yap diyoruz/ binevi .WhenComplate
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false, // --> Tekrar etme
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
