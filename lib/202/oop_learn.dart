import 'dart:io';

import 'custom_exception.dart';

class FileDownload {
  bool? DownloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');
    return true;
  }
}

class FileItem {
  final String name;
  final File file;
  FileItem({
    required this.name,
    required this.file,
  });
}
