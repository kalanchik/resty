import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/app_modal_box/view/app_modal_box.dart';
import 'package:postmanovich/core/widgets/app_modal_box/widget/app_modal_header.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:postmanovich/features/delete_project_confirm/blocs/bloc/delete_project_bloc.dart';
import 'package:postmanovich/features/delete_project_confirm/blocs/delete_name_check/bloc/delete_name_check_bloc.dart';
import 'package:postmanovich/features/delete_project_confirm/widget/delete_project_action.dart';
import 'package:postmanovich/features/delete_project_confirm/widget/delete_project_content.dart';

class DeleteProjectModal extends StatefulWidget {
  const DeleteProjectModal({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  final String projectId;
  final String projectName;

  @override
  State<DeleteProjectModal> createState() => _DeleteProjectModalState();
}

class _DeleteProjectModalState extends State<DeleteProjectModal> {
  late final TextEditingController _confirmController;
  late final ValueNotifier<bool> _isValidNotifier;

  @override
  void initState() {
    _confirmController = TextEditingController();
    _isValidNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _confirmController.dispose();
    _isValidNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeleteNameCheckBloc(widget.projectName),
        ),
        BlocProvider(
          create: (context) => DeleteProjectBloc(
            context.read<ProjectUseCase>(),
          ),
        ),
      ],
      child: DeleteProjectListener(
        notifier: _isValidNotifier,
        child: AppModalBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppModalHeader(
                headerText: "Удалить проект?",
              ),
              DeleteProjectContent(
                projectName: widget.projectName,
                controller: _confirmController,
              ),
              DeleteProjectAction(
                notifier: _isValidNotifier,
                projectId: widget.projectId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteProjectListener extends StatelessWidget {
  const DeleteProjectListener({
    super.key,
    required this.notifier,
    required this.child,
  });

  final ValueNotifier<bool> notifier;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteNameCheckBloc, DeleteNameCheckState>(
      bloc: context.read<DeleteNameCheckBloc>(),
      listener: (context, state) {
        if (state is DeleteNameCheckSuccess) {
          notifier.value = true;
        }
        if (state is DeleteNameCheckError) {
          if (notifier.value != false) {
            notifier.value = false;
          }
        }
      },
      child: child,
    );
  }
}
