
class Person {
    Person({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"] ?? "Id null",
        email: json["email"] ?? "emailnull",
        firstName: json["first_name"]?? "firstname null",
        lastName: json["last_name"]?? "null ",
        avatar: json["avatar"] ?? "https://www.mtsolar.us/wp-content/uploads/2020/04/avatar-placeholder-800x818.png",
    );
}

