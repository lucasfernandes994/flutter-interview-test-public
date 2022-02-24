import 'package:get_it/get_it.dart';
import 'package:infra/drivers/http_driver.dart';
import 'package:infra/drivers/http_driver_impl.dart';

class InfraModule {
  static void setup(GetIt locator) {
    locator.registerSingleton<HttpDriver>(HttpDriverImpl());
  }
}
