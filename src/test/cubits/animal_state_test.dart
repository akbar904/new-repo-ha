
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_state.dart';

void main() {
	group('AnimalState', () {
		test('CatState is a subclass of AnimalState', () {
			expect(CatState(), isA<AnimalState>());
		});

		test('DogState is a subclass of AnimalState', () {
			expect(DogState(), isA<AnimalState>());
		});
	});

	group('CatState', () {
		test('CatState has correct properties', () {
			final state = CatState();
			expect(state.animal.name, 'Cat');
			expect(state.animal.icon, Icons.access_time); // Clock icon for Cat
		});
	});

	group('DogState', () {
		test('DogState has correct properties', () {
			final state = DogState();
			expect(state.animal.name, 'Dog');
			expect(state.animal.icon, Icons.person); // Person icon for Dog
		});
	});
});
