import 'package:flutter_test/flutter_test.dart';
import 'package:postmanovich/config/constants/globals.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/tree/rebuilder/tree_rebuilder.dart';

void main() {
  group("Tree Success", () {
    test("Add Entity in folder", () {
      const Folder oldRoot = Globals.testRoot;

      const targetPath = ["folder1"];

      final builder = TreeRebuilder(
        targetPath: targetPath,
        updateFn: (parrent) {
          if (parrent is! Folder) {
            throw Exception("Cannot update entity that is not folder");
          }

          return parrent.addChild(
            const Folder(
              id: "folder3",
              name: "Папка 3",
              isExpanded: false,
              children: [],
            ),
          );
        },
      );

      final result = builder.rebuild(oldRoot) as Folder;

      final changedChilder = result.children.first as Folder;

      expect(changedChilder.children.first.id, "folder3");
    });
    test("Change Expanded in folder", () {
      const Folder oldRoot = Globals.testRoot;

      const targetPath = ["folder1"];

      final builder = TreeRebuilder(
        targetPath: targetPath,
        updateFn: (parrent) {
          if (parrent is! Folder) {
            throw Exception("Cannot update entity that is not folder");
          }

          return parrent.copyWith(
            isExpanded: true,
          );
        },
      );

      final result = builder.rebuild(oldRoot) as Folder;

      final changedChilder = result.children.first as Folder;

      expect(changedChilder.isExpanded, true);
    });
    test("Add request in folder", () {
      const Folder oldRoot = Globals.testRoot;

      const targetPath = ["folder1"];

      final builder = TreeRebuilder(
        targetPath: targetPath,
        updateFn: (parrent) {
          if (parrent is! Folder) {
            throw Exception("Cannot update entity that is not folder");
          }

          return parrent.addChild(
            RequestItem.empty("request1"),
          );
        },
      );

      final result = builder.rebuild(oldRoot) as Folder;

      final changedChilder = result.children.first as Folder;

      expect(changedChilder.children[1].id, "request1");
    });
  });
}
