module ApplicationHelper

	def xml_parser(input)
	result = input.to_s
	result.gsub!("&", "&amp;")
	result.gsub!("<", "&lt;")
	result.gsub!(">", "&gt;")
	result.gsub!("'", "&apos;")
	result.gsub!("\"", "&quot;")
	result.gsub!(" ", "+")
	return result
	end
end
