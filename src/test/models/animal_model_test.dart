
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:com.example.animal_switcher/models/animal_model.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should be instantiated with name and icon', () {
			final animal = Animal(name: 'Cat', icon: Icons.pets);
			
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.pets);
		});
		
		test('Animal model should correctly serialize to JSON', () {
			final animal = Animal(name: 'Dog', icon: Icons.person);
			final json = animal.toJson();
			
			expect(json, {'name': 'Dog', 'icon': Icons.person.codePoint});
		});
		
		test('Animal model should correctly deserialize from JSON', () {
			final json = {'name': 'Cat', 'icon': Icons.pets.codePoint};
			final animal = Animal.fromJson(json);
			
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.pets);
		});
	});
}
