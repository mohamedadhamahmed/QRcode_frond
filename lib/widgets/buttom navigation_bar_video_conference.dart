import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom() : super();

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  bool show_chat = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: height * 0.89,
      child: Container(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
                  Text("Camera")
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.mic_none)),
                  Text("Mute")
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.speaker_group)),
                  Text("Sound")
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          show_chat = !show_chat;
                        });
                      },
                      icon: Icon(Icons.shop_2_outlined)),
                  Text("Show chat")
                ],
              )
            ],
          )),
    );
  }
}
