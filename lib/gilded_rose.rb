class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end
  
  #<insert description of function tick here, including proper use cases, no need to describe inputs>
  def tick

    effect = 0

    if @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
      if @quality > 0
        if @name != "Sulfuras, Hand of Ragnaros"
	  if @name != "Conjured Mana Cake"
            effect = -1
	  elsif @quality > 1
	    effect = -2
	  end
        end
      end
    else
      if @quality < 50
        effect = 1
        if @name == "Backstage passes to a TAFKAL80ETC concert"
          if @days_remaining < 11 and @quality < 50
              effect = effect + 1
          end
          if @days_remaining < 6 and @quality <50
              effect = effect + 1 
          end
        end
      end
    end

    if @name != "Sulfuras, Hand of Ragnaros"
      @days_remaining = @days_remaining - 1
    end

    if @days_remaining < 0
      if @name != "Backstage passes to a TAFKAL80ETC concert"
	if @quality < 49 #needs to check for 49 so that Aged Brie doesn't go over 50
	  effect = effect * 2
	end
      else
	effect = -1 * @quality
      end
    end

    @quality = @quality + effect
  end
end
