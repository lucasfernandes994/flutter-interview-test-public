clean:
	flutter clean

lint:
	dart analyze

unit-tests:
	flutter test ./packages/domain/test/lib/*/*_test.dart
	flutter test ./packages/presentation/test/lib/*/*_test.dart
	flutter test ./packages/core/test/lib/*/*_test.dart
	# flutter test ./packages/data/test/*/*_test.dart

get-dependencies:
	flutter pub get ./packages/domain
	flutter pub get ./packages/presentation
	flutter pub get ./packages/core
	flutter pub get ./packages/data
	flutter pub get ./packages/infra