// ignore_for_file: lines_longer_than_80_chars

class UserService {
  factory UserService() {
    return _userService;
  }

  UserService._internal();

  static const token =
      'eyJhbGciOiJSUzI1NiIsImtpZCI6ImQwNWI0MDljNmYyMmM0MDNlMWY5MWY5ODY3YWM0OTJhOTA2MTk1NTgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYXBwbGF1ZG8tdG9kby1hcHAiLCJhdWQiOiJhcHBsYXVkby10b2RvLWFwcCIsImF1dGhfdGltZSI6MTY3NTI3MTM2MSwidXNlcl9pZCI6IllWM1BkRTRlenZkcUl3dlU5RGVFdFhXZDN4QzMiLCJzdWIiOiJZVjNQZEU0ZXp2ZHFJd3ZVOURlRXRYV2QzeEMzIiwiaWF0IjoxNjc1MjcxMzYxLCJleHAiOjE2NzUyNzQ5NjEsImVtYWlsIjoidGVzdEB0ZXN0LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0QHRlc3QuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.Rxh5tondy7AvKMBXIMCoxuSPoHj2EzrCznoYYPPd-osJKh2faVhDR5D_xzJ4PeBOvt6nfnUyMuKzLp1KSl2VQ_RMqjOs15h2l3EFf52ALHBvfcFrvocprWqbp0fnKkpL6gg5NeL5oIEEs4T8Te2_ECkTfyB0lvAyJsCQDe-DTO0WwBjjB0Qlg92ryI0yJUlqd2StiDE0Q-9VW3SFYoCbi3rPqztf4MxakWM1unuxra6pu0xgJbKD0E0oj5Xn9Afj11v-w7oWukoW2qFOpOia2AO5z9TkI0GP6JsPH1OT67xrmNvSjOmBZluvl3a2VTQbVFaAk6PNKQ4-gs-QPbAy-g';

  static const refreshToken = 'APJWN8epiyeomPzi8izwFaFBxfNk2aoDe0H98EOS6llu38e18vDhSSIRxZ3MSWcf7P7pjYLZGDohDGr4DfVALRwDl9USLnYVStlWlbgqiP8w-FMzq-F-9oNz7iqMyDh4Loc4HTByAJhIlZ1fLgS20j_0H-wxwkOH73zvPgEps8bg9aJLpS4J3XuPTSHXrmVnco7nKYkkvWNYfpoGRTCRmLyMA13vMK7AcQ';

  static final UserService _userService = UserService._internal();

  Map<String, dynamic> get header => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
