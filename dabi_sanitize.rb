require 'csv'

input = "test.csv"
output = "output.csv"

class String

	def gsub_or_self!(x,y)
		gsub!(x,y) || self
	end
	
	def strip_or_self!
		strip! || self
	end

end

CSV.open(output, "w") do |writer|
	CSV.foreach(input, converters: lambda {|s| s ? s.gsub_or_self!(/[[:space:]]$/,"").strip_or_self! : nil}) do |row|
		writer << row		
	end
end
