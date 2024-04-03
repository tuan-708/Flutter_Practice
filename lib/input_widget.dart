import 'package:flutter/material.dart';

enum Gender { male, female }

class InputWidgetPage extends StatefulWidget {
  const InputWidgetPage({super.key});

  @override
  State<InputWidgetPage> createState() => _InputWidgetPageState();
}

class _InputWidgetPageState extends State<InputWidgetPage> {
  final nameController = TextEditingController();
  bool checked = false;
  Gender gender = Gender.male;
  final countries = ["Việt Nam", "Lào", "Campuchia", "Thái lan", "Đông ti mo"];

  String? county;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Widget Example'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter your name', labelText: 'Name'),
              controller: nameController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(nameController.text);
              },
              child: Text('Submit')),
          Row(
            children: [
              Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = value!;
                    });
                  }),
              Text('Yêu thích đá bóng')
            ],
          ),
          Row(
            children: [
              Radio<Gender>(
                value: Gender.male,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              Text('Nam'),
              Radio<Gender>(
                value: Gender.female,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              Text('Nữ')
            ],
          ),
          DropdownButton<String>(
            hint: Text('Chọn quốc gia'),
            value: county,
            items: countries.map((e) => DropdownMenuItem<String>(
              value:e,
              child: Text(e))).toList(),
            onChanged: (value) {
              setState(() {
                county = value;
              });
            },
          ),
        ]),
      ),
    );
  }
}
