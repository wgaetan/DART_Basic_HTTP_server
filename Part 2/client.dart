import 'dart:io';
import 'dart:convert';

void main() async{
  HttpClient client = new HttpClient();
  final String host = InternetAddress.loopbackIPv4.address;
  final int port = 4040;

  try {
    HttpClientRequest request = await client.get(host, port, '');
    HttpClientResponse response = await request.close();
    response.transform(utf8.decoder).listen((contents) => print(contents));
  } catch(e) {
    print(e);
  }
  client.close;
}
