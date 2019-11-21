import 'package:json_annotation/json_annotation.dart';

part 'generated/user.g.dart';

@JsonSerializable()
class User {
  int id;
  String dni;
  String nombre_usuario;
  String passwd;
  String nombre_completo;
  String correo_electronico;
  String fecha_nacimiento;
  String direccion;
  Object pedidos;

  User(this.id,
      this.dni,
      this.nombre_usuario,
      this.passwd,
      this.nombre_completo,
      this.correo_electronico,
      this.fecha_nacimiento,
      this.direccion,
      this.pedidos);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}