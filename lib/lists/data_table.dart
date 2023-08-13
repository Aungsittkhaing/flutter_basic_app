import 'package:flutter/material.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

//data table
const kDataTable = <DataColumn>[
  DataColumn(label: Text('Student Name')),
  DataColumn(label: Text('Age'), numeric: true, tooltip: "Student's age"),
  DataColumn(
      label: Text('Subject'), numeric: true, tooltip: "Student's subject"),
  DataColumn(label: Text('Email'), numeric: true, tooltip: "Student's email"),
];

//data class
class Student {
  final String name;
  final int age;
  final String subject;
  final String mail;
  bool selected = false;
  Student(this.name, this.age, this.subject, this.mail);
}

class StudentDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Student> _students = <Student>[
    Student('Mg Mg', 22, 'Myanmar', 'mgmg@gmail.com'),
    Student('Aung Aung', 20, 'English', 'aungaung@gmail.com'),
    Student('Hla Hla', 22, 'Physics', 'hlahla@gmail.com'),
    Student('Mya Mya', 22, 'Chemistry', 'myamya@gmail.com'),
    Student('Ei Shwe Zin', 21, 'Law', 'eishwezin@gmail.com'),
    Student('Min Khant', 29, 'Maths', 'minkhant@gmail.com'),
    Student('Chaw Tin Zar', 30, 'Micro Biology', 'chawtinzar@gmail.com'),
    Student('Aye Aye Maw', 22, 'Eco', 'ayeayemaw@gmail.com'),
    Student('Win Khant', 26, 'IR', 'winkhant@gmail.com'),
    Student('Zaw Zaw', 23, 'History', 'zawzaw@gmail.com'),
  ];

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    assert(index >= 0);
    if (index >= _students.length) return null;
    final Student currentStudent = _students[index];
    return DataRow.byIndex(
        index: index,
        selected: currentStudent.selected,
        onSelectChanged: (bool? value) {
          if (value == null) {
            return;
          }
          if (currentStudent.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            currentStudent.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(currentStudent.name)),
          DataCell(Text(currentStudent.age.toString())),
          DataCell(Text(currentStudent.subject)),
          DataCell(Text(currentStudent.mail))
        ]);

    throw UnimplementedError();
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _students.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
}

class _DataTableExampleState extends State<DataTableExample> {
  int _rowPerPages = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student's Information",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: const Text("Student's information"),
          rowsPerPage: _rowPerPages,
          availableRowsPerPage: const <int>[5, 10, 20],
          onRowsPerPageChanged: (int? value) {
            if (value != null) {
              setState(() {
                _rowPerPages = value;
              });
            }
          },
          columns: kDataTable,
          source: StudentDataSource(),
        ),
      ),
    );
  }
}