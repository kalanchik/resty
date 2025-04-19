import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/typedef/typedefs.dart';
import 'package:postmanovich/core/widgets/request_url_input/bloc/url_input_bloc.dart';
import 'package:postmanovich/domain/entity/curl/curl_request.dart';

class RequestUrlInput extends StatefulWidget {
  const RequestUrlInput({
    super.key,
    required this.width,
    required this.height,
    required this.controller,
    this.onCurlInsert,
    this.onCurlCreated,
    required this.onUrlChanged,
  });

  final double width;
  final double height;
  final TextEditingController controller;
  final ValueChanged<Uri?> onUrlChanged;
  final ContextCallBack? onCurlInsert;
  final ContextCallBackWithArg<Curl>? onCurlCreated;

  @override
  State<RequestUrlInput> createState() => _RequestUrlInputState();
}

class _RequestUrlInputState extends State<RequestUrlInput> {
  late final UrlInputBloc bloc;

  @override
  void initState() {
    bloc = UrlInputBloc(widget.controller.text);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _CurlListener(
      bloc: bloc,
      controller: widget.controller,
      onCurlInsert: widget.onCurlInsert,
      onCurlCreated: widget.onCurlCreated,
      onUrlChanged: widget.onUrlChanged,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: BlocBuilder<UrlInputBloc, UrlInputState>(
          bloc: bloc,
          builder: (context, state) {
            return TextFormField(
              controller: widget.controller,
              onChanged: (value) => bloc.add(ChangeUrlInputEvent(value)),
              decoration: InputDecoration(
                hintText: "Введите URL или curl-запрос",
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CurlListener extends StatelessWidget {
  const _CurlListener({
    required this.bloc,
    required this.controller,
    this.onCurlInsert,
    this.onCurlCreated,
    required this.child,
    required this.onUrlChanged,
  });

  final ContextCallBack? onCurlInsert;
  final ContextCallBackWithArg<Curl>? onCurlCreated;
  final ValueChanged<Uri?> onUrlChanged;
  final UrlInputBloc bloc;
  final TextEditingController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UrlInputBloc, UrlInputState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is UrlInputInitial) {
          onUrlChanged(state.url);
          return;
        }

        if (state is UrlInputCurlParsing) {
          if (onCurlInsert != null) {
            onCurlInsert!(context);
          }
          return;
        }
        if (state is UrlInputCurl) {
          controller.text = state.curl.url;

          if (onCurlCreated != null) {
            onCurlCreated!(state.curl, context);
          }

          log("CURL: ${state.curl.toString()}");
        }
      },
      child: child,
    );
  }
}
