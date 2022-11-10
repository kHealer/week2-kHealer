import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Models/Employer.dart';
import 'package:library_system/Screens/EmployeeScreens/EmployeeDetailWidget.dart';

import '../../Enum/EmployeeType.dart';

class EmployeeOperation_Widget extends StatefulWidget {
  const EmployeeOperation_Widget({super.key});

  @override
  State<EmployeeOperation_Widget> createState() =>
      _EmployeeOperation_WidgetState();
}

class _EmployeeOperation_WidgetState extends State<EmployeeOperation_Widget> {
  TextEditingController ctName = TextEditingController();
  TextEditingController ctLastName = TextEditingController();
  TextEditingController ctPhone = TextEditingController();
  TextEditingController ctEmail = TextEditingController();

  List<Employer> lstEmployees = <Employer>[];

  EmployeeType? selectedEmpType;
  JobType? selectedJobType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Employer"), backgroundColor: Colors.orange.shade700),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              TextField(
                controller: ctName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    hintText: 'Name'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                  controller: ctLastName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      hintText: 'SirName'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                  controller: ctPhone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      hintText: 'Phone Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                  controller: ctEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      hintText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: DropdownButton<EmployeeType>(
                  onChanged: (EmployeeType? newValue) {
                    setState(() {
                      selectedEmpType = newValue;
                    });
                  },
                  items: EmployeeType.values.map((EmployeeType value) {
                    return DropdownMenuItem<EmployeeType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              !lstEmployees.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: DropdownButton(
                        onChanged: (Employer? newValue) {
                          setState(() {});
                        },
                        items: lstEmployees.map((Employer value) {
                          return DropdownMenuItem<Employer>(
                            value: value,
                            child: Text(value.firstName.toString()),
                          );
                        }).toList(),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(0),
                child: DropdownButton<JobType>(
                  onChanged: (JobType? newValue) {
                    setState(() {
                      selectedJobType = newValue;
                    });
                  },
                  items: JobType.values.map((JobType value) {
                    return DropdownMenuItem<JobType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: saveEmployee,
                  child: Text("Save"),
                ),
              ),
              !lstEmployees.isEmpty
                  ? Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: lstEmployees.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                  title: Text(
                                    lstEmployees[index]
                                        .firstName
                                        .toString()
                                        .toUpperCase(),
                                  ),
                                  subtitle: Text(lstEmployees[index]
                                      .lastName
                                      .toString()
                                      .toUpperCase()),
                                  leading: Icon(Icons.person),
                                  trailing: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeDetailWidget(
                                                  employee:
                                                      lstEmployees[index]),
                                        ));
                                  },
                                ),
                              ),
                            );
                          }),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  saveEmployee() {
    Employer emp = new Employer();

    emp.firstName = ctName.text.toString();
    emp.lastName = ctLastName.text.toString();
    emp.phoneNumber = ctPhone.text.toString();
    emp.eMail = ctEmail.text.toString();
    emp.title = selectedEmpType;
    emp.jType = selectedJobType;

    setState(() {
      lstEmployees.add(emp);
      ctName.text = "";
      ctLastName.text = "";
      ctEmail.text = "";
      ctPhone.text = "";
    });
  }
}
