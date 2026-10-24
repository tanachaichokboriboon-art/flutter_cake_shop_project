import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_list_ui.dart';

void main() {
  testWidgets('shop details show data for the selected shop', (
    WidgetTester tester,
  ) async {
    final launchChannel = const MethodChannel('plugins.flutter.io/url_launcher');
    final launchedUrls = <String>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(launchChannel, (call) async {
          launchedUrls.add((call.arguments as Map)['url'] as String);
          return true;
        });
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(launchChannel, null),
    );

    await tester.pumpWidget(
      MaterialApp(home: CakeShopListUi()),
    );

    await tester.tap(find.text('Yellow Spoon Pastry'));
    await tester.pumpAndSettle();

    expect(find.text('Yellow Spoon Pastry'), findsNWidgets(2));
    expect(find.text('0854822842'), findsOneWidget);
    expect(
      find.text('โครงการเอกมัย คอมเพล็กซ์ (ระหว่างเอกมัย 19 และ 21)'),
      findsOneWidget,
    );
    expect(find.text('ทุกวัน 10.00-20.00 น.'), findsOneWidget);
    expect(find.text('https://www.yellowspoonpastry.com/'), findsOneWidget);

    await tester.tap(find.text('0854822842'));
    await tester.pump();
    await tester.tap(find.text('https://www.yellowspoonpastry.com/'));
    await tester.pump();
    await tester.tap(find.text('https://www.facebook.com/yspastry'));
    await tester.pump();

    expect(launchedUrls, [
      'tel:0854822842',
      'https://www.yellowspoonpastry.com/',
      'https://www.facebook.com/yspastry',
    ]);

    await tester.tap(find.byIcon(Icons.arrow_back_ios));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Vista Cafe by Verasu'));
    await tester.pumpAndSettle();

    expect(find.text('Vista Cafe by Verasu'), findsNWidgets(2));
    expect(find.text('022548100'), findsOneWidget);
    expect(find.text('อาคารวีรสุ ถนนวิทยุ'), findsOneWidget);
    expect(find.text('ทุกวัน 09.00-19.00 น'), findsOneWidget);
    expect(find.text('http://vistacafe.co.th'), findsOneWidget);
    expect(find.text('Yellow Spoon Pastry'), findsNothing);
  });
}
