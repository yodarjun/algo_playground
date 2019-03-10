def is_number?(str, exponent_started=false)
  return false if str.nil?
  str = str.strip
  return false if str.empty?
  return false if (str =~ /[a-zA-Z&&[^eE]]/ && str =~ /[eE]?/)
  str_arr = str.split("")
  valid_symbol_used = false
  number_started = false
  exponent_started ||= false
  exponent_number_started = false
  fraction_started = false
  decimal_started = false

  str_arr.each_index do |i|
    ch = str_arr[i]
    case ch
    when /[0-9]/
      number_started = true
      exponent_number_started = true if exponent_started
      fraction_started = true if decimal_started
    when "e"
      return false unless number_started
      return false if exponent_started
      return is_number?(str_arr[(i+1)..-1].join(""), true)
    when "."
      return false if exponent_started
      return false if decimal_started
      decimal_started = true
    when /[+-]/
      return false if valid_symbol_used
      return false if number_started
      return false if decimal_started
      valid_symbol_used = true
    else
      return false
    end
  end

  return false if exponent_started && !exponent_number_started
  if decimal_started
    return false if !number_started && !fraction_started
  end

  true
end
