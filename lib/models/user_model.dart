class User {
  final String id;
  final String email;
  final String name;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      token: json['token'],
    );
  }

  // Method to convert User object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'token': token,
    };
  }
}
