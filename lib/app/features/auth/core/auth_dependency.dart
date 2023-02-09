import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/data/repo/auth_repo.dart';
import 'package:demo_gallery/app/features/auth/data/repo/firebase_auth_repo.dart';
import 'package:demo_gallery/app/features/gallery/data/datasource/gallery_api.dart';
import 'package:demo_gallery/app/features/gallery/data/repo/gallery_repo.dart';
import 'package:demo_gallery/core/dio/dio_module.dart';

void injectAuthModule(){
  getIt
    ..registerLazySingleton<FireBaseAuthRepo>(FireBaseAuthRepo.new)
    ..registerLazySingleton<AuthRepo>(AuthRepo.new);
}
