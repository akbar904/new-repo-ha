
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/screens/home_screen.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/cubits/animal_state.dart';
import 'package:animal_switcher/widgets/animal_widget.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat text with clock icon initially', (WidgetTester tester) async {
			whenListen(animalCubit, Stream.fromIterable([CatState()]), initialState: CatState());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog text with person icon when state is DogState', (WidgetTester tester) async {
			whenListen(animalCubit, Stream.fromIterable([DogState()]), initialState: DogState());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('toggles between Cat and Dog when text is clicked', (WidgetTester tester) async {
			final states = [CatState(), DogState(), CatState()];
			whenListen(animalCubit, Stream.fromIterable(states), initialState: CatState());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);

			await tester.tap(find.text('Dog'));
			await tester.pump();
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
	});
}
