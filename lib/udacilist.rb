require_relative 'errors'
class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if (type == "todo" || type == "event" || type == "link")
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    else
      begin
        raise UdaciListErrors::InvalidItemError, "InvalidItemError"
      rescue Exception => error
          puts error
      end

      end
    end


  def delete(index)
    if @items[index -1].nil?
    begin
      raise UdaciListErrors::IndexExceedsListSize, "IndexExceedsListSize Error"
    rescue Exception => error
      puts error
    end
  else
    @items.delete_at(index - 1)
  end
end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
