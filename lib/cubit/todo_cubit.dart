import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/model/todo_models.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = Todo(name: title, createdAt: DateTime.now());

    // if we do like this then every todo will override one another,
    // coz it is just a single todo
    // emit([todo]);

    // by doing this we say our current state is this todo
    // and emit() will not notify the listeners if is a same state
    // here state is updating but listeners are not getting notified
    // we are adding todo in current state
    // state.add(todo);
    // emit(state);

    // we can do this
    // it means it will include other items also,
    // and the state which is updated just now
    // this will work fine
    // state.add(todo);
    // emit([...state]);

    // we can to do this in single line
    emit([...state, todo]);
  }

  // see what are the changes
  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
