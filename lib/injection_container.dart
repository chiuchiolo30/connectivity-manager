
import 'package:get_it/get_it.dart';
import 'package:processing_data/connectivity/data/datasources/local/connectivity_local_datasource.dart';
import 'package:processing_data/connectivity/data/repositories/connectivity_repository_impl.dart';
import 'package:processing_data/connectivity/domain/repositories/connectivity_repository.dart';
import 'package:processing_data/connectivity/ui/bloc/connectivity_bloc.dart';

import 'connectivity/domain/usecases/usecases.dart';



GetIt sl = GetIt.instance;

Future<void> setup() async {
  
  //? Bloc
  sl.registerLazySingleton( () => ConnectivityBloc(checkConnectivityUsecase: sl(), connectivitySubscription: sl(), connectivityUnSubscription: sl()));


  //? Use Cases
  sl.registerLazySingleton( () => CheckConnectivityUsecase( sl() ) );
  sl.registerLazySingleton( () => ConnectivitySubscriptionUsecase( sl() ) );
  sl.registerLazySingleton( () => ConnectivityUnsubscriptionUsecase( sl() ) );

  //? Repository
  sl.registerLazySingleton<ConnectivityRepository>(() => ConnectivityRepositoryImpl( sl() ) );

  //? Data Sources
  sl.registerLazySingleton<ConnectivityLocalDataSource>(() => ConnectivityLocalDataSourceImpl() );
   

  


}