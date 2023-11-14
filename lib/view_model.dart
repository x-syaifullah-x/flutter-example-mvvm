import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test/repository.dart';
import 'package:test/results.dart';

class ViewModel with ChangeNotifier {
  Result<String> _result = const ResultLoading(0, 0);

  Result<String> get result => _result;

  Future<void> fetch() async {
    try {
      final buffer = StringBuffer();
      final streamedResponse = await Repository.getInstance().test();
      // print(streamedResponse.length);
      // final response = streamedResponse.stream;
      // var progress = 0;
      // final contentLength = streamedResponse.contentLength ?? 0;

      // response.listen((value) async {
      //   for (var element in value) {
      //     _result = ResultLoading(progress, contentLength);
      //     buffer.write(String.fromCharCode(element));
      //     notifyListeners();
      //     progress += 1;
      //     print(progress);
      //     if (progress == contentLength) {
      //       final a = buffer.toString();
      //       _result = ResultLoading(progress, contentLength);
      //       notifyListeners();
      //       _result = ResultSuccess(a);
      //       notifyListeners();
      //     }
      //   }
      // });
    } catch (e) {
      _result = ResultError(Exception(e));
      notifyListeners();
    }
  }
}
