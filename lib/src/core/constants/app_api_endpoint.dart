/// All the endpoint used in this project are to be declared
/// in this class.
///
/// Example
///
/// static Uri authUrl =
///  Uri(scheme: 'https', host: 'endpoint.com', path: '/api/v1/auth')
class AppApiEndpoint {
  const AppApiEndpoint._();
  static const String scheme = 'https';
  static const String host = 'firestore.googleapis.com';
  static const int receiveTimeout = 50000;
  static const int sendTimeout = 50000;

  static const _extension =
      'v1/projects/applaudo-todo-app/databases/(default)/documents';

  static const apiKey = '<key>';

  static Uri baseUri = Uri(scheme: scheme, host: host, path: _extension);

  static Uri categories =
      baseUri.replace(path: '$_extension/categories');

  static Uri task = baseUri.replace(path: '$_extension/tasks');

  static Uri updateTask(String id) => baseUri.replace(
    path: '$_extension/tasks/id?key=$apiKey',
  );
}
