class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return "0" if number.zero? || number.nil?

    result = ""

    while number > 0 do
      index = number % BASE
      result.prepend ALPHABET[index]
      number = number / BASE
    end
    result
  end

  def self.decode(string)
    chars = string.chars.reverse
    total = 0
    exp = 0
    chars.each do |c|
      total += (ALPHABET.index(c) * BASE**exp)
      exp += 1
    end
    total
  end
end
