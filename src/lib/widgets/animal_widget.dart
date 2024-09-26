
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/cubits/animal_state.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';

class AnimalWidget extends StatelessWidget {
	const AnimalWidget({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<AnimalCubit, AnimalState>(
			builder: (context, state) {
				if (state is CatState) {
					return GestureDetector(
						onTap: () => context.read<AnimalCubit>().toggleAnimal(),
						child: Row(
							children: const [
								Text('Cat'),
								Icon(Icons.access_time),
							],
						),
					);
				} else if (state is DogState) {
					return GestureDetector(
						onTap: () => context.read<AnimalCubit>().toggleAnimal(),
						child: Row(
							children: const [
								Text('Dog'),
								Icon(Icons.person),
							],
						),
					);
				} else {
					return Container();
				}
			},
		);
	}
}
