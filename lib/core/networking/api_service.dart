import 'package:dio/dio.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Login/data/models/login_request_body.dart';
import 'package:natours_application/Features/Login/data/models/login_response_body.dart';
import 'package:natours_application/Features/Signup/data/models/signup_request_body.dart';
import 'package:natours_application/Features/Signup/data/models/signup_response_body.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
import 'package:natours_application/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstants.signup)
  Future<SignupResponseBody> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
  @GET(ApiConstants.getAllTours)
  Future<ToursResponse> getAllTours();
  @GET(ApiConstants.getMe)
  Future<UserResponseModel> getUserData();
}
