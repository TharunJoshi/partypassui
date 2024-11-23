import 'package:flutter/widgets.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double width(double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  double height(double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  bool isSmallScreen() {
    return MediaQuery.of(context).size.width < 600;
  }

  bool isLargeScreen() {
    return MediaQuery.of(context).size.width >= 600;
  }
}
