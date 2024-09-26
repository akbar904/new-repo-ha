
import 'package:flutter/material.dart';
import '../models/animal_model.dart';

abstract class AnimalState {
	final Animal animal;

	AnimalState(this.animal);
}

class CatState extends AnimalState {
	CatState() : super(Animal(name: 'Cat', icon: Icons.access_time));
}

class DogState extends AnimalState {
	DogState() : super(Animal(name: 'Dog', icon: Icons.person));
}
