import 'package:flutter_app/model/homemodel.dart';
import 'package:flutter_app/view/homeview.dart';

abstract class HomePresenter {
  void setView(HomeView homeView);

  void plush();

  void minus();

  void reset();
}

class HomePresentImp implements HomePresenter {
  HomeView _homeView;
  HomeModel _homeModel = HomeModelImp();

  @override
  void setView(HomeView homeView) {
    this._homeView = homeView;
  }

  @override
  void minus() {
    int count = _homeModel.minus();
    _homeView.updateCounter(count);
  }

  @override
  void plush() {
    int count = _homeModel.plush();
    _homeView.updateCounter(count);
  }

  @override
  void reset() {
    int count = _homeModel.reset();
    _homeView.updateCounter(count);
  }
}
