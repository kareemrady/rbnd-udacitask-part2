module UdaciListErrors
  # Error classes go here
  class InvalidItemError < StandardError
  end
  class IndexExceedsListSize < StandardError
  end
  class InvalidPriorityValue < StandardError
  end
  class InvalidTypeError < StandardError
  end
end
