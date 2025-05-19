import 'package:krap/feature/main/dto/save_link_request.dart';
import 'package:krap/feature/main/dto/save_link_response.dart';
import 'package:krap/feature/main/tabs/home/repository/home_api.dart';
import 'package:krap/feature/main/tabs/home/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi api;

  HomeRepositoryImpl(this.api);

  @override
  Future<SaveLinkResponse> saveLink(
    int userId,
    SaveLinkRequest saveLinkRequest,
  ) {
    return api.saveLink(userId, saveLinkRequest);
  }
}
