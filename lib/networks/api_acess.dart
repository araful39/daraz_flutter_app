import 'package:daraz_app/features/home/data/rx.dart';
import 'package:daraz_app/features/home/model/all_product_list_response.dart';
import 'package:daraz_app/features/log_in/data/rx.dart';
import 'package:daraz_app/features/log_in/model/login_response.dart';
import 'package:rxdart/rxdart.dart';

final LoginRx loginRx = LoginRx(
  empty: LoginResposne(),
  dataFetcher: BehaviorSubject<LoginResposne>(),
);
// final GetAllProductRx getAllProductRx = GetAllProductRx(
//   empty: GetAllProductListResposne(),
//   dataFetcher: BehaviorSubject<GetAllProductListResposne>(),
// );
final getAllProductRx = GetAllProductRx();