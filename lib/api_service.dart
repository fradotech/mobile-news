import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pm6/news_model.dart';

class ApiService {
  String url = "http://10.0.2.2:8000/api/v1/news?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MjM2NzEwMTEsImV4cCI6MTYyMzY3NDYxMSwibmJmIjoxNjIzNjcxMDExLCJqdGkiOiJFZ2Z6R3AxV1lsRlJad0hlIiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.DMyk219joEKTrugn7aZXbr3hwUuOi3JBKQyXDyOTBrU";

  Future<List<Datum>> getArticle() async {
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['data'];

      List<Datum> articles =
      body.map((dynamic item) => Datum.fromMap(item)).toList();

      return articles;
    } else {
      throw ("Can't get the News");
    }
  }
}