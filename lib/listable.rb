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
    value = " ⇧" if priority == "high"
    value = " ⇨" if priority == "medium"
    value = " ⇩" if priority == "low"
    value = "" if !priority
    return value
  end
end
