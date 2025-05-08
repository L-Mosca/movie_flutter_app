import 'package:movie_flutter_app/domain/models/user/register_body.dart';

abstract interface class ClientHelper {
  Future<String> signUp({required RegisterBody body});
}
