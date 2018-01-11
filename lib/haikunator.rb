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
        Amber Amethyst Aqua Aquamarine Auburn Azure Beige Blue Blush
        Burgundy Cardinal Carmine Carnelian Celadon Cerise
        Cerulean Chamoisee Chartreuse Cherry Chestnut Cinereous Cinnabar Cinnamon Citrine Cobalt Copper Coral
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
