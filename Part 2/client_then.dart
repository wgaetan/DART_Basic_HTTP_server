import 'dart:io';
import 'dart:convert';

void main() async{
  HttpClient client = new HttpClient();
  final String host = InternetAddress.loopbackIPv4.address;
  final int port = 4040;

  try {
    client.get(host, port, '').then((HttpClientRequest request){
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) => print(contents));
    });
  } catch(e) {
    print(e);
  }
  client.close;
}
