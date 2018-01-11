require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-")
      build(token_range, delimiter)
    end

    private

    def build(token_range, delimiter)
      sections = [
        adjectives[random_seed % adjectives.length],
        nouns[random_seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        Amber Amethyst Apricot Aqua Aquamarine Auburn Azure Baby-Blue Baby-Pink Beige Bleu-De-France Blue Blush Brass Bronze
        Burgundy Burnt-Orange Burnt-Sienna Burnt-Umber Byzantine Canary-Yellow Capri Cardinal Carmine Carnelian Celadon Cerise
        Cerulean Chamoisee Chartreuse Cherry Cherry-Blossom-Pink Chestnut Cinereous Cinnabar Cinnamon Citrine Cobalt Copper Coral
        Cordovan Cornflower-Blue Cream Crimson Cyan Daffodil Dandelion Dark-Blue Ecru Eggplant Eggshell Emerald English-Lavender Fallow
        Fawn Feldgrau French-Beige French-Blue French-Lilac French-Rose Fuchsia Gainsboro Gamboge Ginger Gold Goldenrod Gray Green
        Harvest-Gold Honeydew Hot-Pink Hunter-Green Indigo Iris Isabelline Ivory Jade Jasmine Jasper Jet Jonquil Lapis-Lazuli Laurel-Green
        Extinguish-Lavender Lemon Lemon-Chiffon Licorice Lilac Lime-Green Linen Magenta Magnolia Mahogany Maize Malachite Mardi-Gras
        Maroon Mauve Mauvelous Midnight Mikado-Yellow Mint Misty-Rose Mode-Beige Moonstone-Blue Moss-Green Mountain-Meadow Mountbatten-Pink
        Mulberry Myrtle Nadeshiko-Pink Napier-Green Naples-Yellow Navy-Blue Neon-Fuchsia Ochre Olive Olivine Onyx Opera-Mauve Orange Orchid
        Paris-Green Pastel-Blue Pastel-Brown Pastel-Gray Pastel-Green Pastel-Magenta Pastel-Orange Pastel-Pink Pastel-Purple Pastel-Red 
        Pastel-Violet Pastel-Yellow Peach Pear Pearl Peridot Periwinkle Persimmon Pine-Green Pink Pistachio Platinum Plum Puce Pumpkin
        Purple Quartz Rackley Raw-Umber Razzmatazz Red Redwood Regalia Robin-Egg-Blue Rose Rosewood Rosso-Corsa Royal-Azure Royal-Fuchsia
        Royal-Purple Ruby Rufous Russet Saddle-Brown Saffron Salmon Sand Sangria Sapphire Scarlet Sea-Blue Seashell Sepia Shadow
        Shamrock-Green Mimi-Pink Sienna Silver Sinopia Skobeloff Sky-Blue Sky-Magenta Slate-Blue Smokey-Topaz Smoky-Black Snow Spring-Green
        Steel-Blue Stil-De-Grain-Yellow Stizza Stormcloud Straw Sunglow Sunset Tangelo Tangerine Taupe Tea-Green Teal Thistle Tiffany-Blue 
        Timberwolf Topaz Turquoise Tuscan-Red Twilight-Lavender Ultraviolet Ultramarine Umber Urobilin Venetian-Red Verdigris Vermilion 
        Violet Viridian Wenge White Wisteria Xanadu Yellow Zaffre
      )
    end

    def nouns
      %w(
        heron egret swan goose mallard osprey eagle hawk kestrel falcon gull dove owl swallow Blue-Jay crow chickadee bluebird
        robin catbird mockingbird vireo warbler cardinal sparrow junco blackbird grackle finch goldfinch starling kingbird phoebe swift oriole 
        thrasher pelican avocet tern cormorant raven wren tanager kinglet coot quail 
      )
    end
  end
end
