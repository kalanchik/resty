import 'package:flutter/material.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';

class ResponseHeadersView extends StatelessWidget {
  const ResponseHeadersView({
    super.key,
    required this.responseNotifier,
  });

  final ValueNotifier<RequestResponse?> responseNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: responseNotifier,
            builder: (context, value, _) {
              if (value == null) {
                return const Center(
                  child: Text("Ожидаем ответ"),
                );
              }

              if (value is! RequestHttpResponse) {
                return const SizedBox.shrink();
              }

              final entries = value.headers.entries.toList();

              return ListView.builder(
                itemCount: value.headers.length,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black26,
                        ),
                        bottom: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(entries[index].key),
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: Colors.black26,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(entries[index].value),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
