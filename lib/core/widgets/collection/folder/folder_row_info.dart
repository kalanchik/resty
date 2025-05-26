import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/collection/folder/bloc/folder_rename_bloc.dart';

class FolderRowInfo extends StatelessWidget {
  const FolderRowInfo({
    super.key,
    required this.name,
    required this.isExpanded,
    required this.changeExpression,
  });

  final bool isExpanded;
  final String name;
  final VoidCallback changeExpression;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x1,
        vertical: AppNumbers.of(context).spacings.x1_5,
      ),
      child: Row(
        spacing: AppNumbers.of(context).spacings.x2,
        children: [
          InkWell(
            onTap: changeExpression,
            child: AnimatedRotation(
              turns: isExpanded ? .5 : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastEaseInToSlowEaseOut,
              child: AppIcon(
                icon: AppAssets.of(context).arrowAngleDown,
                size: 12,
                color: AppColors.of(context).icons.secondary,
              ),
            ),
          ),
          Row(
            spacing: 4.0,
            children: [
              AppIcon(
                icon: AppAssets.of(context).folderMenu,
                size: 16,
                color: AppColors.of(context).icons.primary,
              ),
              BlocBuilder<FolderRenameBloc, FolderRenameState>(
                bloc: context.read<FolderRenameBloc>(),
                builder: (context, state) {
                  if (state is FolderRanaming) {
                    return SizedBox(
                      width: 150,
                      child: TextFormField(
                        autofocus: true,
                        onTapOutside: (event) => context
                            .read<FolderRenameBloc>()
                            .add(StopFolderRenameEvent()),
                        onFieldSubmitted: (value) {
                          if (value.isEmpty) {
                            return;
                          }

                          context
                              .read<FolderRenameBloc>()
                              .add(CompleteFolderRenameEvent(
                                newName: value,
                              ));
                        },
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        decoration: const InputDecoration(
                          filled: false,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          isDense: true,
                        ),
                        initialValue: name,
                      ),
                    );
                  }
                  return Text(
                    name,
                    style: AppTextStyle.of(context).textFootnote.copyWith(
                          color: AppColors.of(context).text.primary,
                        ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
