# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destroy existing data
[PairingScore, Food, FoodSubtype, FoodType, WineSubtype, WineType, BottleType].each(&:destroy_all)

# ======================
# Wine Types & Subtypes
# ======================

bottle_types = %w[bordeaux burgundy sparkling port]

puts "Creating #{bottle_types.count} bottle types"

bottle_types.each do |bottle_type|
  BottleType.find_or_create_by!(name: bottle_type)
end

puts "Created #{bottle_types.count} bottle types"

wine_types = [
  { name: 'Bold Red',
    bottle_type: 'bordeaux',
    description: 'Full-bodied reds with high tannins and intense flavors',
    subtypes: ['Malbec', 'Syrah', 'Mourvèdre', 'Pinotage', 'Petite Sirah', 'Touriga Nacional', 'Cabernet Sauvignon',
               'Bordeaux Blend', 'Meritage'] },

  { name: 'Medium Red',
    bottle_type: 'burgundy',
    description: 'Medium-bodied reds with balanced flavors',
    subtypes: ['Merlot', 'Sangiovese', 'Zinfandel', 'Cabernet Franc', 'Tempranillo', 'Nebbiolo', 'Barbera',
               'Côtes du Rhône Blend'] },

  { name: 'Light Red',
    bottle_type: 'burgundy',
    description: 'Low-tannin reds with bright acidity',
    subtypes: ['Pinot Noir', 'Grenache', 'Gamay', 'St. Laurent', 'Carignan', 'Counoise'] },

  { name: 'Rich White',
    bottle_type: 'burgundy',
    description: 'Full-bodied whites with creamy textures',
    subtypes: %w[Chardonnay Sémillon Viognier Marsanne Roussanne] },

  { name: 'Light White',
    bottle_type: 'bordeaux',
    description: 'Crisp, refreshing whites with zesty acidity',
    subtypes: ['Sauvignon Blanc', 'Albariño', 'Pinot Blanc', 'Vermentino', 'Melon de Bourgogne', 'Gargenega',
               'Trebbiano', 'Pinot Gris / Pinot Grigio'] },

  { name: 'Rosé',
    bottle_type: 'bordeaux',
    description: 'Dry to semi-sweet pink wines',
    subtypes: ['Provençal Rosé', 'White Zinfandel', 'Loire Valley Rosé', 'Syrah Rosé', 'Garnacha Rosado',
               'Bandol Rosé', 'Tempranillo Rosé', 'Saignée Method Rosé'] },

  { name: 'Sparkling',
    bottle_type: 'sparkling',
    description: 'Effervescent wines with varying sweetness',
    subtypes: ['Champagne', 'Prosecco', 'Crémant', 'Cava', 'Metodo Classico', 'Sparkling Wine', 'Sparkling Rosé'] },

  { name: 'Sweet White',
    bottle_type: 'bordeaux',
    subtypes: ['Moscato', 'Riesling', 'Chenin Blanc', 'Gewürztraminer', 'Late Harvest Whites', 'Alsacian Pinot Gris'] },

  { name: 'Dessert',
    bottle_type: 'port',
    description: 'Sweet wines with concentrated flavors',
    subtypes: ['Port', 'Sherry', 'Madeira', 'Vin Santo', 'Muscat', 'PX (Pedro Ximénez)'] }
]

wine_types.each do |type|
  bt = BottleType.find_by!(name: type[:bottle_type])

  wt = WineType.create!(
    name: type[:name],
    description: type[:description],
    bottle_type: bt
  )

  type[:subtypes].each do |subtype|
    WineSubtype.create!(
      name: subtype,
      description: "#{subtype} characteristics",
      wine_type: wt
    )
  end
end

puts "Seeded #{WineType.count} wine types, #{WineSubtype.count} subtypes"

# ======================
# Food Types & Subtypes
# ======================

