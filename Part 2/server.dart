import 'dart:io';
import 'dart:convert';

void handleGet(HttpRequest request) {
  request.response
    ..encoding = Encoding.getByName("utf-8") //Specify to the client how the response is encoded
    ..statusCode = HttpStatus.ok //Signal that everything goes well while treating the request
    ..write("GET request received !")
    ..close();
}

void handleRequest(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGet(request);
    } else {
      request.response
        ..statusCode = HttpStatus.methodNotAllowed //Signal that something failed while treating the request
        ..write("Unsupported request: ${request.method}.")
        ..close();
    }
  } catch(e) {
    print("Exception in handleRequest: ${e}");
  }
  print("Request handled.");
}

void main() async {
  final InternetAddress host = InternetAddress.loopbackIPv4;
  final int port = 4040;

  var server = await HttpServer.bind(host, port);
  print('Listening on localhost:${server.port}');
  await for (var request in server) {
   handleRequest(request);
  }
}
