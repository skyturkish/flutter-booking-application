enum LottieItems { themeChange }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'change_thema';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
