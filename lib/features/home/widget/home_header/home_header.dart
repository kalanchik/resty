import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 13.5,
              ),
              child: Row(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CupertinoButton(
                      pressedOpacity: 0.8,
                      sizeStyle: CupertinoButtonSize.small,
                      child: Text(
                        "Главная",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CupertinoButton(
                      pressedOpacity: 0.8,
                      sizeStyle: CupertinoButtonSize.small,
                      child: Row(
                        children: [
                          Text(
                            "Коллекции",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            CupertinoIcons.control,
                            color: CupertinoColors.inactiveGray,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(
                      CupertinoIcons.settings,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CupertinoButton.filled(
                      sizeStyle: CupertinoButtonSize.small,
                      child: Text("Улучшить"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13.5,
              ),
              child: Row(
                children: [
                  Spacer(),
                  SizedBox(
                    width: 220,
                    child: CupertinoTextField(
                      placeholder: "Поиск ...",
                    ),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
