import 'dart:math';

import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:faker/faker.dart';

List<Pessoa> gerarPessoas(int quantidade) {
  final faker = Faker();
  return List.generate(
    quantidade,
    (index) => Pessoa(
      id: index,
      nome: faker.person.name(),
      altura: Random().nextInt(200),
      peso: faker.randomGenerator.decimal(min: 50, scale: 50),
    ),
  );
}
