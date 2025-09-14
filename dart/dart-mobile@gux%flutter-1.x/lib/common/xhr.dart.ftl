<#if license??>
${dart.license(license)}
</#if>
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'error.dart';

const HOST = 'http://192.168.0.207:8810';

Future<Map<String,dynamic>> post(String url, Object params) async {
  final uri = Uri.parse(HOST + url);
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(params),
  );
  if (response.statusCode == 200) {
    Map body = jsonDecode(response.body);
    if (body["code"] == 200) {
      return {
        'total': body['total'],
        'data': body['data'],
      };
    } else {
      throw ${dart.nameType(app.name)}Exception(
        code: body['code'], 
        message: body['message'],
      );
    }
  } else {
    throw ${dart.nameType(app.name)}Exception(
      code: response.statusCode, 
      message: 'http request error',
    );
  }
}

Future<Map<String,dynamic>> get(String url, Map<String,dynamic> params) async {
  String urlWithParams = url;
  params.forEach((key, value) {
    if (urlWithParams.contains('?')) {
      urlWithParams += '&$key=$value';
    } else {
      urlWithParams += '?$key=$value';
    }
  });
  final uri = Uri.parse(HOST + urlWithParams);
  final response = await http.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    Map body = jsonDecode(response.body);
    if (body["code"] == 200) {
      return body["data"];
    } else {
      throw ${dart.nameType(app.name)}Exception(
        code: body['code'], 
        message: body['message'],
      );
    }
  } else {
    throw ${dart.nameType(app.name)}Exception(
      code: response.statusCode, 
      message: 'http request error',
    );
  }
}

Future<Map<String,dynamic>> put(String url, Object params) async {
  final uri = Uri.parse(HOST + url);
  final response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(params),
  );
  if (response.statusCode == 200) {
    Map body = jsonDecode(response.body);
    if (body["code"] == 200) {
      return body["data"];
    } else {
      throw ${dart.nameType(app.name)}Exception(
        code: body['code'], 
        message: body['message'],
      );
    }
  } else {
    throw ${dart.nameType(app.name)}Exception(
      code: response.statusCode, 
      message: 'http request error',
    );
  }
}

Future<Map<String,dynamic>> patch(String url, Object params) async {
  final uri = Uri.parse(HOST + url);
  final response = await http.patch(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(params),
  );
  if (response.statusCode == 200) {
    Map body = jsonDecode(response.body);
    if (body["code"] == 200) {
      return body["data"];
    } else {
      throw ${dart.nameType(app.name)}Exception(
        code: body['code'], 
        message: body['message'],
      );
    }
  } else {
    throw ${dart.nameType(app.name)}Exception(
      code: response.statusCode, 
      message: 'http request error',
    );
  }
}

Future<Map<String,dynamic>> delete(String url, Object params) async {
  final uri = Uri.parse(HOST + url);
  final response = await http.delete(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(params),
  );
  if (response.statusCode == 200) {
    Map body = jsonDecode(response.body);
    if (body["code"] == 200) {
      return body["data"];
    } else {
      throw ${dart.nameType(app.name)}Exception(
        code: body['code'], 
        message: body['message'],
      );
    }
  } else {
    throw ${dart.nameType(app.name)}Exception(
      code: response.statusCode, 
      message: 'http request error',
    );
  }
}

