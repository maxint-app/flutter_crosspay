import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(requireEnvFile: true, path: '.env')
abstract class Env {
    @EnviedField(varName: 'CROSSPAY_PUBLIC_KEY')
    static const String crosspayPublicKey = _Env.crosspayPublicKey;

    @EnviedField(varName: 'CROSSPAY_API_URL')
    static const String crosspayApiUrl = _Env.crosspayApiUrl;
}