food_types = [
  { name: 'Dairy',
    description: 'Milk-based products',
    subtypes: [
      {
        name: 'Soft Cheese & Cream',
        description: 'Cheese with creamy textures and flavors',
        image_url: 'cheese',
        foods: ['Brie', 'Mascarpone', 'Crème Fraîche']
      },
      {
        name: 'Hard Cheese',
        description: 'Cheese with sharp textures and flavors',
        image_url: 'cheese2',
        foods: %w[Cheddar Pecorino Manchego Asiago Parmesan]
      },
      {
        name: 'Pungent Cheese',
        description: 'Cheese with strong aromas and flavors',
        image_url: 'smellycheese',
        foods: %w[Bleu Gorgonzola Stilton Roquefort]
      }
    ] },
  { name: 'Vegetable',
    description: 'Fruits, vegetables, and roots',
    subtypes: [
      {
        name: 'Alliums',
        image_url: 'onion',
        foods: %w[Onion Shallot Garlic Scallion]
      },
      {
        name: 'Green Vegetables',
        image_url: 'lettuce',
        foods: ['Green Bean', 'Kale', 'Lettuce']
      },
      {
        name: 'Root Vegetables & Squash',
        image_url: 'pumpkin',
        foods: %w[Turnip Butternut Pumpkin Delicata Carrot]
      },
      {
        name: 'Nightshades',
        image_url: 'eggplant',
        foods: ['Tomato', 'Eggplant', 'Bell Pepper']
      },
      {
        name: 'Funghi',
        image_url: 'mushroom',
        foods: %w[Crimini Maitake Chanterelle]
      },
      {
        name: 'Nuts & Seeds',
        image_url: 'nut',
        foods: %w[Peanut Almond Pecan Sesame]
      },
      {
        name: 'Beans & Peas',
        image_url: 'bean',
        foods: %w[Lentil Navy Pinto Chickpea]
      }
    ] },
  {
    name: 'Meat',
    description: 'Meat, poultry, and seafood',
    subtypes: [
      { name: 'Red Meat',
        description: 'Meat with high tannins and intense flavors',
        image_url: 'cow',
        foods: %w[beef lamb venison] },
      {
        name: 'Cured Meat',
        description: '',
        image_url: 'bacon',
        foods: %w[salami proscuitto bresaola bacon]
      },
      {
        name: 'Pork',
        description: '',
        image_url: 'pig',
        foods: ['roast', 'tenderloin', 'pork chop']
      },
      {
        name: 'Poultry',
        description: '',
        image_url: 'chicken',
        foods: %w[chicken duck turkey]
      },
      {
        name: 'Mollusk',
        description: '',
        image_url: 'clam',
        foods: %w[oyster mussel clam]
      },
      {
        name: 'Fish',
        description: '',
        image_url: 'fish',
        foods: %w[tuna cod trout bass]
      },
      {
        name: 'Lobster & Shellfish',
        description: '',
        image_url: 'lobster',
        foods: %w[prawn crab langoustine]
      }
    ]
  },
  {
    name: 'Preparation',
    description: 'Preparation methods',
    subtypes: [
      {
        name: 'Grilled or Barbecued',
        description: '',
        image_url: 'grill'
      },
      {
        name: 'Sauteed or Fried',
        description: '',
        image_url: 'spatula'
      },
      {
        name: 'Smoked',
        description: '',
        image_url: 'smoker'
      },
      {
        name: 'Roasted',
        description: '',
        image_url: 'oven'
      },
      {
        name: 'Steamed or Poached',
        description: '',
        image_url: 'steamer'
      }
    ]
  },
  { name: 'Herb & Spice',
    description: 'Herbs and spices',
    subtypes: [
      {
        name: 'Black Pepper',
        image_url: 'blackpepper',
        foods: ["It's black pepper, y'all."]
      },
      {
        name: 'Red Pepper',
        image_url: 'pepper1',
        foods: %w[ancho aleppo chipotle chili]
      },
      {
        name: 'Hot & Spicy',
        image_url: 'pepper2',
        foods: ['hot sauce', 'habanero', 'sichuan']
      },
      {
        name: 'Herbs',
        image_url: 'herbs',
        foods: %w[thyme oregano basil tarragon]
      },
      {
        name: 'Baking Spices',
        image_url: 'cinnamon',
        foods: %w[cinnamon clove allspice mace]
      },
      {
        name: 'Exotic & Aromatic Spices',
        image_url: 'anise',
        foods: %w[anise turmeric saffron fennel ginger]
      }
    ] },
  { name: 'Starch',
    description: 'Starches',
    subtypes: [
      {
        name: 'White Starches',
        image_url: 'bread',
        foods: ['flour', 'white rice', 'pasta', 'bread', 'tortillas']
      },
      {
        name: 'Whole Wheat & Grains',
        image_url: 'quinoa',
        foods: ['quinoa', 'farro', 'brown rice']
      },
      {
        name: 'Sweet, Starchy Vegetables',
        image_url: 'sweetpotato',
        foods: ['sweet potato', 'yucca', 'taro']
      },
      {
        name: 'Potato',
        image_url: 'potato',
        foods: []
      }
    ] },
  { name: 'Sweet',
    description: 'Sweets',
    subtypes: [
      {
        name: 'Fruit',
        image_url: 'strawberry',
        foods: %w[strawberry orange apple peach]
      },
      {
        name: 'Vanilla & Caramel',
        image_url: 'icecream',
        foods: ['creme brulee', 'ice cream']
      },
      {
        name: 'Chocolate & Coffee',
        image_url: 'coffee',
        foods: []
      }
    ] }

]

food_types.each do |type|
  ft = FoodType.create!(
    name: type[:name],
    description: type[:description]
  )

  type[:subtypes].each do |subtype|
    fst = FoodSubtype.create!(
      name: subtype[:name],
      description: subtype[:description],
      image_url: subtype[:image_url],
      food_type: ft
    )

    subtype[:foods]&.each do |food|
      Food.create!(
        name: food,
        food_subtype: fst
      )
    end
  end
end

# ======================
# Pairing Scores Matrix
# ======================

