import 'package:cuponsito_app/app/app.dart';
import 'package:cuponsito_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
