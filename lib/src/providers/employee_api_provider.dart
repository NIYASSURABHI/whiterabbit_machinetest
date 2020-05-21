import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:api_to_sqlite_flutter/src/providers/db_provider.dart';
import 'package:dio/dio.dart';

class EmployeeApiProvider {
  Future<List<Employee>> getAllEmployees() async {
    var url = "http://www.mocky.io/v2/5d565297300000680030a986";
    Response response = await Dio().get(url);

    return (response.data as List).map((employee) {
      print('Inserting $employee');
      DBProvider.db.createEmployee(Employee.fromJson(employee));
    }).toList();
  }
}
