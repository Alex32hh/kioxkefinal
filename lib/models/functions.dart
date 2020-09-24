
import 'package:http/http.dart' as http;
import 'dart:convert';



  Future<List<dynamic>> fetchBooks() async {
    var result = await http.get("https://kioxke.000webhostapp.com/?catType=Livros");
    return json.decode(result.body);
  }
   

 


