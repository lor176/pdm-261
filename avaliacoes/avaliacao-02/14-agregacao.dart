import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  Dependente dep1 = Dependente('Maria Silva');
  Dependente dep2 = Dependente('Joao Silva');
  Dependente dep3 = Dependente('Ana Souza');

  Funcionario func1 = Funcionario('Carlos Pereira', []);
  Funcionario func2 = Funcionario('Fernanda Costa', []);

  func1 = Funcionario('Carlos Pereira', [dep1, dep2]);
  func2 = Funcionario('Fernanda Costa', [dep3]);

  List<Funcionario> funcionarios = [func1, func2];

  EquipeProjeto equipe = EquipeProjeto('Sistema de Vendas', funcionarios);

  print(jsonEncode(equipe.toJson()));
}
