class MyUserEntity {
  String userId;
  String email;
  String name;
  String password;
  bool hasActiveCart;
  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.password,
    this.hasActiveCart = false,
  });
  static final empty = MyUserEntity(
    userId: '',
    email: '',
    name: '',
    password: '',
    hasActiveCart: false,
  );

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'password': password,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      password: doc['password'] as String,
      hasActiveCart: doc['hasActiveCart'] as bool,
    );
  }
}
