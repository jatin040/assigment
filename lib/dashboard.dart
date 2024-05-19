import 'package:flutter/material.dart';
import 'package:marbel_assesment/user.dart';
import 'package:provider/provider.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context,user,_){
      return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Text(user.label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(user.info, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          )
        )
      );
    });
  }
}
