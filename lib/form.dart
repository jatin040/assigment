import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:marbel_assesment/dashboard.dart';
import 'package:marbel_assesment/fields.dart';
import 'package:marbel_assesment/user.dart';
import 'package:provider/provider.dart';

class Userform extends StatefulWidget {


  const Userform({super.key});
  @override
  State<Userform> createState() => _UserformState();
}


class _UserformState extends State<Userform> {
  final form = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Card(
        child: Form(
          key: form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.white,
                leading: Icon(Icons.check_box),
                title: Text("Checkbox"),
                actions: [
                  TextButton(
                    child: Text('remove'),
                      onPressed: () {},
                  ),
                  TextButton(
                    child: Text('done'),
                    onPressed: () {
                      Provider.of<User>(context, listen: false).Done(
                          txtlabelController.text.toString(),
                          txtinfoController.text.toString());
                      Get.to(() => dashboard());
                      },
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
                  // controller: txtlabelController,
                  decoration: InputDecoration(
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
                  // controller: txtinfoController,
                  decoration: InputDecoration(
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
                child: CheckboxListTile(
                    title: const Text('Required'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                      },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: CheckboxListTile(
                  title: const Text('ReadOnly'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: CheckboxListTile(
                  title: const Text('Hidden field'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
