import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Row(
      spacing: 6.0,
      children: [
        InkWell(
          onTap: changeExpression,
          child: AnimatedRotation(
            turns: isExpanded ? .5 : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastEaseInToSlowEaseOut,
            child: const Icon(
              Icons.expand_more,
            ),
          ),
        ),
        Row(
          spacing: 4.0,
          children: [
            const Icon(
              Icons.folder,
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
                        isDense: true,
                      ),
                      initialValue: name,
                    ),
                  );
                }
                return Text(
                  name,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
