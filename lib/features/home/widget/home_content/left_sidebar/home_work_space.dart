import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWorkSpace extends StatelessWidget {
  const HomeWorkSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CupertinoColors.secondarySystemFill,
          border: Border(
            bottom: BorderSide(
              color: CupertinoColors.separator,
            ),
            right: BorderSide(
              color: CupertinoColors.separator,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(9.0),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.person,
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    "Моя коллекция",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CupertinoButton.filled(
                  sizeStyle: CupertinoButtonSize.small,
                  child: Text("Новый"),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CupertinoButton.filled(
                  sizeStyle: CupertinoButtonSize.small,
                  child: Text("Импорт"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
