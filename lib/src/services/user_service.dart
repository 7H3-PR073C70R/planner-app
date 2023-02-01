// ignore_for_file: lines_longer_than_80_chars

class UserService {
  factory UserService() {
    return _userService;
  }

  UserService._internal();

  static const token =
      '<token>';

  static const refreshToken = 'APJWN8epiyeomPzi8izwFaFBxfNk2aoDe0H98EOS6llu38e18vDhSSIRxZ3MSWcf7P7pjYLZGDohDGr4DfVALRwDl9USLnYVStlWlbgqiP8w-FMzq-F-9oNz7iqMyDh4Loc4HTByAJhIlZ1fLgS20j_0H-wxwkOH73zvPgEps8bg9aJLpS4J3XuPTSHXrmVnco7nKYkkvWNYfpoGRTCRmLyMA13vMK7AcQ';

  static final UserService _userService = UserService._internal();

  Map<String, dynamic> get header => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
