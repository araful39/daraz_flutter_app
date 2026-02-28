import 'package:daraz_app/provider/forget_password_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<ForgetPasswordProvider>(
    create: ((context) => ForgetPasswordProvider()),
  ),
];
