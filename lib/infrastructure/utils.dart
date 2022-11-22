import 'dart:io';

String apiKey = 'ad70b1a0982af1b93f36caa498f9bf91';
String baseUrlData = 'https://api.themoviedb.org/3/movie';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
