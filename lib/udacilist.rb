
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
    print_header(@title)
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
  def filter(type)
    #raise error if invalid type entered\
    types_hash = {event: EventItem, link: LinkItem, todo: TodoItem}
    if !types_hash.keys.include?(type.to_sym)
      begin
        raise UdaciListErrors::InvalidTypeError, "Invalid Type Error"
      rescue Exception => error
        puts error
      end
    else
      type_sym = type.to_sym
      print_header(type.capitalize + "s" , {message: "Filtered List of " })
      @items.select {|item| item.class == types_hash[type_sym] }.each {|item| puts item.details}
      #dont repeat urself
      # @items.select{|item| item.class == EventItem}.each {|item| puts item.details} if type == "event"
      # @items.select{|item| item.class == TodoItem}.each {|item| puts item.details} if type == "todo"
      # @items.select{|item| item.class == LinkItem}.each {|item| puts item.details} if type == "link"
    end
  end
  private

  def print_header(header, options = {})
    message = options[:message] || ""
    puts "-" * header.length
    puts message + header
    puts "-" * header.length
  end

end
