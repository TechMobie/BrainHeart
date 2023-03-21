import 'package:brain_heart/helper/utils/pref_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class ApiMethodType {
  static const String post = "POST";
  static const String patch = "PATCH";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
}

class ApiService {
  static Future getRequest(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.get, params: query);
  }

  static Future postRequest(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.post, params: body);
  }

  static Future patchRequest(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.patch, params: body);
  }

  static Future putRequest(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.put, params: body);
  }

  static Future deleteRequest(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    return await ApiServiceMethods()
        .makeApiCall(endpoint, ApiMethodType.delete, params: query);
  }
}

class ApiServiceMethods extends GetConnect {
  Future getRequest(String endpoint, {Map<String, dynamic>? query}) async {
    return await makeApiCall(endpoint, ApiMethodType.get, params: query);
  }

  Future postRequest(String endpoint, {Map<String, dynamic>? body}) async {
    return await makeApiCall(endpoint, ApiMethodType.post, params: body);
  }

  Future patchRequest(String endpoint, {Map<String, dynamic>? body}) async {
    return await makeApiCall(endpoint, ApiMethodType.post, params: body);
  }

  Future putRequest(String endpoint, {Map<String, dynamic>? body}) async {
    return await makeApiCall(endpoint, ApiMethodType.put, params: body);
  }

  Future deleteRequest(String endpoint, {Map<String, dynamic>? query}) async {
    return await makeApiCall(endpoint, ApiMethodType.delete, params: query);
  }

  Future makeApiCall(
    String baseUrl,
    String method, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    //For charles proxy
    Response response = const Response();
    // String proxy = '192.168.29.143:8888';
    // HttpClient httpClients = HttpClient();
    // httpClients.findProxy = (uri) {
    //   return "PROXY $proxy;";
    // };

    httpClient.timeout = const Duration(seconds: 30);
    httpClient.addRequestModifier<dynamic>((request) async {
      if (PrefUtils.getInstance.isUserLogin()) {
        request.headers["Authorization"] = PrefUtils.getInstance.readData(
          PrefUtils.getInstance.accessToken,
        );
        if (kDebugMode) {
          print(
              "-------------- token ------------- ${request.headers["Authorization"] = PrefUtils.getInstance.readData(
            PrefUtils.getInstance.accessToken,
          )}");
        }
      } else {
        request.headers["Content-Type"] = "application/json";
      }
      return request;
    });

    if (method == ApiMethodType.post) {
      response = await post(
        baseUrl,
        params,
      );
    } else if (method == ApiMethodType.get) {
      response = await get(
        baseUrl,
        query: params,
      );
    } else if (method == ApiMethodType.patch) {
      response = await patch(
        baseUrl,
        params,
      );
    } else if (method == ApiMethodType.put) {
      response = await put(
        baseUrl,
        params,
      );
    } else if (method == ApiMethodType.delete) {
      response = await delete(
        baseUrl,
        query: params,
      );
    }
    int statusCode = response.body?['code'] ?? 0;
    String message = response.body?['message'] ?? "";
    bool isVerify = true;
    isVerify = response.body?['emailVerified'] ?? false;

    if ((statusCode ==200 ||
        statusCode == 201)) {
      return response.body;
    } else if (response.body is List<Map<String, dynamic>>) {
      return response.body;
    } else if (response.statusCode == 403) {
    } else {
      throw [statusCode.toString(), message, isVerify];
    }
  }
}
