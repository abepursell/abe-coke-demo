# String extensions
String.class_eval do
  def to_slug
    # Perform transliteration to replace non-ascii characters with an ascii
    # character
    value = self.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s

    # Remove single quotes from input
    value.gsub!(/[']+/, '')

    # Replace any non-word character (\W) with a space
    value.gsub!(/\W+/, ' ')

    # Remove any whitespace before and after the string
    value.strip!

    # All characters should be downcased
    value.downcase!

    # Replace spaces with dashes
    value.gsub!(' ', '-')

    # Return the resulting slug
    value
  end

  def self.random
    (0..7).map do |n|
      (SecureRandom.random_number(26) + 97).chr
    end.join
  end
end

