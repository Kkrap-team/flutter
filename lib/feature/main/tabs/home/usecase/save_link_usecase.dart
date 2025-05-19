import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/main/dto/save_link_request.dart';
import 'package:krap/feature/main/dto/save_link_response.dart';
import 'package:krap/feature/main/tabs/home/repository/home_repository.dart';

class SaveLinkUsecase {
  SaveLinkUsecase(this._repo);

  final HomeRepository _repo;

  Future<SaveLinkResponse> excute(
    int userId,
    SaveLinkRequest saveLinkRequest,
  ) async {
    AppLogger.d(
      '++SaveLinkUsecase userId = $userId, createFolderRequest = ${saveLinkRequest.toJson()}',
    );
    final response = await _repo.saveLink(userId, saveLinkRequest);
    AppLogger.d('++SaveLinkUsecase response = ${response.toJson()}');
    return response;
  }
}
