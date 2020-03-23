class Potluck

  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def get_all_from_category(dish_type)
    selected_dishes = dishes.find_all do |dish|
       dish.category == dish_type
    end
    return selected_dishes
  end

  def menu
    appetizers = get_all_from_category(:appetizer)
    entres = get_all_from_category(:entre)
    desserts = get_all_from_category(:dessert)

    appetizers = appetizers.sort_by do |app|
      app.name
    end

    appetizers = appetizers.map do |app|
      app.name
    end

    entres = entres.sort_by do |entre|
      entre.name
    end

    entres = entres.map do |entre|
      entre.name
    end

    desserts = desserts.sort_by do |desert|
      desert.name
    end

    desserts = desserts.map do |desert|
      desert.name
    end

    menu = {appetizers: appetizers, entres: entres, desserts: desserts}
  end
end
