import 'package:flutter/material.dart';
import 'package:flutter_assginment_6_1/viewModel/news_cubit.dart';
import 'package:flutter_assginment_6_1/viewModel/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfViewsHealth extends StatefulWidget {
  const ListOfViewsHealth({Key? key}) : super(key: key);

  @override
  State<ListOfViewsHealth> createState() => _ListOfViewsHealthState();
}

class _ListOfViewsHealthState extends State<ListOfViewsHealth> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (context)=>NewsCubit()..getAllNews(),
      child: BlocConsumer<NewsCubit,NewsState>(
        builder: (context,state){
          var cubit=NewsCubit.get(context);
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