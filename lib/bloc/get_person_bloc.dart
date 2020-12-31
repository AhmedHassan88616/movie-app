import 'package:flutter/material.dart';
import 'package:movies_app/models/person_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<PersonResponse>();

  getPersons() async {
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  BehaviorSubject<PersonResponse> get subject => _subject;

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final personsBloc = PersonsListBloc();
