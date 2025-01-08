import 'package:arb_tasks/features/details/data/repo/details_rep_imp.dart';
import 'package:arb_tasks/features/metrics/data/model/Iteam_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detailscubit_state.dart';

class DetailscubitCubit extends Cubit<DetailscubitState> {
  DetailscubitCubit() : super(DetailscubitInitial());
  List<Item>? da;

  DetailsRepImp de = DetailsRepImp();
  Future<void> getYearlyData() async {
    emit(Detailscubitload());

    var res = await de.getYearlydata(da!);
    res.fold((l) {
      emit(DetailscubitFailure(message: l.message));
    }, (r) {
      emit(Detailscubitsucess(data: r));
    });
  }
}
