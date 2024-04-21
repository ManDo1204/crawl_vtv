class AuthData {
  String refresh;
  String access;

  AuthData({required this.refresh, required this.access});

  void get_data(String access_token){
    access = access_token;
  }

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'refresh': String refresh,
        'access': String access,
      } =>
        AuthData(
          refresh: refresh,
          access: access,
        ),
      _ => throw const FormatException('Failed to parse auth data.'),
    };
  }
}