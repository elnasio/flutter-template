import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../endpoints/profile_endpoint.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final Dio dio;

  ProfileRemoteDatasourceImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(ProfileEndpoint.me);
      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw AppException(
        e.message ?? 'Terjadi kesalahan jaringan',
        code: e.response?.statusCode,
      );
    } catch (_) {
      throw AppException('Terjadi kesalahan tidak diketahui');
    }
  }
}
