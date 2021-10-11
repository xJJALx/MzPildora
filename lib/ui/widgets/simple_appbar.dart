import 'package:flutter/material.dart';

class SimpleAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
            Icon(Icons.search, size: 28),
          ],
        ),
      ),
    );
  }
}
