import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/news_tec_cubit.dart';
import '../viewModel/news_tec_state.dart';


class ListOfViewsTechnology extends StatefulWidget {
  const ListOfViewsTechnology({Key? key}) : super(key: key);

  @override
  State<ListOfViewsTechnology> createState() => _ListOfViewsHealthState();
}

class _ListOfViewsHealthState extends State<ListOfViewsTechnology> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (context)=>NewstecCubit()..getAllNews(),
      child: BlocConsumer<NewstecCubit,NewstecState>(
        builder: (context,state){
          var cubit=NewstecCubit.get(context);
          return cubit.articalModel!=null?ListView.separated(itemBuilder: (context,index)=>Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                  visible: cubit.articalModel?[index].image!=null,
                  child: Image.network(cubit.articalModel?[index]?.image??"")),
              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(cubit.articalModel?[index]?.date??"",textAlign: TextAlign.start,),
                      SizedBox(
                        height: 15,
                      ),
                      Text(cubit.articalModel?[index]?.titel??"",textAlign:TextAlign.start,),
                      SizedBox(
                        height: 15,
                      ),
                      Text(cubit.articalModel?[index]?.desc??"",textAlign: TextAlign.start,),
                    ],
                  ),
                ),
              ),
            ],
          ),
            separatorBuilder: (context,index)=>SizedBox(
              height: 20,
            ),
            itemCount: cubit.articalModel?.length??0,
          ):Center(child: CircularProgressIndicator());
        },
        listener: (context,state){},
      ),
    );
  }
}
