import 'package:flutter/cupertino.dart';

class CustomCupertinoPageScaffold extends StatelessWidget {
  const CustomCupertinoPageScaffold({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: CupertinoColors.white,
        border: const Border(),
        leading: const SizedBox.shrink(),
      ),
      child: child,
    );
  }
}
