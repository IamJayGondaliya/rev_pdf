import 'package:flutter/material.dart';
import 'package:rev_pdf/globals.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  List<Map> allStuds = [
    {},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: allStuds
              .map(
                (elem) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            elem['roll_no'] = val;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            elem['name'] = val;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            elem['per'] = val;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            allStuds.removeAt(allStuds.indexOf(elem));
                            setState(() {});
                          },
                          label: const Text("Remove"),
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              allStuds.add({});
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Globals.allStudents.clear();
              Globals.allStudents = allStuds;
              Navigator.pushNamed(context, 'pdf_page');
            },
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text("PDF"),
          ),
        ],
      ),
    );
  }
}
