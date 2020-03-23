require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test

  def test_instance_of_dish
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_instance_of Dish, dish
  end

  def test_dish_has_attributes
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_equal "Couscous Salad", dish.name
    assert_equal :appetizer, dish.category
  end

  def test_instance_of_potluck
    potluck = Potluck.new("7-13-18")

    assert_instance_of Potluck, potluck
  end

  def test_potluck_has_attributes
    potluck = Potluck.new("7-13-18")

    assert_equal "7-13-18", potluck.date
  end

  def test_potluck_dishes_is_empty
    potluck = Potluck.new("7-13-18")

    assert_equal [], potluck.dishes
  end

  def test_add_dishes_to_potluck
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    potluck = Potluck.new("7-13-18")

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    assert_equal [couscous_salad, cocktail_meatballs], potluck.dishes
    assert_equal 2, potluck.dishes.length
  end

  def test_get_all_from_category
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    assert_equal [couscous_salad, summer_pizza], potluck.get_all_from_category(:appetizer)
    assert_equal couscous_salad, potluck.get_all_from_category(:appetizer).first
    assert_equal "Couscous Salad", potluck.get_all_from_category(:appetizer).first.name
  end

  def test_array_of_menu_of_dishes
    skip 
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    assert_equal menu = {:appetizers => ["Bean Dip", "Couscous Salad", "Summer Pizza"],
                         :entres=>["Cocktail Meatballs", "Roast Pork"],
                         :desserts=>["Candy Salad"]}, potluck.menu
  end








end