pairing_scores = [
  { name: 'Red Meat', pairing_array: [2, 1, 0, 0, 0, 0, 0, 0, 0] },
  { name: 'Cured Meat', pairing_array: [1, 1, 2, 1, 0, 0, 1, 2, 1] },
  { name: 'Pork', pairing_array: [1, 2, 0, 1, 0, 0, 1, 0, 0] },
  { name: 'Poultry', pairing_array: [0, 1, 2, 1, 2, 1, 1, 0, 0] },
  { name: 'Mollusk', pairing_array: [0, 0, 0, 0, 0, 1, 2, 0, 0] },
  { name: 'Fish', pairing_array: [0, 0, 0, 0, 1, 2, 1, 0, 0] },
  { name: 'Lobster & Shellfish', pairing_array: [0, 0, 0, 1, 2, 1, 0, 1, 0] },
  { name: 'Grilled or Barbecued', pairing_array: [2, 1, 1, 0, 0, 0, 1, 1, 0] },
  { name: 'Sauteed or Fried', pairing_array: [0, 0, 2, 1, 1, 1, 1, 0, 0] },
  { name: 'Smoked', pairing_array: [1, 2, 1, 1, 0, 0, 1, 0, 1] },
  { name: 'Roasted', pairing_array: [2, 1, 1, 1, 0, 0, 0, 1, 0] },
  { name: 'Steamed or Poached', pairing_array: [0, 0, 0, 0, 1, 2, 1, 1, 0] },
  { name: 'Soft Cheese & Cream', pairing_array: [0, 1, 2, 1, 2, 1, 1, 1, 1] },
  { name: 'Pungent Cheese', pairing_array: [1, 2, 0, 1, 0, 1, 1, 1, 2] },
  { name: 'Hard Cheese', pairing_array: [2, 1, 0, 1, 1, 0, 1, 0, 0] },
  { name: 'Alliums', pairing_array: [1, 2, 1, 1, 1, 1, 1, 1, 0] },
  { name: 'Green Vegetables', pairing_array: [0, 0, 0, 0, 0, 2, 1, 0, 0] },
  { name: 'Root Vegetables & Squash', pairing_array: [0, 0, 0, 2, 1, 0, 0, 1, 0] },
  { name: 'Nightshades', pairing_array: [1, 2, 0, 1, 0, 0, 0, 1, 0] },
  { name: 'Funghi', pairing_array: [1, 2, 2, 0, 2, 0, 0, 0, 0] },
  { name: 'Nuts & Seeds', pairing_array: [0, 0, 1, 1, 1, 1, 1, 2, 0] },
  { name: 'Beans & Peas', pairing_array: [0, 1, 0, 1, 0, 2, 1, 0, 0] },
  { name: 'Black Pepper', pairing_array: [2, 1, 0, 0, 0, 0, 0, 0, 0] },
  { name: 'Red Pepper', pairing_array: [1, 2, 0, 1, 0, 1, 1, 1, 0] },
  { name: 'Hot & Spicy', pairing_array: [0, 0, 0, 0, 0, 1, 1, 2, 0] },
  { name: 'Herbs', pairing_array: [0, 1, 1, 1, 1, 2, 0, 0, 0] },
  { name: 'Baking Spices', pairing_array: [0, 1, 0, 1, 0, 0, 0, 1, 2] },
  { name: 'Exotic & Aromatic Spices', pairing_array: [0, 2, 1, 1, 0, 0, 1, 2, 0] },
  { name: 'White Starches', pairing_array: [1, 1, 1, 1, 1, 1, 1, 1, 1] },
  { name: 'Whole Wheat & Grains', pairing_array: [0, 0, 1, 1, 1, 0, 0, 2, 0] },
  { name: 'Sweet, Starchy Vegetables', pairing_array: [0, 0, 0, 1, 0, 0, 0, 2, 0] },
  { name: 'Potato', pairing_array: [1, 1, 1, 1, 1, 1, 1, 1, 0] },
  { name: 'Fruit', pairing_array: [0, 0, 0, 0, 0, 0, 1, 2, 1] },
  { name: 'Vanilla & Caramel', pairing_array: [0, 0, 0, 0, 0, 0, 0, 1, 1] },
  { name: 'Chocolate & Coffee', pairing_array: [0, 0, 0, 0, 0, 0, 0, 0, 2] }
]

wines = ['Bold Red',
         'Medium Red',
         'Light Red',
         'Rich White',
         'Light White',
         'Rosé',
         'Sparkling',
         'Sweet White',
         'Dessert']


pairing_scores.each do |score|
  food_subtype = FoodSubtype.find_by(name: score[:name])

  wines.each_with_index do |wine, index|
    pairing_score = PairingScore.new(score: score[:pairing_array][index], wine_type: WineType.find_by(name: wine), food_subtype: food_subtype)
    pairing_score.save!
  end
end

puts "Seeded #{FoodType.count} food types, #{FoodSubtype.count} subtypes"
puts "Created #{PairingScore.count} pairing scores"
