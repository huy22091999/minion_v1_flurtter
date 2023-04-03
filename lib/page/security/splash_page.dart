import 'package:flutter/material.dart';
import 'package:minion_v1/page/home/home_page.dart';
import 'package:minion_v1/page/security/login_page.dart';
import 'package:minion_v1/page/security/login_view_model.dart';
import 'package:minion_v1/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key, required this.context});

  final BuildContext context;

  @override
  StatelessElement createElement() {
    log("createElement");
    final viewModel = Provider.of<LoginViewModel>(context);
    viewModel.getCurrentUser().then((value) => {
          Future.delayed(const Duration(milliseconds: 3000), () {
            if (contextStatic != null) {
              if (value == null) {
                navigateReplacePage(contextStatic!, const LoginPage());
              } else {
                navigateReplacePage(contextStatic!, HomePage(context: contextStatic!));
              }
            } else {
              log("function build not call yet?");
            }
          })
        });

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    contextStatic = context;
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 140,
            margin: const EdgeInsets.only(top: 100),
            child: Image.asset('assets/images/icon.png'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: const Text(
              'Minion',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  color: Color.fromARGB(255, 13, 92, 148),
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
