import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000"));

  String? token;

  void setToken(String t) {
    token = t;
  }

  Future login(String username, String password) async {
    final res = await dio.post(
      "/signin",
      data: {"username": username, "password": password},
    );
    token = res.data["access_token"];
    return token;
  }

  Future getProtected() async {
    return dio.get(
      "/protected",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future getAdmin() async {
    return dio.get(
      "/admin-area",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future getUser() async {
    return dio.get(
      "/user-area",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future getProxy() async {
    return dio.get(
      "/proxy",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future getRateLimited() async {
    return dio.get(
      "/rate-limited",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }
}

final apiService = ApiService();
