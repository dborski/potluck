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
    deserts = get_all_from_category(:dessert)

    apps = appetizers.sort_by do |app|
      app = app.name[0]
    end

    apps = apps.map do |app|
      app = app.name
    end

    entres = entres.sort_by do |entre|
      entre = entre.name[0]
    end

    entres = entres.map do |entre|
      entre = entre.name
    end

    deserts = deserts.sort_by do |desert|
      desert = desert.name[0]
    end

    deserts = deserts.map do |desert|
      desert = desert.name
    end

    menu = {appetizers: apps, entres: entres, deserts: deserts}
  end
end
