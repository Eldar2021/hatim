import 'package:hatim/core/core.dart';

import 'package:hatim/models/models.dart';

class AuthService {
  const AuthService(this.storage);

  final AppCache<String> storage;

  static const String _token = 'token';
  static const String _gender = 'gender';
  static const String _totalHatim = 'total_hatim';
  static const String _totalRead = 'total_read';

  User? init() {
    final userToken = storage.read(key: _token);
    final userGender = storage.read(key: _gender);
    if (userToken != null && userGender != null) {
      return User(token: token, gender: userGender == Gender.male.name ? Gender.male : Gender.female);
    } else {
      return null;
    }
  }

  Future<void> login(User user) async {
    await storage.save(key: _token, value: user.token);
    await storage.save(key: _gender, value: user.gender.name);
  }

  Future<void> changeGender(Gender gender) async {
    await storage.save(key: _gender, value: gender.name);
  }

  int? getTotalHatim() {
    final value = storage.read(key: _totalHatim);
    return value != null ? int.parse(value) : null;
  }

  int? getTotalRead() {
    final value = storage.read(key: _totalRead);
    return value != null ? int.parse(value) : null;
  }

  Future<void> saveTotalHatim(String value) async {
    await storage.save(key: _totalHatim, value: value);
  }

  Future<void> saveTotalRead(String value) async {
    await storage.save(key: _totalRead, value: value);
  }

  Future<void> logout() async => storage.clear();

  String get token => _token;
  String get gender => _gender;
  String get totalHatim => _totalHatim;
  String get totalRead => _totalRead;
}
