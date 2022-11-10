import 'dart:ffi';
import '../Enum/EmployeeType.dart';
import 'Person.dart';

class Employer extends Person {
  Long? registrationNumber;
  DateTime? workStartDate;
  EmployeeType? title;
  String? jobPhone;
  double? salary;
  JobType? jType;

  List<Employer> employeeRecords = <Employer>[];

  List<Employer> getEmployess() {
    return employeeRecords;
  }

  bool deleteEmployee(Employer emp) {
    employeeRecords.remove(emp);
    return true;
  }

  bool updateEmployee() {
    employeeRecords.remove(this);
    employeeRecords.add(this);
    return true;
  }

  Employer getEmployeeRecord(Long registrationNumber) {
    return employeeRecords.firstWhere(
        (element) => element.registrationNumber == registrationNumber);
  }

  @override
  bool save() {
    employeeRecords.add(this);
    return true;
  }
}
