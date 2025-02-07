import 'dart:convert';
import 'dart:io';
import 'package:driver_app/services/common_memory.dart';
import 'package:driver_app/services/fcm_token_service.dart';
import 'package:driver_app/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpServices {
  int testMobilNumber = 8129706629;
  int testSchoolId = 1;
  final testGenerateOtpUrl =
      Uri.parse('$baseUrl/generate-otp?mobile_number=8129706629&school_id=1');

  // int testMobilNumber = 8891923101;
  // int testSchoolId = 2;
  // final testGenerateOtpUrl =
  //     // Uri.parse('$baseUrl/generate-otp?mobile_number=8129706629&school_id=1');
  //     Uri.parse('$baseUrl/generate-otp?mobile_number=8891923101&school_id=2');

  static const baseUrl = 'https://bluefort.in/nextstop/api';
  // https://bluefort.in/nextstop/api/generate-otp?mobile_number=8129706629&school_id=1

  Future<bool> generateOtp(
      {required String mobileNumber, required int schoolId}) async {
    // return true;
    bool result = false;
    // final url = Uri.parse(
    //     '$baseUrl/generate-otp?mobile_number=$mobileNumber&school_id=${CommonMemory.schoolId}');
    final url = testGenerateOtpUrl;
    try {
      final response = await http.get(url);
      debugPrint("API Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        result = true;
      }
    } on SocketException catch (_) {
      debugPrint(
          "Error fetching OTP: ClientException with SocketException: Failed host lookup: 'bluefort.in' (OS Error: No address associated with hostname, errno = 7), uri=$url");
      result = false;
    } catch (e) {
      debugPrint("Error fetching OTP: $e");
      result = false;
    }
    return result;
    // return true;
  }

  Future<bool> verifyOtp({
    required String mobileNumber,
    required String otp,
  }) async {
    final String url = '$baseUrl/verify-otp';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var fcmToken = await FCMTokenService().getToken();
    final Map<String, dynamic> body = {
      'mobile_number': testMobilNumber,
      // 'mobile_number': mobileNumber,
      'otp': otp,
      'school_id': testSchoolId,
      // 'school_id': CommonMemory.schoolId,
      'fcm_token': fcmToken
    };

    bool result = false;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        result = true;
        // Handle success response
        print('Response: ${response.body}');
        var responseBody = jsonDecode(response.body);
        var jwtToken = responseBody['jwt-token'];
        if (jwtToken != null) {
          LocalStorage().saveJwtToken(jwtToken);
        }
        // var jwtToken = int.parse(responseBody['jwt_token']);
        // String jwtToken =
        // LocalStorage().saveJwtToken(responseBody['jwt_token']);
        // CommonMemory.userId = responseBody['user_id'];
        CommonMemory.userType = 'driver';
      } else {
        // Handle error response
        result = false;
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
      result = false;
    }
    // return result;
    CommonMemory.userType = 'driver';
    return true;
  }

  // Future<void> testNetworkRequest() async {
  //   final String testUrl = 'https://jsonplaceholder.typicode.com/posts';

  //   try {
  //     final response = await http.get(Uri.parse(testUrl));

  //     if (response.statusCode == 200) {
  //       print(
  //           'Test Successful: ${response.body.substring(0, 100)}...'); // Print first 100 characters
  //     } else {
  //       print('Test Failed: ${response.statusCode}, ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Network Test Exception: $e');
  //   }
  // }
}
