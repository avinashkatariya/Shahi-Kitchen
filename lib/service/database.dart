import 'package:ShahiKitchen/models/food.dart';
import 'package:ShahiKitchen/service/temp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final CollectionReference foodsCollection =
      Firestore.instance.collection("foods");

  final CollectionReference foodTypeCollection = Firestore.instance.collection("Food_Types");

  Stream<QuerySnapshot> get foods {
    return foodsCollection.snapshots();
  }

  Stream<List<FoodModel>> searchFoodByName( String q){
    return foodTypeCollection.where("name",arrayContains: q).getDocuments().asStream().map(_foodModelFromDocument);
  }

  Stream<List<FoodType>> get foodTypes{
    return foodTypeCollection.snapshots().map(_foodTypeFromDocument);
  }

  Stream<List<FoodModel>> foodById(int id){
    
    return foodsCollection
        .where("id", isEqualTo: id)
        .getDocuments()
        .asStream()
        .map(_foodModelFromDocument);

  }

List<FoodType> _foodTypeFromDocument(QuerySnapshot querySnapshot){
  return querySnapshot.documents.map((data){
    return FoodType(data["type"],data.documentID,);
  }).toList();
}

  update() async{
    for (var update in updates){
      await foodsCollection.document(update[0]).updateData({'id':int.parse(update[0])});
    }
  }

  List<FoodModel> _foodModelFromDocument(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map((documentSnapshot) {
      String _id = documentSnapshot.data["id"].toString() ?? "",
          _type = documentSnapshot.data["type"] ?? "",
          _name = documentSnapshot.data["name"] ?? "",
          _vtype = documentSnapshot.data["V.type"] ?? "",
          _imageUrl = documentSnapshot.data["image"] ?? "";

      int _calories = documentSnapshot.data["calories"] ?? 0;
      double _price = documentSnapshot.data["price"] ?? 0;

      return FoodModel(_id, _type, _vtype, _name, _price, _calories, _imageUrl);
    }).toList();
  }

  Stream<List<FoodModel>> get fooditems {
    return foodsCollection
        .where("id", isLessThan: 20)
        .getDocuments()
        .asStream()
        .map(_foodModelFromDocument);
  }

 Stream<List<FoodModel>> foodbyType(String t){
   return foodsCollection.where("type", isEqualTo: t).getDocuments().asStream().map(_foodModelFromDocument);
 }
}
