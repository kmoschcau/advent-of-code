# frozen_string_literal: true

(1..25).each do |day|
  (1..2).each do |part|
    file = "d#{day}p#{part}"
    abs_path = File.expand_path("#{file}.rb", File.dirname(__FILE__))
    require_relative file if File.file? abs_path
  end
end
