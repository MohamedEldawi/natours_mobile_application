import 'package:flutter/material.dart';

class KeyBoardDismissWrapper extends StatelessWidget {
  final Widget child;
  const KeyBoardDismissWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
