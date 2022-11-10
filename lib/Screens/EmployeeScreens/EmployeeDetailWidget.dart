import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Enum/EmployeeType.dart';
import '../../Enum/EmployeeType.dart';
import '../../Models/Employer.dart';

class EmployeeDetailWidget extends StatelessWidget {
  EmployeeDetailWidget({super.key, required this.employee});

  Employer employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Detailed Information"),
          backgroundColor: Color.fromARGB(255, 248, 112, 1)),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(employee.firstName.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(employee.lastName.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(employee.eMail.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(employee.phoneNumber.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(employee.title.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(employee.jType.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
