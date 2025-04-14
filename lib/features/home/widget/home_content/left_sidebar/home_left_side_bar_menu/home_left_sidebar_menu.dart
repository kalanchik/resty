import 'package:flutter/cupertino.dart';

class HomeLeftSidebarMenu extends StatelessWidget {
  const HomeLeftSidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CupertinoColors.secondarySystemFill,
          border: Border(
            right: BorderSide(
              color: CupertinoColors.separator,
            ),
          ),
        ),
      ),
    );
  }
}
