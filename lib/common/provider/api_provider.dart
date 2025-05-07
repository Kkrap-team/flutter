import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/provider/dio_provider.dart';
import 'package:krap/repository/folder/folder_api.dart';

final folderApiProvider = Provider<FolderApi>((ref) {
  final dio = ref.watch(dioProvider);
  return FolderApi(dio);
});

