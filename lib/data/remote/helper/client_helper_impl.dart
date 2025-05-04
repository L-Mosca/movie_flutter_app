import 'package:movie_flutter_app/data/remote/client/app_client.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';

class ClientHelperImpl implements ClientHelper {
  final AppClient client;

  ClientHelperImpl({required this.client});
}
