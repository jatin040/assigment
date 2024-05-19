import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:marbel_assesment/dashboard.dart';
import 'package:marbel_assesment/user.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marbel_assesment/button_controller.dart';


void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create:(_)=>User())
], child: MyApp(),));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum SingingCharacter { Required, readonly, HiddenField  }

class _MyAppState extends State<MyApp> {

  var txtlabelController = TextEditingController();
  var txtinfoController = TextEditingController();

  SingingCharacter? _character = SingingCharacter.Required;

  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Card.outlined(
            borderOnForeground: true,
            color: Colors.white,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.white,
                    leading: Icon(Icons.check_box),
                    title: Text("Checkbox"),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(2)),
                              side: BorderSide(
                                color: Colors.black,
                                width: 0.5
                              )
                            )
                          ),
                          child: Text('remove', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 0.5
                                  )
                              )
                          ),
                          child: Text('done', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white),),
                          onPressed: () {
                            Provider.of<User>(context, listen: false).SignIn(
                                txtlabelController.text.toString(),
                                txtinfoController.text.toString());
                            Get.to(() => dashboard());
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,30,30,10),
                    child: Text("Label", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                    child: TextField(
                      controller: txtlabelController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Label',
                        hintText: 'Enter the label',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,30,30,10),
                    child: Text("info-text", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                    child: TextField(
                      controller: txtinfoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add additional information',
                        hintText: 'information',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,30,30,10),
                    child: Text("Setting", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,10,30,10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                          title: const Text('Required'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Required,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),),
                        Expanded(child: ListTile(
                          title: const Text('Readonly'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.readonly,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),),
                        Expanded(child: ListTile(
                          title: const Text('HiddenField'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.HiddenField,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
