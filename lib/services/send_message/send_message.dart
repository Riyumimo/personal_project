import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageEvent {
  void sendMessage(String message) async {
    String accountSid = 'AC70335b3e342f1d87d98857af93b267de';
    String authToken = '88a2a1c69f97594f4f230ec6f83445d6';

    String url =
        'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
    };

    Map<String, dynamic> body = {
      'To': 'whatsapp:+6285269731745',
      'From': 'whatsapp:+14155238886',
      'Body': message,
    };
    try {
      Uri uri = Uri.parse(url);
      var response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 201) {
        print('Pesan berhasil terkirim!');
      } else {
        print('Gagal mengirim pesan. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
  }
}
