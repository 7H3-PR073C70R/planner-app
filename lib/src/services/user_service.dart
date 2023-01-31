// ignore_for_file: lines_longer_than_80_chars

class UserService {
  factory UserService() {
    return _userService;
  }

  UserService._internal();

  static const token =
      'eyJhbGciOiJSUzI1NiIsImtpZCI6ImQwNWI0MDljNmYyMmM0MDNlMWY5MWY5ODY3YWM0OTJhOTA2MTk1NTgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYXBwbGF1ZG8tdG9kby1hcHAiLCJhdWQiOiJhcHBsYXVkby10b2RvLWFwcCIsImF1dGhfdGltZSI6MTY3NTE4NTcxNiwidXNlcl9pZCI6IllWM1BkRTRlenZkcUl3dlU5RGVFdFhXZDN4QzMiLCJzdWIiOiJZVjNQZEU0ZXp2ZHFJd3ZVOURlRXRYV2QzeEMzIiwiaWF0IjoxNjc1MTg1NzE2LCJleHAiOjE2NzUxODkzMTYsImVtYWlsIjoidGVzdEB0ZXN0LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0QHRlc3QuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.baUSe24wEf1YkvV3_ymFPEurUOnVb-8oKbJknj-0d7ZcViRS9UT3LfJHdHuoy_PmLHGrV6HSaWZPX5q4Jgy4rgWE2AY06AvpOZN1QD1zZvaVmGOZOu6ZDmmaGq7-j1oGrY5h6JROcSL5L2t2IfsweXTvL0MGjNWeQR-RGb-i5Yb7Y-5TYd8E-Gy31RKi8DDSrhMyEPs1OunoC1jtAQEhn_DLz8wwnbgWj0-_DiKXlUCXjS9nDHDoI7kyPtEXgRrynOwR2ukkgrzUiBzm8pLXhTndAorbNi66M0LPM0cA-1wlMx3K6GdcYVRivBpHcdlkd0-SWd0Doc67WFmu0JvWGA';

  static const refreshToken = 'APJWN8epiyeomPzi8izwFaFBxfNk2aoDe0H98EOS6llu38e18vDhSSIRxZ3MSWcf7P7pjYLZGDohDGr4DfVALRwDl9USLnYVStlWlbgqiP8w-FMzq-F-9oNz7iqMyDh4Loc4HTByAJhIlZ1fLgS20j_0H-wxwkOH73zvPgEps8bg9aJLpS4J3XuPTSHXrmVnco7nKYkkvWNYfpoGRTCRmLyMA13vMK7AcQ';

  static final UserService _userService = UserService._internal();

  Map<String, dynamic> get header => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
