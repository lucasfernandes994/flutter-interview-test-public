import 'package:core/di/module.dart';
import 'package:data/di/module.dart';
import 'package:domain/di/module.dart';
import 'package:get_it/get_it.dart';
import 'package:infra/di/module.dart';
import 'package:presentation/di/module.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  InfraModule.setup(locator);
  DataModule.setup(locator);
  DomainModule.setup(locator);
  CoreModule.setup(locator);
  PresentationModule.setup(locator);
}
