import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/app_modal_box/view/app_modal_box.dart';
import 'package:postmanovich/core/widgets/app_modal_box/widget/app_modal_header.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/entity/project/project_storage_typy.dart';
import 'package:postmanovich/domain/entity/project/project_type.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:postmanovich/features/project_create/bloc/project_create_bloc.dart';
import 'package:postmanovich/features/project_create/widget/project_create_actions.dart';
import 'package:postmanovich/features/project_create/widget/project_create_content.dart';

class ProjectCreateModal extends StatefulWidget {
  const ProjectCreateModal({super.key});

  @override
  State<ProjectCreateModal> createState() => _ProjectCreateModalState();
}

class _ProjectCreateModalState extends State<ProjectCreateModal>
    with TickerProviderStateMixin {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descriptionCtrl;
  late final TabController _typeTabCtrl;
  late final TabController _saveMethodTabCtrl;
  late final ValueNotifier<int> _typeIndexNotifier;
  late final ValueNotifier<int> _saveMethodIndexNotifier;
  late final ValueNotifier<ProjectCreateParams> _paramsNotifier;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectCreateBloc(context.read<ProjectUseCase>()),
      child: AppModalBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppModalHeader(
              headerText: "Новый проект",
            ),
            ProjectCreateContent(
              nameCtrl: _nameCtrl,
              descriptionCtrl: _descriptionCtrl,
              typeTabCtrl: _typeTabCtrl,
              saveMethodTabCtrl: _saveMethodTabCtrl,
              typeIndexNotifier: _typeIndexNotifier,
              saveMethodIndexNotifier: _saveMethodIndexNotifier,
            ),
            ProjectCreateActions(
              paramsNotifier: _paramsNotifier,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _nameCtrl = TextEditingController()..addListener(_nameLstnr);
    _descriptionCtrl = TextEditingController()..addListener(_descrLstnr);
    _typeTabCtrl = TabController(
      length: 2,
      vsync: this,
    );
    _saveMethodTabCtrl = TabController(
      length: 4,
      vsync: this,
    );
    _typeIndexNotifier = ValueNotifier(0)..addListener(_typeLstnr);
    _saveMethodIndexNotifier = ValueNotifier(0)..addListener(_storageLstnr);
    _paramsNotifier = ValueNotifier(ProjectCreateParams.init());
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descriptionCtrl.dispose();
    _typeTabCtrl.dispose();
    _saveMethodTabCtrl.dispose();
    _typeIndexNotifier.dispose();
    _saveMethodIndexNotifier.dispose();
    _paramsNotifier.dispose();
    super.dispose();
  }

  void _nameLstnr() {
    _paramsNotifier.value = _paramsNotifier.value.copyWith(
      name: _nameCtrl.text,
    );
  }

  void _descrLstnr() {
    _paramsNotifier.value = _paramsNotifier.value.copyWith(
      description: _descriptionCtrl.text,
    );
  }

  void _storageLstnr() {
    _paramsNotifier.value = _paramsNotifier.value.copyWith(
      storageType: ProjectStorageType.fromTap(_saveMethodIndexNotifier.value),
    );
  }

  void _typeLstnr() {
    _paramsNotifier.value = _paramsNotifier.value.copyWith(
      type: ProjectType.fromTab(_typeIndexNotifier.value),
    );
  }
}
