import 'package:flutter/material.dart';
import 'package:latihan_get_api_first/repo.dart';

import 'model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  PersonRepository personRepository = PersonRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Api'),
      ),
      body: FutureBuilder(
        future: personRepository.getPerson(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? getData(context, snapshot.data as List<Person>)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                ); 
        },
      ),
    );
  }

  Widget getData(BuildContext context, List<Person> person) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(person[index].firstName),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  person[index].avatar,
                  height: 40,
                  width: 40,
                )),
            subtitle: Text(person[index].email),
          );
        },
        itemCount: person.length,
      ),
    );
  }
}
