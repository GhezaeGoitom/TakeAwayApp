import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import '../model/foodItem.dart';
import 'provider.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

//Stream that receives a data and change;
  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);
//output
  Stream<List<FoodItem>> get listStream => _listController.stream;
//input
  Sink<List<FoodItem>> get listSink => _listController.sink;

//Bussiness Logic

  CartProvider provider = CartProvider();

//for adding food to the list
  void addToList(FoodItem foodItem) =>
      _listController.add(provider.addToList(foodItem));

//for removing food from the list
  void removeFromList(FoodItem foodItem) =>
      _listController.add(provider.removeFoodItem(foodItem));

  @override
  void dispose() {
    // will be called automatically
    _listController.close();
    super.dispose();
  }
}
