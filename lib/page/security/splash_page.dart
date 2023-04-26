import 'package:flutter/material.dart';
import 'package:minion_v1/page/home/home_page.dart';
import 'package:minion_v1/page/security/login_page.dart';
import 'package:minion_v1/page/security/login_view_model.dart';
import 'package:minion_v1/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    final viewModel = Provider.of<LoginViewModel>(context);
    viewModel.getCurrentUser().then((value) => {
      Future.delayed(const Duration(milliseconds: 3000), () {
        if (value?.username == null) {
          navigateReplacePage(context, const LogInPage());
        } else {
          navigateReplacePage(context, const HomePage());
        }
      })
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
