
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:animal_switcher/widgets/animal_widget.dart';
import 'package:animal_switcher/cubits/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalWidget', () {
		// Mock Cubit
		late MockAnimalCubit mockAnimalCubit;

		setUp(() {
			mockAnimalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat with clock icon when state is CatState', (WidgetTester tester) async {
			// Arrange
			when(() => mockAnimalCubit.state).thenReturn(CatState());

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalWidget(),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
			expect(find.byIcon(Icons.person), findsNothing);
			expect(find.text('Dog'), findsNothing);
		});

		testWidgets('displays Dog with person icon when state is DogState', (WidgetTester tester) async {
			// Arrange
			when(() => mockAnimalCubit.state).thenReturn(DogState());

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalWidget(),
					),
				),
			);

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsNothing);
			expect(find.text('Cat'), findsNothing);
		});
	});
}
