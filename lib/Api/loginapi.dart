import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://localhost:3000/api/auth/login/'; // Remove /login from here

  Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'), // Provide the endpoint here
      body: {'email': email, 'password': password},
    );
    return response;
  }
}
