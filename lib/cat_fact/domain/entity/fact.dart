import 'package:equatable/equatable.dart';

class Fact extends Equatable {
  Fact({
    required this.fact,
  });

  factory Fact.empty() => Fact(fact: '');

  final String fact;

  @override
  List<Object> get props => [fact];

  @override
  bool get stringify => true;
}
