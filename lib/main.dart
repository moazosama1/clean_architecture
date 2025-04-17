import 'package:clean_architecture/Features/home/domain/entities/book_entities.dart';
import 'package:clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:clean_architecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_architecture/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_architecture/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_architecture/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_architecture/constants.dart';
import 'package:clean_architecture/core/functions/service_locator.dart';
import 'package:clean_architecture/core/utils/app_router.dart';
import 'package:clean_architecture/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitiesAdapter());
  await Hive.openBox<BookEntities>(kFeaturedBox);
  await Hive.openBox<BookEntities>(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            fetchFeaturedBooksUseCase: FetchFeaturedBooksUseCase(
              homeRepo: locator.get<HomeRepo>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            fetchNewestBooksUseCase: FetchNewestBooksUseCase(
              homeRepo: locator.get<HomeRepo>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
