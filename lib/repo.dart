import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_get_api_first/model.dart';

class PersonRepository {
  Future<List<Person>> getPerson() async {
    var url = 'https://reqres.in/api/users?page=2';
    var response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var result = data['data'] as List;
        List<Person> list =
            result.map<Person>((json) => Person.fromJson(json)).toList();
        print(response.body);
        return list;
      } else {
        print(response.statusCode); 
        return <Person>[];
      }
    } catch (e) {
      print(e);
      return <Person>[];
    }
  }
}
