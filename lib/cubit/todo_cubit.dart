import 'package:andreaproject/models/todo_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title){
    if (title.isEmpty) {
      addError('Title Cant Be Empty');
      return;
    }

    final todo = Todo(name: title, createdAt: DateTime.now());
    // state.add(todo);
    // emit([...state]);

    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print('Todo Cubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Todo Cubit - $error');
  }
}
