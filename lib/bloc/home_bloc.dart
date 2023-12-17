import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_media/bloc/home_event.dart';
import 'package:multi_media/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
    HomeBloc():super(HomeLoading()){



       
    }

    
}