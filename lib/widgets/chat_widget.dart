import 'package:flutter/material.dart';

class Chat_Widget extends StatefulWidget {
  const Chat_Widget() : super();

  @override
  _Chat_WidgetState createState() => _Chat_WidgetState();
}

class _Chat_WidgetState extends State<Chat_Widget> {
  List massage = ['Hi'];
  int _selectedIndex = 0;
  bool show_chat = false;

  final myController = TextEditingController();
  String send_massege;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.2,
      height: height * 0.887,
      decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
      child: Stack(
        children: [
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 14),
              itemCount: massage.length,
              itemBuilder: (BuildContext, int index) {
                print(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('adham.jpg'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          margin: EdgeInsets.all(8),
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(massage[index]),
                          )),
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 2,
            right: 5,
            left: 5,
            top: height * 0.83,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    controller: myController,
                    onChanged: (value) {
                      setState(() {
                        send_massege = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'typing here',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffix: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                massage.add(send_massege);
                                myController.clear();
                              });
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue.withOpacity(0.8),
                            )),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
