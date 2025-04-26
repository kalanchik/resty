import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/core/widgets/request_url_input/view/request_url_input.dart';
import 'package:postmanovich/domain/entity/curl/curl_request.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';
import 'package:postmanovich/features/test/widget/method_dropdown.dart';
import 'package:postmanovich/features/test/widget/request_info_content/request_info_content.dart';
import 'package:postmanovich/features/test/widget/request_info_tab_bar.dart';
import 'package:postmanovich/features/test/widget/request_listener.dart';
import 'package:postmanovich/features/test/widget/request_response/request_response_content.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/factory/collection_tree_bloc_factory.dart';
import 'package:postmanovich/features/test/widget/tree_builder/workspace_tree_builder.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  // Контроллер для ввода url
  late final TextEditingController _urlInputCtrl;

  // JSON DATA конткроллер
  late final JsonTextEditingController _controller;

  // Request Tab контроллер
  late final TabController _tabController;

  // Response Tab контроллер
  late final TabController _responseTabController;

  // Текущий индекс request вкладки
  late final ValueNotifier<int> _tabIndex;

  // Response слушатель
  late final ValueNotifier<RequestResponse?> _responseNotifier;

  // Response Scroll контроллер
  late final ScrollController _responseScrollCtrl;

  // Response JSON контроллер
  late final JsonTextEditingController _responseJsonController;

  // Response Numbers Scroll контроллер
  late final ScrollController _responseNumbersScrollCtrl;

  late final ValueNotifier<int> _responseTabNotifier;

  @override
  void initState() {
    _initDep();
    super.initState();
  }

  @override
  void dispose() {
    _disposeDep();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RequestBloc(
            context.read<RequestUseCase>(),
            context.read<Talker>(),
          ),
        ),
        BlocProvider<CollectionTreeBloc>(
          create: (context) => CollectionTreeBlocFactory.create(context),
        ),
      ],
      child: RequestListener(
        onUrlChanged: (value) => _urlInputCtrl.text = value,
        onResponseChanged: (value) => _responseNotifier.value = value,
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                ),
                child: Row(
                  children: [
                    const WorkspaceTreeBuilder(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8.0,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8.0,
                            children: [
                              MethodDropdown(
                                bloc: context.read<RequestBloc>(),
                              ),
                              Expanded(
                                child: RequestUrlInput(
                                  width: double.infinity,
                                  height: 45,
                                  controller: _urlInputCtrl,
                                  onCurlInsert: _onCurlInsert,
                                  onCurlCreated: (arg, _) => _onCurlCreated(
                                    arg,
                                    context,
                                  ),
                                  onUrlChanged: (url) =>
                                      _onUrlChanged(context, url),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () =>
                                    context.read<RequestBloc>().add(
                                          StartRequestEvent(),
                                        ),
                                child: const Text("SEND"),
                              ),
                              IconButton(
                                onPressed: () => _exportToCurl(context),
                                icon: const Icon(
                                  Icons.code,
                                ),
                              ),
                            ],
                          ),
                          RequestInfoTabBar(
                            controller: _tabController,
                            onPageChanged: (value) => _tabIndex.value = value,
                          ),
                          RequestInfoContent(
                            jsonCtrl: _controller,
                            tabNotifier: _tabIndex,
                          ),
                          RequestResponseContent(
                            tabController: _responseTabController,
                            responseNotifier: _responseNotifier,
                            responseScrollController: _responseScrollCtrl,
                            responseCtrl: _responseJsonController,
                            responseNumbersScrollCtrl:
                                _responseNumbersScrollCtrl,
                            responseTabNotifier: _responseTabNotifier,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _initDep() {
    _urlInputCtrl = TextEditingController();
    _controller = JsonTextEditingController();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 2,
    );
    _responseTabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(
        () => _responseTabNotifier.value = _responseTabController.index,
      );
    _tabIndex = ValueNotifier(2);
    _responseNotifier = ValueNotifier(null)..addListener(_onResponseChanged);
    _responseScrollCtrl = ScrollController()..addListener(_onRespScrollChanged);
    _responseJsonController = JsonTextEditingController();
    _responseNumbersScrollCtrl = ScrollController();
    _responseTabNotifier = ValueNotifier(0);
  }

  void _disposeDep() {
    _tabController.dispose();
    _urlInputCtrl.dispose();
    _tabIndex.dispose();
    _controller.dispose();
    _responseTabController.dispose();
    _responseNotifier.dispose();
    _responseScrollCtrl.dispose();
    _responseJsonController.dispose();
    _responseNumbersScrollCtrl.dispose();
    _responseTabNotifier.dispose();
  }

  void _exportToCurl(BuildContext context) {
    context.read<RequestBloc>().add(
          ExportRequestEvent(),
        );
  }

  void _onResponseChanged() {
    _responseJsonController.text = _responseNotifier.value?.data?.toRaw() ?? "";
  }

  void _onRespScrollChanged() {
    _responseNumbersScrollCtrl.jumpTo(_responseScrollCtrl.offset);
  }

  void _onCurlInsert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Парсим curl..."),
      ),
    );
  }

  void _onCurlCreated(Curl arg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("curl вставлен"),
      ),
    );

    if (arg is CurlHttpRequest) {
      context.read<RequestBloc>().add(
            ChangeMethodRequestEvent(method: arg.method),
          );

      context.read<RequestBloc>().add(ChangeHeadersRequestEvent(arg.headers));
    }

    context.read<RequestBloc>().add(
          ChangeUrlRequestEvent(Uri.tryParse(arg.url)),
        );

    _controller.text = arg.body?.toView() ?? "";
  }

  void _onUrlChanged(BuildContext context, Uri? value) {
    context.read<RequestBloc>().add(
          ChangeUrlRequestEvent(value),
        );
  }
}
