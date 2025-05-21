import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

class Globals {
  Globals._();

  static const httpMethodGet = "GET";
  static const httpMethodPost = "POST";
  static const httpMethodPut = "PUT";
  static const httpMethodPatch = "PATCH";
  static const httpMethodDelete = "DELETE";

  static const projectTypePublic = "public";
  static const projectTypePrivate = "private";

  static const projectStorageTypeCloud = "cloud";
  static const projectStorageTypeLocal = "local";
  static const projectStorageTypeGithub = "github";
  static const projectStorageTypeGitlab = "gitlab";

  static const Folder testRoot = Folder(
    id: "main",
    name: "Main",
    isExpanded: true,
    children: [
      Folder(
        id: "folder1",
        name: "Folder 1",
        isExpanded: false,
        children: [
          Folder(
            id: "folder3",
            name: "Folder 3",
            isExpanded: false,
            children: [],
          ),
        ],
      ),
      Folder(
        id: "folder2",
        name: "Folder 2",
        isExpanded: false,
        children: [],
      ),
      RequestItem(
        id: "request1",
        name: "Request 1",
        method: HttpMethodGet(),
      ),
      RequestItem(
        id: "request2",
        name: "Request 2",
        method: HttpMethodPost(),
      ),
    ],
  );
}
