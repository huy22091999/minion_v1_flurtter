import 'package:flutter/material.dart';
import 'package:minion_v1/data/model/user.dart';
import 'package:minion_v1/page/home/home_state.dart';
import 'package:minion_v1/page/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {
  late HomeViewModel viewModel;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = Provider.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );

  }

  Widget homeLayout(BuildContext context, HomeState state) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Xin chào!"),
                  Text(state
                      .getUser()
                      ?.username ?? " NULL")

                ],
              ),
            ),
            Container(
              child: SizedBox(
                width: 48,
                height: 48,
                child: Image.asset('assets/images/img.png'),
              ),
            ),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Tìm kiếm',
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(13, 92, 148, 1.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(238, 246, 252, 1)),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 24),
              alignment: Alignment.topLeft,
              child: const Text("Feature")),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/img.png'),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: const Text(
                              "Friends",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ))
                      ],
                    )),
                Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/img.png'),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: const Text("Note",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700)))
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
