import 'package:dio/dio.dart';
import 'package:gobus/data/dio_instance.dart';
import 'package:gobus/data/models/authenticated_user.dart';
import 'package:flutter/material.dart';

class UserService {
  Dio api = configureDio();

  // Méthode de login
  Future<AuthenticatedUser> login(Map<String, dynamic> data) async {
    final response = await api.post(
      'authentication',
      data: data,
    );

    if (response.statusCode == 201) {
      print('Connexion réussie: ${response.data}');
      return AuthenticatedUser.fromJson(response.data);
    } else {
      print('Erreur lors de la connexion');
      return Future.error('Erreur lors de la connexion');
    }
  }

  // Méthode de création d'un utilisateur
  Future<void> create(Map<String, dynamic> data) async {
    final response = await api.post(
      'users', // URL de votre API
      data: data,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Utilisateur créé avec succès');
    } else {
      print('Erreur lors de la création de l\'utilisateur');
      return Future.error('Erreur lors de la création de l\'utilisateur');
    }
  }
}
