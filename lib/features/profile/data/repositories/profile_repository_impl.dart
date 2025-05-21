import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource remoteDatasource;

  ProfileRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Profile> getProfile() async {
    try {
      final ProfileModel model = await remoteDatasource.getProfile();
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
