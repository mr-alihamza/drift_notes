import 'package:drift_notes_app/data/data_sources/database/user_data/user_details_database.dart';
import 'package:drift_notes_app/data/repositories%20implements/user_repository_impl.dart';
import 'package:drift_notes_app/domain/use%20cases/user%20data%20use%20cases/add_user_data_use_case.dart';
import 'package:drift_notes_app/domain/use%20cases/user%20data%20use%20cases/get_user_data_use_case.dart';
import 'package:drift_notes_app/presentation/blocs/add%20screen%20bloc/bloc/add_screen_bloc.dart';
import 'package:drift_notes_app/presentation/blocs/home%20screen%20bloc/bloc/home_screen_bloc.dart';
import 'package:drift_notes_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final userDatabase = UserDetailsDatabase(); // Drift DB
  final userRepository = UserRepositoryImpl(userDatabase); // Repo
  final addUserDataUseCase = AddUserDataUseCase(userRepository); // UseCase
  final getUserDataUseCase = GetUserDataUseCase(userRepository); // UseCase

  runApp(
    MyApp(
      addUserDataUseCase: addUserDataUseCase,
      getUserDataUseCase: getUserDataUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AddUserDataUseCase? addUserDataUseCase;
  final GetUserDataUseCase? getUserDataUseCase;
  const MyApp({super.key, this.addUserDataUseCase, this.getUserDataUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddScreenBloc(addUserDataUseCase: addUserDataUseCase!),
        ),

        BlocProvider(
          create: (context) =>
              HomeScreenBloc(getUserDataUseCase: getUserDataUseCase!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
