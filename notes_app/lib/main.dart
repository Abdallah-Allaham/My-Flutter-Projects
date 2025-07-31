import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/notes/domain/usecases/get_all_notes_usecase.dart';
import 'features/notes/domain/usecases/insert_note_usecase.dart';
import 'features/notes/domain/usecases/update_note_usecase.dart';
import 'features/notes/domain/usecases/delete_note_usecase.dart';
import 'features/notes/data/repositories_impl/notes_repository_impl.dart';
import 'features/notes/presentation/cubit/notes_cubit.dart';
import 'features/notes/presentation/screens/notes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => NotesCubit(
                getAllNotesUsecase: GetAllNotesUsecase(
                  notesRepository: NotesRepositoryImpl(),
                ),
                insertNoteUsecase: InsertNoteUsecase(
                  notesRepository: NotesRepositoryImpl(),
                ),
                updateNoteUsecase: UpdateNoteUsecase(
                  notesRepository: NotesRepositoryImpl(),
                ),
                deleteNoteUsecase: DeleteNoteUsecase(
                  notesRepository: NotesRepositoryImpl(),
                ),
              )..getAllNotes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.teal,
        ),
        themeMode: ThemeMode.system,
        home: const NotesScreen(),
      ),
    );
  }
}
