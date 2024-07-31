import 'package:flutter/cupertino.dart';

class AppSizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  const AppSizedBox({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
