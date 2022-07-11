import 'dart:io' show Directory;

import 'package:path_provider/path_provider.dart'
    show
        getApplicationDocumentsDirectory,
        getApplicationSupportDirectory,
        getTemporaryDirectory;

enum DirectoryName {
  temporary,
  applicationSupport,
  applicationDocuments;

  Future<Directory> get asyncDirectory async {
    late Future<Directory> directoryAsync;

    switch (this) {
      case DirectoryName.temporary:
        directoryAsync = getTemporaryDirectory();
        break;

      case DirectoryName.applicationSupport:
        directoryAsync = getApplicationSupportDirectory();
        break;

      case DirectoryName.applicationDocuments:
        directoryAsync = getApplicationDocumentsDirectory();
        break;
    }

    return directoryAsync;
  }
}
