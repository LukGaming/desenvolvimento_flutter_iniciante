class Pessoa {
  final String id;
  final String nome;
  final int altura;
  final double peso;

  const Pessoa({
    required this.id,
    required this.nome,
    required this.altura,
    required this.peso,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      id: json["id"],
      nome: json["nome"],
      altura: json["altura"],
      peso: json["peso"],
    );
  }
}
