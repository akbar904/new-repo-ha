
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/main.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('Main Application', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('App starts with MyApp widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(MyApp), findsOneWidget);
		});

		testWidgets('MaterialApp is created and contains HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (_) => animalCubit,
					child: MyApp(),
				),
			);
			expect(find.byType(MaterialApp), findsOneWidget);
			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('Initial state is CatState with corresponding text and icon', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(CatState());
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (_) => animalCubit,
					child: MyApp(),
				),
			);
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.pets), findsOneWidget);
		});

		testWidgets('Tapping text toggles to DogState with corresponding text and icon', (WidgetTester tester) async {
			whenListen(
				animalCubit,
				Stream.fromIterable([CatState(), DogState()]),
				initialState: CatState(),
			);

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (_) => animalCubit,
					child: MyApp(),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
