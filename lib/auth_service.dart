class AuthService {
  // Simulasi database user
  static final Map<String, String> _users = {};

  static bool register(String name, String password) {
    if (_users.containsKey(name)) {
      return false; // sudah ada user dengan nama sama
    }
    _users[name] = password;
    return true;
  }

  static bool login(String name, String password) {
    return _users[name] == password;
  }
}
