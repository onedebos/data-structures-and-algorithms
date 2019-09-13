
# Display a range of numbers
def count_down(val)
  if val < 0
    puts "All done!"
  else
    puts val
    val -= 1
    count_down(val)
  end
end

# sum a range of numbers
def sum_range(num)
  if num == 1
    1
  else
    num + sum_range(num - 1)
  end
end

def factorial(num)
  if num==0
    1
  else
    num * factorial(num-1)
  end 
end


# puts count_down(3)
# puts sum_range(203)
puts factorial(3)