class FoodModel {
  final String fid, type, vtype, name, imageUrl;
  final int calories;
  final double price;
  FoodModel(this.fid, this.type, this.vtype, this.name, this.price,
      this.calories, this.imageUrl);
}

class FoodType {
  final String type;
  final String id;
  FoodType(this.type, this.id,);
}
