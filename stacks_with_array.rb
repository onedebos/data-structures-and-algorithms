# frozen_string_literal: true

# @param {String} s
# @return {Boolean}
def is_valid(s)
  original_str = s.split('')
  opening_par = []

  original_str.each do |el|
    opening_par.push(el) if el == '{' || el == '[' || el == '('
    return false if opening_par.empty?

    # return false if original_str.count % 2 !=0
    next unless el == '}' && opening_par.last == '{' ||
                el == ')' && opening_par.last == '(' ||
                el == ']' && opening_par.last == '['

    opening_par.pop
  end
  opening_par.empty?
end
