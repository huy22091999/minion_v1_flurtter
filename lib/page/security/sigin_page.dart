import 'package:flutter/cupertino.dart';
import 'package:minion_v1/values/minion_colors.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import 'login_view_model.dart';

class SigInPage extends StatefulWidget {
  const SigInPage({Key? key}) : super(key: key);

  @override
  State<SigInPage> createState() => _SigInPageState();
}

class _SigInPageState extends State<SigInPage> {
  final viewModel = Provider.of<LoginViewModel>(contextStatic!);

  @override
  Widget build(BuildContext context) {
    contextStatic = context;
    return Container(
      color: minionBackground,
      padding: const EdgeInsets.only(top: 50),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text("Đăng kí",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30,
                    color: textColorBlue,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('assets/images/img_sigin.png'),
            ),
          ),
        ],
      ),
    );
  }
}
