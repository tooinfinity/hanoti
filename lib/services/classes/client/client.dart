class Client {
  // declaration of object variable model
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  // convert json object to dart map
  Client.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? "",
        username = jsonMap['username'] ?? "",
        email = jsonMap['email'] ?? "",
        phone = jsonMap['phone'] ?? "",
        website = jsonMap['website'] ?? "";
}
