import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_repository/src/models/models.dart';
import 'package:user_repository/src/user_repo.dart';

/// Simple API-based implementation of [UserRepository] replacing Firebase.
/// NOTE: Replace endpoint URLs with your real backend routes.
class ApiUserRepo implements UserRepository {
  final String baseUrl;
  final http.Client _client;
  final _controller = StreamController<MyUser?>.broadcast();
  MyUser? _current;
  String? _authToken; // store token if backend returns one

  ApiUserRepo({
    http.Client? client,
    this.baseUrl = 'https://api.example.com',
  }) : _client = client ?? http.Client() {
    // Emit empty user initially
    _controller.add(MyUser.empty);
  }

  @override
  Stream<MyUser?> get user => _controller.stream;

  @override
  Future<MyUser> signUp(MyUser user, String password) async {
    final uri = Uri.parse('$baseUrl/auth/signup');
    try {
      final resp = await _client.post(
        uri,
        headers: _headers(),
        body: jsonEncode({
          'email': user.email,
          'name': user.name,
          'password': password,
        }),
      );
      _throwIfBad(resp, 'Sign up failed');
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      // Expect backend returns userId and maybe token
      user.userId = data['userId'] as String? ?? '';
      _authToken = data['token'] as String?; // optional
      _setCurrent(user);
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    final uri = Uri.parse('$baseUrl/auth/login');
    try {
      final resp = await _client.post(
        uri,
        headers: _headers(),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      _throwIfBad(resp, 'Login failed');
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      final user = MyUser(
        userId: data['userId'] as String? ?? '',
        email: data['email'] as String? ?? email,
        name: data['name'] as String? ?? '',
        hasActiveCart: data['hasActiveCart'] as bool? ?? false,
      );
      _authToken = data['token'] as String?; // optional
      _setCurrent(user);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    if (user.userId.isEmpty) return; // nothing to persist yet
    final uri = Uri.parse('$baseUrl/users/${user.userId}');
    try {
      final resp = await _client.put(
        uri,
        headers: _headers(),
        body: jsonEncode({
          'email': user.email,
          'name': user.name,
          'hasActiveCart': user.hasActiveCart,
        }),
      );
      _throwIfBad(resp, 'Update user failed');
      _setCurrent(user);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    // Optionally call logout endpoint
    _authToken = null;
    _setCurrent(MyUser.empty);
  }

  void _setCurrent(MyUser user) {
    _current = user;
    _controller.add(_current);
  }

  Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        if (_authToken != null) 'Authorization': 'Bearer $_authToken',
      };

  void _throwIfBad(http.Response resp, String message) {
    if (resp.statusCode >= 400) {
      throw Exception('$message (status ${resp.statusCode}): ${resp.body}');
    }
  }

  void dispose() {
    _controller.close();
    _client.close();
  }
}
