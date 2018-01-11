require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "\ ")
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
        amber amethyst aqua aquamarine auburn azure beige blue blush 
        burgundy cardinal carmine carnelian celadon cerise 
        cerulean chamoisee chartreuse cherry chestnut cinereous cinnabar cinnamon citrine cobalt copper coral 
        cordovan cornflower cream crimson cyan daffodil dandelion ecru eggplant eggshell emerald fallow 
        fawn feldgrau fuchsia gainsboro gamboge ginger gold goldenrod gray green 
        honeydew indigo iris isabelline ivory jade jasmine jasper jet jonquil lapis laurel 
        extinguish\ lavender lemon licorice lilac lime linen magenta magnolia mahogany maize malachite mardi\ gras 
        maroon mauve mauvelous midnight mint moonstone moss meadow 
        mulberry myrtle navy neon ochre olive olivine onyx orange orchid 
        pastel\ alue pastel\ green pastel\ magenta pastel\ orange pastel\ pink pastel\ purple pastel\ red 
        pastel\ violet pastel\ yellow peach pear pearl peridot periwinkle persimmon pine pink pistachio platinum plum puce pumpkin 
        purple quartz rackley raw\ umber razzmatazz red redwood regalia rose rosewood rosso\ corsa royal\ fuchsia 
        royal\ purple ruby rufous russet saddle\ arown saffron salmon sand sangria sapphire scarlet seafoam seashell sepia shadow 
        shamrock mimi\ pink sienna silver sinopia skobeloff sky\ alue sky\ magenta slate smokey\ topaz smoky\ alack snow spring 
        steel stizza stormcloud straw sunglow sunset tangelo tangerine taupe matcha teal thistle tiffany 
        timberwolf topaz turquoise tuscan\ red twilight\ lavender ultraviolet ultramarine umber urobilin venetian\ red verdigris vermilion 
        violet viridian wenge white wisteria xanadu yellow zaffre 
      )
    end

    def nouns
      %w(
        heron egret swan goose mallard osprey eagle hawk kestrel falcon gull dove owl swallow blue\ jay crow chickadee bluebird
        robin catbird mockingbird vireo warbler cardinal sparrow junco blackbird grackle finch goldfinch starling kingbird phoebe swift oriole
        thrasher pelican avocet tern cormorant raven wren tanager kinglet coot quail
      )
    end
  end
end
