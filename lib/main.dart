import 'package:flutter/material.dart';

//DropDownValues
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Recuperar el valor d'un camp de text",
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

enum OS { above, below, zero }

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //RadioList
  OS? _os = OS.above;
  //TextField
  TextEditingController nameController = TextEditingController();
  String fullName = '';

  //DropDownValues
  String dropdownValue = list.first;

  //CheckBoxes
  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;
  bool checkboxValue4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        backgroundColor: Color.fromARGB(255, 26, 152, 255),
      ),
      body: Column(
        children: <Widget>[
          const Text(
            'Máximo Albero Fernández',
            style: TextStyle(fontSize: 25),
          ),
          const Text(
            'Description',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Please provide the speed of vehicle'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('Above 40Km/h'),
            visualDensity: VisualDensity(horizontal: -2.0, vertical: -2.0),
            leading: Radio<OS>(
              value: OS.above,
              groupValue: _os,
              onChanged: (OS? value) {
                setState(() {
                  _os = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Below 40Km/h'),
            visualDensity: VisualDensity(horizontal: -2.0, vertical: -2.0),
            leading: Radio<OS>(
              value: OS.below,
              groupValue: _os,
              onChanged: (OS? value) {
                setState(() {
                  _os = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('0Km/h'),
            visualDensity: VisualDensity(horizontal: -2.0, vertical: -2.0),
            leading: Radio<OS>(
              value: OS.zero,
              groupValue: _os,
              onChanged: (OS? value) {
                setState(() {
                  _os = value;
                });
              },
            ),
          ),
          Row(
            children: [
              const Text("Enter Remarks"),
            ],
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your remarks',
            ),
            onChanged: (text) {
              setState(() {
                fullName = text;
              });
            },
          ),
          Row(
            children: [
              const Text("Please provide the high speed of the vehicle"),
            ],
          ),
          //DropDown
          DropdownButton<String>(
            hint: const Text('Please select...'),
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Row(
            children: [
              const Text("Please provide the speed of the vehicle past 1 hour"),
            ],
          ),
          //CheckBoxList
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: checkboxValue1,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue1 = value!;
              });
            },
            title: const Text('20Km/h'),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: checkboxValue2,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue2 = value!;
              });
            },
            title: const Text('30Km/h'),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity(horizontal: -2.0, vertical: -2.0),
            value: checkboxValue3,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue3 = value!;
              });
            },
            title: const Text('40Km/h'),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity(horizontal: -2.0, vertical: -2.0),
            value: checkboxValue4,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue4 = value!;
              });
            },
            title: const Text('50Km/h'),
          ),
        ],
      ),
    );
  }
}
