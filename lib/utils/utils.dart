import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void showMaterialDialogError(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Đăng nhập thất bại'),
          content: const Text('Đã xảy ra lỗi trong quá trình đăng nhập.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            )
          ],
        );
      });
}

navigatePage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
navigateReplacePage(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

log(String logString) {
  if (kDebugMode) {
    print(logString);
  }
}
