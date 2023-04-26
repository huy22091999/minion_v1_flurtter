
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Scaffold(
        appBar: AppBar(title: const Text('Setting')),
        body: const Center(
          child: Text("Chức năng này đang phát triển"),
        ),
      ),
    );
  }
}
