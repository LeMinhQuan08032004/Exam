import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://localhost:8080/api/customers';

void main() async {
  while (true) {
    print('\n1. Add Customer');
    print('2. Get All Customers');
    print('3. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await addCustomer();
        break;
      case '2':
        await getAllCustomers();
        break;
      case '3':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

Future<void> addCustomer() async {
  stdout.write('Enter Full Name: ');
  String? fullName = stdin.readLineSync();
  if (fullName == null || fullName.isEmpty) {
    print('Full Name cannot be empty.');
    return;
  }

  stdout.write('Enter Birthday (YYYY-MM-DD): ');
  String? birthday = stdin.readLineSync();
  if (birthday == null || birthday.isEmpty) {
    print('Birthday cannot be empty.');
    return;
  }

  stdout.write('Enter Address: ');
  String? address = stdin.readLineSync();
  if (address == null || address.isEmpty) {
    print('Address cannot be empty.');
    return;
  }

  stdout.write('Enter Phone Number: ');
  String? phoneNumber = stdin.readLineSync();
  if (phoneNumber == null || phoneNumber.isEmpty) {
    print('Phone Number cannot be empty.');
    return;
  }

  Map<String, dynamic> customer = {
    'fullName': fullName,
    'birthday': birthday,
    'address': address,
    'phoneNumber': phoneNumber,
  };

  final response = await http.post(
    Uri.parse(baseUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(customer),
  );

  if (response.statusCode == 200) {
    print('Customer added successfully.');
  } else {
    print('Failed to add customer. Status code: ${response.statusCode}');
  }
}

Future<void> getAllCustomers() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    List customers = jsonDecode(response.body);
    if (customers.isEmpty) {
      print('No customers found.');
    } else {
      for (var customer in customers) {
        print('-----------------------------------------');
        print('ID: ${customer['id']}');
        print('Name: ${customer['fullName']}');
        print('Birthday: ${customer['birthday']}');
        print('Address: ${customer['address']}');
        print('Phone: ${customer['phoneNumber']}');
        print('-----------------------------------------');
      }
    }
  } else {
    print('Failed to fetch customers. Status code: ${response.statusCode}');
  }
}
