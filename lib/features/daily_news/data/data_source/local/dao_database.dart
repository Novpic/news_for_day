// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/article.dart';
import 'DAO/article_dao.dart';

part 'dao_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase {
  ArticleDao get articleDao;
}
