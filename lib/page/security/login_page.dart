
import 'package:flutter/material.dart';
import 'package:minion_v1/page/home/home_page.dart';
import 'package:minion_v1/page/security/login_view_model.dart';
import 'package:minion_v1/page/security/sign_up/sigin_page.dart';
import 'package:minion_v1/utils/utils.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late final LoginViewModel viewModel;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    viewModel = Provider.of<LoginViewModel>(context);
    viewModel.tokenStream.listen((event) {
      if (event.accessToken != null) {
        navigateReplacePage(context, const HomePage());
      } else {
        showMaterialDialogError(context, "Đăng nhập thất bại",
            "Đã sảy ra lỗi trong quá trình đăng kí");
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: loginLayout(context, viewModel));
  }
}

Widget loginLayout(BuildContext context, LoginViewModel viewModel) {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  return Material(
      child: Container(
    constraints: const BoxConstraints.expand(),
    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 48,
        ),
        Container(
          margin: const EdgeInsets.only(left: 120),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 64,
                height: 72,
                child: Image.asset('assets/images/icon.png'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text("Minion",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 13, 92, 148),
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 32),
              child: const Text("Đăng nhập",
                  style: TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 13, 92, 148),
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: TextField(
                controller: username,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 101, 99, 99)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Username",
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 16, 8),
                      child: ImageIcon(
                        AssetImage("assets/images/ic_person.png"),
                      ),
                    ),
                    prefixIconConstraints:
                        BoxConstraints(minHeight: 24, minWidth: 24)),
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: TextField(
                    controller: password,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: true,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Password",
                        prefixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(24, 8, 16, 8),
                          child: ImageIcon(
                            AssetImage("assets/images/ic_password.png"),
                          ),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 24, minWidth: 24)),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 24),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  backgroundColor: const Color.fromARGB(255, 13, 92, 148),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                  minimumSize: const Size.fromHeight(
                      40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () =>
                    {viewModel.login(username.text, password.text)},
                child: const Text("Đăng nhập"))),
        Container(
            margin: const EdgeInsets.only(top: 24),
            alignment: Alignment.topCenter,
            child: TextButton(
                onPressed: () {
                  navigatePage(context, const SigUpPage());
                },
                child: const Text("Đăng kí")))
      ],
    ),
  ));
}
