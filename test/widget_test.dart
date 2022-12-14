import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import 'package:hatim/app/app.dart';
import 'package:hatim/core/core.dart';

import 'helpers/helpers.dart';

class MockBox extends Mock implements Box<String> {}

// flutter test

void main() {
  testWidgets('Punmp app', (WidgetTester tester) async {
    final box = MockBox();
    final appCache = AppCache(box);
    final localService = AppService(appCache);
    final authStorage = AuthService(appCache);
    final themeService = ThemeService(appCache);

    when(() => box.get(authStorage.token)).thenReturn(null);
    when(() => box.get(authStorage.gender)).thenReturn(null);
    when(() => box.get(localService.localStorageLocaleKey)).thenReturn('en');
    when(() => box.get(themeService.modeKey)).thenReturn(null);
    when(() => box.get(themeService.colorKey)).thenReturn(null);

    // // Build our app and trigger a frame.
    await tester.pumpApp(localService, themeService, authStorage);
    await tester.pumpAndSettle();
    expect(find.text('English'), findsOneWidget);
  });
}
