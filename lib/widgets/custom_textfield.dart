import 'package:flutter/material.dart';
import '../constant.dart';

class Custom_TextField extends StatelessWidget {
  String hient;
  IconData icon;
  Function onclick;
  Function ontap;
  TextEditingController textEditingController;
  Custom_TextField(
      this.icon, this.hient, this.onclick, this.textEditingController,
      {this.ontap});

  String _errorMasage(String str) {
    switch (str) {
      case "Enter your name":
        return 'Name is empty';
      case "Enter your Email":
        return "email is empty";
      case "Enter your password":
        return "password is empty";
      case "Confirm Password":
        return "Confirm password is empty";
      case "Enter  Email":
        return 'Email is empty';
      case "Enter  Username":
        return "username is empty";
      case "Enter  password":
        return "password is empty";
      case "Confirm password":
        return "Confirm password is empty";
      case "Enter Visitor's phone number":
        return "Visitor's phone number";
      case "Enter National Or Military Number":
        return "Enter National Or Military Number is empty";
      case "Enter The Name Of The Unit Or Company":
        return "Name Of The Unit Or Company is empty";
      case "Enter  Visitor Job":
        return "Visitor Job is empty";
      case "Enter  Visitor Name":
        return " Visitor Name is empty";
      case "Enter  Username":
        return " Username is empty";
      case "Enter  User Degree":
        return " Degree is empty";
      case "Enter User Department":
        return " Department is empty";
      case "Enter User Military Number":
        return " Military Number is empty";
      case "Enter User Phone Number":
        return "Phone Number is empty";
      case "Enter  Email":
        return " Email is empty";
      case "Enter password":
        return " password is empty";
      case "place name":
        return " place name is empty";
      case "The reason for the visit":
        return " The reason for the visitis empty";
      case "Phone Number":
        return " Phone Number is empty";
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          controller: textEditingController,
          onTap: ontap,
          onSaved: onclick,
          obscureText: hient == "Enter your password" ||
                  hient == "Confirm Password" ||
                  hient == "Enter password"
              ? true
              : false,
          validator: (value) {
            if (value.isEmpty) {
              print("valid");
              print(value);
              return _errorMasage(hient);
            } else {
              return null;
            }
          },
          cursorColor: KMainColor,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            hintText: hient,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}
