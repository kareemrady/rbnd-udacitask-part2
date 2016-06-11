module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_date(options = {})
    due = options[:due]
    start_date = options[:start_date]
    end_date = options[:end_date]
    if (start_date || end_date)
      dates = start_date.strftime("%D") if start_date
      dates << " -- " + end_date.strftime("%D") if end_date
      dates = "N/A" if !dates
      return dates
    else
      due ? due.strftime("%D") : "No due date"
    end
  end

  def format_priority(priority)
    priority_list = ["high", "medium", "low", nil]
    if (!priority_list.include?(priority))
      begin
        raise UdaciListErrors::InvalidPriorityValue, "Invalid Priority Value Error"
      rescue Exception => error
        #essential to not break the details function if the priority value is invalid it will just print the error and show the todo item with priority = ""
        return value = ""
        puts error
      end
    else
      value = " ⇧".colorize(:green) if priority == "high"
      value = " ⇨".colorize(:yellow) if priority == "medium"
      value = " ⇩".colorize(:red) if priority == "low"
      value = "".colorize(:magenta) if !priority
      return value
    end

  end
end
