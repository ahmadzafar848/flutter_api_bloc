import 'package:bloc_api_practice/api_services/app_api_service.dart';
import 'package:bloc_api_practice/models/UserModel.dart';

class UserRepository {
  final userApiService = UserApiService();
  Future<List<UserModel>> fetchUsersData() async {
    return await userApiService.fetchData();
  }
}
