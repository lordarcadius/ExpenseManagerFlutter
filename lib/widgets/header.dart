import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey, Vipul',
                style: TextStyle(
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                child: Text(
                  'We hope you are having a great day',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      //fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ],
      ),
    );
  }
}
