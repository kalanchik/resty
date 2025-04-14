import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CupertinoColors.secondarySystemFill,
          border: Border(
            top: BorderSide(
              color: CupertinoColors.separator,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            children: [
              Row(
                spacing: 9.0,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(
                      CupertinoIcons.sidebar_left,
                      size: 15,
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.tv_circle,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Оффлайн",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Консоль",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
