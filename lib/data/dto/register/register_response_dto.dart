class RegisterResponseDto {
  String? accessToken;

  RegisterResponseDto({this.accessToken});

  @override
  String toString() {
    return 'RegisterResponseDto{accessToken: $accessToken}';
  }

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    accessToken = json["accessToken"];
  }
}