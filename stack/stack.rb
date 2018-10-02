class Stack

  class Store
    attr_accessor :next, :data

    def initialize(data)
      @data = data
    end
  end

  def pop
    unless @top.nil?
      @top = @top.next
      @top.data if @top
    end
  end

  def push(obj)
    if @top.nil?
      @top = Store.new(obj)
    else
      old_top = @top
      @top = Store.new(obj)
      @top.next = old_top
    end
  end

  def peek
    @top.data if @top
  end
end
