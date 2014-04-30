# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/boy')

class BonusDrink
  def self.total_count_for(amount)
    a_boy = Boy.new
    a_boy.buy_drinks(amount)
    while a_boy.can_drink?
      a_boy.drink
      if a_boy.can_exchange?
        a_boy.exchange
      end
    end
    a_boy.drunk_count
  end
end

if __FILE__ == $0
  puts BonusDrink.total_count_for(100)
end
