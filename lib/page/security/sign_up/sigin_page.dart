import 'package:flutter/material.dart';
import 'package:minion_v1/data/model/user.dart';
import 'package:minion_v1/page/security/sign_up/sign_up_bloc.dart';
import 'package:minion_v1/page/security/sign_up/sign_up_event.dart';
import 'package:minion_v1/values/minion_colors.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({Key? key}) : super(key: key);

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  SignInBloc bloc = SignInBloc();

  @override
  void initState() {
    super.initState();
    bloc.streamUser.listen((event) {
      if(event!=null){
        if ( event.username != null) {
          Navigator.pop(context);
        }
        else{
          showMaterialDialogError(context,"Đăng kí thất bại","Đã xảy ra lỗi trong quá trình đăng kí.");
        }
      }
    });
  }

  String selectedValue = finish;
  String selectedValueDob = genderM;

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController firstName = TextEditingController();
    TextEditingController dob = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController university = TextEditingController();
    return Material(
        child: Container(
      color: minionBackground,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
            textField(username, "Tên đăng nhập:", "vd: soi_nho_co_don",
                "assets/images/img_sigin.png"),
            textField(firstName, "Họ tên đệm:", "vd: Jon Hand",
                "assets/images/img_sigin.png"),
            textField(
                lastName, "Tên:", "vd: Myjar", "assets/images/img_sigin.png"),
            textField(
                dob, "Ngày sinh:", "dd/mm/yyyy", "assets/images/img_sigin.png"),
            dropdown("Giới tính:", selectedValueDob, dropdownItemsGender,
                "assets/images/img_sigin.png"),
            textField(email, "Email:", "adc@gmail.com",
                "assets/images/img_sigin.png"),
            textField(university, "Tên trường:", "vd: Gtvt",
                "assets/images/img_sigin.png"),
            dropdown("Sinh viên năm:", selectedValue, dropdownItems,
                "assets/images/img_sigin.png"),
            passwordField(password, "Nhập mật khẩu:", "adbc123",
                "assets/images/img_sigin.png"),
            passwordField(confirmPassword, "Nhập lại mật khẩu:", "adbc123",
                "assets/images/img_sigin.png"),
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
                    onPressed: () => {
                          bloc.event.add(AddUserEvent(
                              newUser: User(
                            username: username.text,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            // dob: dob.text,
                            email: email.text,
                            password: password.text,
                            active: true,
                            confirmPassword: confirmPassword.text,
                            gender: selectedValueDob,
                            year: (selectedValue == year1)
                                ? 1
                                : (selectedValue == year2)
                                    ? 2
                                    : (selectedValue == year3)
                                        ? 3
                                        : (selectedValue == year4)
                                            ? 4
                                            : (selectedValue == nearFinish)
                                                ? 5
                                                : (selectedValue == finish)
                                                    ? 6
                                                    : 7,
                            university: university.text,
                          )))
                        },
                    child: const Text("Đăng kí"))),
          ],
        ),
      ),
    ));
  }

  textField(TextEditingController controller, String stringTitle,
      String hintText, String pathImage) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              stringTitle,
              style: const TextStyle(color: textColorSignIn, fontSize: 16),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintStyle: const TextStyle(fontSize: 16),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 101, 99, 99)),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                hintText: hintText,
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
                  child: ImageIcon(
                    AssetImage(pathImage),
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minHeight: 24, minWidth: 24)),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: year1, child: Text(year1)),
      const DropdownMenuItem(value: year2, child: Text(year2)),
      const DropdownMenuItem(value: year3, child: Text(year3)),
      const DropdownMenuItem(value: year4, child: Text(year4)),
      const DropdownMenuItem(value: yearEnd, child: Text(yearEnd)),
      const DropdownMenuItem(value: nearFinish, child: Text(nearFinish)),
      const DropdownMenuItem(value: finish, child: Text(finish)),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsGender {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: genderM, child: Text(genderM)),
      const DropdownMenuItem(value: genderL, child: Text(genderL)),
    ];
    return menuItems;
  }

  passwordField(TextEditingController controller, String stringTitle,
      String hintText, String pathImage) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              stringTitle,
              style: const TextStyle(color: textColorSignIn, fontSize: 16),
            )),
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    hintStyle: const TextStyle(fontSize: 16),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    hintText: hintText,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
                      child: ImageIcon(
                        AssetImage(pathImage),
                      ),
                    ),
                    prefixIconConstraints:
                        const BoxConstraints(minHeight: 24, minWidth: 24)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  dropdown(String stringTitle, String value,
      List<DropdownMenuItem<String>> listDrop, String pathImage) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              stringTitle,
              style: const TextStyle(color: textColorSignIn, fontSize: 16),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
          child: DropdownButtonFormField(
            value: value,
            items: listDrop,
            onChanged: (Object? value) {
              setState(() {
                value = value.toString();
              });
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintStyle: const TextStyle(fontSize: 16),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
                  child: ImageIcon(
                    AssetImage(pathImage),
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minHeight: 24, minWidth: 24)),
          ),
        ),
      ],
    );
  }
}
