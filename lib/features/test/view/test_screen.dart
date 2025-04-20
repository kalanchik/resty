import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/core/widgets/request_url_input/view/request_url_input.dart';
import 'package:postmanovich/domain/entity/curl/curl_request.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';
import 'package:postmanovich/features/test/widget/method_dropdown.dart';
import 'package:postmanovich/features/test/widget/request_info_content/request_info_content.dart';
import 'package:postmanovich/features/test/widget/request_info_tab_bar.dart';
import 'package:postmanovich/features/test/widget/request_listener.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _urlInputCtrl;
  late final JsonTextEditingController _controller;
  late final TabController _tabController;
  late final ValueNotifier<int> _tabIndex;

  @override
  void initState() {
    _urlInputCtrl = TextEditingController();
    _controller = JsonTextEditingController();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 2,
    );
    _tabIndex = ValueNotifier(2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _urlInputCtrl.dispose();
    _tabIndex.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestBloc(
        context.read<RequestUseCase>(),
        context.read<Talker>(),
      ),
      child: RequestListener(
        onUrlChanged: (value) => _urlInputCtrl.text = value,
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            onUrlChanged: (url) => _onUrlChanged(context, url),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            context
                                .read<RequestBloc>()
                                .add(StartRequestEvent());
                          },
                          child: const Text("SEND"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RequestInfoTabBar(
                      controller: _tabController,
                      onPageChanged: (value) => _tabIndex.value = value,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RequestInfoContent(
                      jsonCtrl: _controller,
                      tabNotifier: _tabIndex,
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

    if (arg.body != null) {
      _controller.text = arg.body!.toView();
    }
  }

  void _onUrlChanged(BuildContext context, Uri? value) {
    context.read<RequestBloc>().add(
          ChangeUrlRequestEvent(value),
        );
  }
}
