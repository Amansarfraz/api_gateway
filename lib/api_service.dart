import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000"));

  String? token;

  // ✅ SIGNUP (form-data)
  Future signup(String username, String password) async {
    return await dio.post(
      "/signup",
      data: {"username": username, "password": password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
  }

  // ✅ LOGIN (form-data)
  Future login(String username, String password) async {
    final res = await dio.post(
      "/signin",
      data: {"username": username, "password": password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    token = res.data["access_token"];
    return token;
  }

  // ✅ Common GET with JWT
  Future get(String path) async {
    return await dio.get(
      path,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }
}

final apiService = ApiService();
