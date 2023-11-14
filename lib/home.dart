import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/results.dart';
import 'package:test/view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() async {
      await context.read<ViewModel>().fetch();
    });
    return Consumer<ViewModel>(
      builder: (context, value, child) {
        final res = value.result;
        switch (res) {
          case ResultLoading():
            print('${res.progress} : ${res.progressLength}');
          case ResultSuccess<String>():
            print(res.value);
          case ResultError<Exception>():
        }
        return Container();
      },
    );
  }
}
