import 'package:krap/feature/main/dto/save_link_request.dart';
import 'package:krap/feature/main/dto/save_link_response.dart';

abstract class HomeRepository {
  Future<SaveLinkResponse> saveLink(
    int userId,
    SaveLinkRequest saveLinkRequest,
  );
}
