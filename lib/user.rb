class User
  attr_reader :name, :email
  attr_accessor :lists


  def initialize(name, email)
    @name = name
    @email = email
    @lists = []

  end

  def add_list(list)
    @lists << list
  end
  def print_lists
    @lists.each{|list| list.all}
  end

end
