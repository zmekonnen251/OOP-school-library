module Enumrable
  def list_items
    @items = []
    each do |i|
      @items.push(i)
    end

    @items
  end

  def any?
    @check_any = false
    each do |i|
      @check_any = true if yield i
    end
    @check_any
  end

  def all?
    @check_all = true

    each do |i|
      @check_all = false unless yield i
    end
    @check_all
  end

  def filter?
    @filtered = []

    each do |i|
      @filtered.push(i) if yield i
    end

    @filtered
  end

  def max?
    list_items.max
  end

  def min?
    list_items.min
  end

  def sort?
    list_items.sort
  end

  private :list_items
end
