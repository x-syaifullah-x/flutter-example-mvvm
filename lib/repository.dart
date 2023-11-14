import 'dart:async';

import 'package:http/http.dart' as http;

class Repository {
  Repository._();

  static Repository? _instance;

  static Repository getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = Repository._();
      return _instance!;
    }
  }

  Future test() async {
    final client = http.Client();
    final streamResponse = await client.send(
      http.Request(
        "GET",
        Uri.parse(
          "https://httpbin.org/get",
          // "https://upload.wikimedia.org/wikipedia/commons/f/ff/Pizigani_1367_Chart_10MB.jpg",
        ),
      ),
    );
    print(streamResponse.contentLength);
    final streamController = StreamController<List<int>>();
    streamResponse.stream.listen(
      (value) {
        print(value);
        streamController.add(value);
      },
      onDone: () {
        // streamController.close();
        // client.close();
        print("onDone");
      },
      onError: () {
        // client.close();
        print("onError");
      },
      cancelOnError: true,
    );
    print("object");
    // await streamController.stream.forEach((element) {
    //   print(element);
    // });
    // return streamController.stream;
  }
}
