import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';

// Mocking the SharedPrefHelper and AppRouters classes
class MockSharedPrefHelper extends Mock implements SharedPrefHelper {}

class MockAppRouters extends Mock implements AppRouters {}

void main() {
  testWidgets('OnBoard screen widgets test', (WidgetTester tester) async {
    // Create mock objects
    final mockSharedPrefHelper = MockSharedPrefHelper();
    final mockAppRouters = MockAppRouters();

    // Mock methods if needed (e.g., return a value for 'isOnBoardingScreenViewed')
    when(mockSharedPrefHelper.isOnBoardingScreenViewed())
        .thenAnswer((_) async => true);

    // Build the app and trigger a frame
    await tester.pumpWidget(
      TripsoApp(
        appRouter: mockAppRouters,
        isOnBoardingViewed: true,
        sharedPrefHelper: mockSharedPrefHelper,
        isUserLogged: false,
      ),
    );

    // Verify that the OnBoard screen is shown and UI elements are present
    expect(find.text('BE\nREADY'),
        findsOneWidget); // Check if welcome text is displayed
    expect(find.text('Sign in'),
        findsOneWidget); // Check if 'Sign in' button is present
    expect(find.text('Sign up'),
        findsOneWidget); // Check if 'Sign up' button is present

    // Simulate tapping the 'Sign in' button and check if the app navigates correctly
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify that navigation happens (You can assert if the app has moved to the next screen)
    verify(mockSharedPrefHelper.setOnBoardingScreenViewed()).called(1);

    // Now pass a valid RouteSettings object instead of null
    final routeSettings = RouteSettings(name: 'signInScreen');
    when(mockAppRouters.generateRoute(routeSettings))
        .thenReturn(MaterialPageRoute(builder: (_) => Container()));

    // Verify if generateRoute is called with a valid RouteSettings
    verify(mockAppRouters.generateRoute(routeSettings)).called(1);
  });

  test('Mock SharedPrefHelper method test', () async {
    final mockSharedPrefHelper = MockSharedPrefHelper();

    // Simulate a method call
    when(mockSharedPrefHelper.isOnBoardingScreenViewed())
        .thenAnswer((_) async => true);

    // Perform the test
    final result = await mockSharedPrefHelper.isOnBoardingScreenViewed();

    // Assert the result
    expect(result, true);
    verify(mockSharedPrefHelper.isOnBoardingScreenViewed()).called(1);
  });
}
