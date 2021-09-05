class Categorization

  BENEFIT = "benefit"
  CHEF = "chef"
  COOKING_MODE = "cooking_mode"
  COST = "cost"
  COUNTRY = "country"
  DIFFICULTY = "difficulty"
  DISH_TYPE = "dish_type"
  MAIN_INGREDIENT = "main_ingredient"
  MEAL = "meal"
  OCCASION = "occasion"
  PROBLEM_TYPE = "problem_type"
  PRODUCT_TYPE = "product_type"
  REGION = "region"
  ROOM = "room"
  SEASON = "season"
  SERVING = "serving"
  SOURCE = "source"
  SPECIAL_MENU = "special_menu"
  SUITABLE_FOR = "suitable_for"
  THEMATIC = "thematic"
  TODO = "todo"

  CATEGORIZATIONS = [
    BENEFIT,
    CHEF,
    COOKING_MODE,
    COST,
    COUNTRY,
    DIFFICULTY,
    DISH_TYPE,
    MAIN_INGREDIENT,
    MEAL,
    OCCASION,
    PROBLEM_TYPE,
    PRODUCT_TYPE,
    REGION,
    ROOM,
    SEASON,
    SERVING,
    SOURCE,
    SPECIAL_MENU,
    SUITABLE_FOR,
    THEMATIC,
    TODO,
  ]

  def initialize(categorization)
    @categorization = categorization
  end

  def eql?(other)
    to_s.eql?(other.to_s)
  end

  def to_s
    @categorization.to_s
  end

  def self.to_hash
    Hash[CATEGORIZATIONS.map { |x| [x.to_sym, x] }]
  end
end
