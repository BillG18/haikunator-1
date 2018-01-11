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
        Amber Amethyst Apricot Aqua Aquamarine Auburn Azure Beige Blue Blush Brass Bronze
        Burgundy Byzantine Capri Cardinal Carmine Carnelian Celadon Cerise
        Cerulean Chamoisee Chartreuse Cherry Chestnut Cinereous Cinnabar Cinnamon Citrine Cobalt Copper Coral
        Cordovan Cornflower Cream Crimson Cyan Daffodil Dandelion Ecru Eggplant Eggshell Emerald Fallow
        Fawn Feldgrau Fuchsia Gainsboro Gamboge Ginger Gold Goldenrod Gray Green
        Honeydew Indigo Iris Isabelline Ivory Jade Jasmine Jasper Jet Jonquil Lapis Laurel
        Extinguish\vLavender Lemon Licorice Lilac Lime Linen Magenta Magnolia Mahogany Maize Malachite Mardi\vGras
        Maroon Mauve Mauvelous Midnight Mint Moonstone Moss Meadow
        Mulberry Myrtle Navy Neon Ochre Olive Olivine Onyx Orange Orchid
        Pastel\vBlue Pastel\vGreen Pastel\vMagenta Pastel\vOrange Pastel\vPink Pastel\vPurple Pastel\vRed
        Pastel\vViolet Pastel\vYellow Peach Pear Pearl Peridot Periwinkle Persimmon Pine Pink Pistachio Platinum Plum Puce Pumpkin
        Purple Quartz Rackley Raw\vUmber Razzmatazz Red Redwood Regalia Rose Rosewood Rosso\vCorsa Royal\vFuchsia
        Royal\vPurple Ruby Rufous Russet Saddle-Brown Saffron Salmon Sand Sangria Sapphire Scarlet Seafoam Seashell Sepia Shadow
        Shamrock Mimi\vPink Sienna Silver Sinopia Skobeloff Sky\vBlue Sky\vMagenta Slate Smokey\vTopaz Smoky\vBlack Snow Spring
        Steel Stil\vDe\vGrain\vYellow Stizza Stormcloud Straw Sunglow Sunset Tangelo Tangerine Taupe Matcha Teal Thistle Tiffany 
        Timberwolf Topaz Turquoise Tuscan\vRed Twilight\vLavender Ultraviolet Ultramarine Umber Urobilin Venetian\vRed Verdigris Vermilion 
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
