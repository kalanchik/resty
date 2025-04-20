import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/headers_row_item/headers_row_item.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';

class RequestHeadersContent extends StatelessWidget {
  const RequestHeadersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RequestBloc, RequestState,
        List<MapEntry<String, String>>>(
      bloc: context.read<RequestBloc>(),
      selector: (state) {
        return state.headersEnties;
      },
      builder: (context, headers) {
        final List<Widget> items = [];

        // Добавляем header, которые уже есть

        for (var i = 0; i < headers.length; i++) {
          items.add(
            HeadersRowItem(
              key: UniqueKey(),
              entry: headers[i],
              onChanged: (value) => _editHeader(
                context,
                entry: value,
                index: i,
              ),
            ),
          );
        }

        // Строка для добавления нового header

        items.add(
          HeadersRowItem(
            key: UniqueKey(),
            entry: null,
            onChanged: (value) => _addHeader(context, value),
          ),
        );

        return Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.0,
                children: List<Widget>.generate(
                  items.length,
                  (index) => items[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _editHeader(
    BuildContext context, {
    required MapEntry<String, String> entry,
    required int index,
  }) {
    context.read<RequestBloc>().add(EditHeaderRequestEvent(
          header: entry,
          index: index,
        ));
  }

  void _addHeader(BuildContext context, MapEntry<String, String> entry) {
    context.read<RequestBloc>().add(AddHeaderRequestEvent(header: entry));
  }
}
