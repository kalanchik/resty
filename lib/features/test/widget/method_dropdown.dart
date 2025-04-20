import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';

class MethodDropdown extends StatelessWidget {
  const MethodDropdown({
    super.key,
    required this.bloc,
  });

  final RequestBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RequestBloc, RequestState, HttpMethod>(
      bloc: bloc,
      selector: (state) {
        return state.method;
      },
      builder: (context, method) {
        return SizedBox(
          width: 150,
          child: DropdownButton<HttpMethod>(
            items: const [
              DropdownMenuItem(
                value: HttpMethodGet(),
                child: Text("GET"),
              ),
              DropdownMenuItem(
                value: HttpMethodPost(),
                child: Text("POST"),
              ),
            ],
            selectedItemBuilder: (context) => const [
              Center(child: Text("GET")),
              Center(child: Text("POST")),
            ],
            value: method,
            alignment: Alignment.center,
            onChanged: (value) {
              if (value != null) {
                bloc.add(ChangeMethodRequestEvent(method: value));
              }
            },
            underline: const SizedBox.shrink(),
            elevation: 0,
            icon: const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
