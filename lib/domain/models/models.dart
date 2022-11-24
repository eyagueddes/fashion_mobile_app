class Item {
  int id;
  String title ;
  double price ;
  String description;
  String category;
  String image;
  Rating rating;

  Item(
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating
      );
}

class Rating {
  double rate;
  int count;
  Rating (this.rate,this.count);
}