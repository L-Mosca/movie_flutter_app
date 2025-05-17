import 'package:movie_flutter_app/data/dto/login/login_body_dto.dart';
import 'package:movie_flutter_app/data/dto/register/register_body_dto.dart';
import 'package:movie_flutter_app/data/dto/register/register_response_dto.dart';
import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/data/remote/client/api_constants.dart';
import 'package:movie_flutter_app/data/remote/client/app_client.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';

class ClientHelperImpl implements ClientHelper {
  final AppClient client;
  final PreferencesHelper preferencesHelper;

  ClientHelperImpl({required this.client, required this.preferencesHelper});

  @override
  Future<String> signUp({required RegisterBody body}) async {
    final bodyDto = RegisterBodyDto.build(body);
    final response = await client.post(
      url: ApiConstants.signUpUrl,
      body: bodyDto.toJson(),
      headers: await _buildDefaultHeader(),
    );
    final data = RegisterResponseDto.fromJson(response);
    return data.accessToken!;
  }

  @override
  Future<String> signIn({required LoginBody body}) async {
    final bodyDto = LoginBodyDto.build(body);
    final response = await client.post(
      url: ApiConstants.signInUrl,
      body: bodyDto.toJson(),
      headers: await _buildDefaultHeader(),
    );
    final data = RegisterResponseDto.fromJson(response);
    return data.accessToken!;
  }

  @override
  Future<MovieDetails?> getMovieById({required int id}) async {
    final response = await client.get(
      url: "${ApiConstants.getMovie}$id",
      headers: await _buildDefaultHeader(),
    );

    return MovieDetails();
  }

  Future<Map<String, String>> _buildDefaultHeader() async {
    final language = await preferencesHelper.getLocale();
    //final user = await preferencesHelper.getUser();

    return {
      ApiConstants.languageHeader: language?.getLanguageCode() ?? "pt",
      ApiConstants.tokenHeader: "",
    };
  }
}
