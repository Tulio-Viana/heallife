import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idosos/shared/routes.dart';

class login_services {
  login(String email, String senha) async {
    http.Response response = await http.post(Uri.parse(routes.urlLogin),
        body: json.encode(
          {
            "email": email,
            "Senha": senha,
            "returnSecureToken": true,
          },
        ));
    print(response.body);
  }
}
