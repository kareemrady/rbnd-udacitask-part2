require 'colorize'
require 'chronic'
require 'highline'
# Find a third gem of your choice and add it to your project
require 'date'
require_relative "lib/listable"
require_relative "lib/errors"
require_relative "lib/udacilist"
require_relative "lib/todo"
require_relative "lib/event"
require_relative "lib/link"

list = UdaciList.new(title: "Julia's Stuff")
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")
list.all
list.delete(3)
list.all

# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
new_list = UdaciList.new # Should create a list called "Untitled List"
new_list.add("todo", "Buy more dog food", due: "in 5 weeks", priority: "medium")
new_list.add("todo", "Go dancing", due: "in 2 hours")
new_list.add("todo", "Buy groceries", priority: "high")
new_list.add("event", "Birthday Party", start_date: "May 31")
new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
new_list.add("event", "Life happens")
new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
new_list.add("link", "http://ruby-doc.org")

# SHOULD RETURN ERROR MESSAGES
# ----------------------------
 new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
 new_list.delete(9) # Throws an IndexExceedsListSize error
 new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
new_list.all

# DEMO FILTER BY ITEM TYPE
# ------------------------
new_list.filter("event")


# Demo Highline gem use to capture user data and list addition
#--------------------------------------------------------------
cli = HighLine.new
VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
name = cli.ask("Please type in your name below".colorize(:green))
email = cli.ask("Please type in your email :".colorize(:yellow)) do  |q|
  q.responses[:not_valid] = "Not a valid email, please re-enter below"
  q.validate = VALID_EMAIL_REGEX
end
puts "Your name is: #{name.capitalize}".colorize(:magenta)
puts "Your Email is : #{email}"


menu_choice = cli.choose do |menu|
  menu.prompt = "Please choose which type of list you need to create by typing he corresponding number  "
  menu.choices(:event, :link, :todo)
end

case menu_choice.to_s
when "todo"
  description = cli.ask("Please Type in the Todo List title or just enter for unnamed list")
  due = cli.ask("Please enter date or when todo item is due for ex 'in 2 weeks'")
  priority = cli.choose do |menu|
    menu.prompt = "Please priority of item by typing he corresponding number"
    menu.choices(:low, :medium, :high, "")
  end
  

end
