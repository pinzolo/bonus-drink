# coding: utf-8
class Boy
  EXCHANGE_COUNT = 3

  attr_reader :drink_count, :empty_bottle_count, :drunk_count

  def initialize
    @drink_count = 0
    @drunk_count = 0
    @empty_bottle_count = 0
  end

  def buy_drinks(count)
    @drink_count += count
  end

  def can_drink?
    drink_count > 0
  end

  def drink
    raise "cannot drink" unless can_drink?

    @drink_count -= 1
    @drunk_count += 1
    @empty_bottle_count += 1
  end

  def can_exchange?
    @empty_bottle_count >= EXCHANGE_COUNT
  end

  def exchange
    raise "cannot exchange" unless can_exchange?

    @drink_count += @empty_bottle_count / EXCHANGE_COUNT
    @empty_bottle_count %= EXCHANGE_COUNT
  end
end

