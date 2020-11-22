class User {
  String firstName;
  String lastName;
  String authToken;
  String userId;

  User({this.firstName, this.lastName, this.authToken, this.userId});
  
  factory User.fromJson(Map<String, dynamic> user) {
    return User(
        authToken: user['authToken'],
        firstName: user['firstName'],
        lastName: user['lastName'],
        userId: user['userId']);
  }
  
}
