class UserModel {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  const UserModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return UserModel();
    }

    return UserModel(
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'UserModel{userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, password: $password}';
  }
}
