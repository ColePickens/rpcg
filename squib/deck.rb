require 'squib'
require 'game_icons'
require 'yaml'

#All Ability Cards
data = Squib.csv file: "cardfiles/abilities.csv"
layouts = ['abilityLayout.yml', 'icons.yml']
icons =  YAML.load(File.read('icons.yml'))

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['name'], layout: 'title'
  text str: data['text'].map { |text| text.gsub(/\\n/,"\n") }, layout: 'description'
  text str: data['type'], layout: 'type'
  svg file: data['name'].map {|x| x.downcase.gsub(/ /, "")}.map { |x| "../resources/images/cardart/abilities/#{x}.svg"}, layout: 'art'
  svg layout: data['icon']
  save_pdf trim: 37.5, file: "abilities.pdf"
end

#All Equipment Cards
data = Squib.csv file: "cardfiles/equipment.csv"
layouts = ['fantasy.yml', 'icons.yml']
icons =  YAML.load(File.read('icons.yml'))

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['name'], layout: 'title'
  text str: data['text'], layout: 'description'
  text str: data['type'], layout: 'type'
  svg file: data['name'].map {|x| x.downcase.gsub(/ /, "")}.map { |x| "../resources/images/cardart/equipment/#{x}.svg"}, layout: 'art'
  svg layout: data['icon']
  save_pdf trim: 37.5, file: "equipment.pdf"
end

#All Monster Cards
data = Squib.csv file: "cardfiles/monsters.csv"
layouts = ['hand.yml', 'monsterLayout.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['name'], layout: 'title'
  text str: data['text'].map { |text| text.gsub(/\\n/,"\n") }, layout: 'monsterText', font: 'Sans 8'
  text str: data['name'], layout: 'art'
  svg file: GameIcons.get('hearts').file, layout: 'bonus1'
  text str: data['Health'], layout: 'bonus1Text'
  svg file: GameIcons.get('shield').file, layout: 'bonus2'
  text str: data['DR'], layout: 'bonus2Text'
  svg file: GameIcons.get('walking-boot').file, layout: 'bonus3'
  text str: data['Speed'], layout: 'bonus3Text'
  save_pdf trim: 37.5, file: "monsters.pdf"
end