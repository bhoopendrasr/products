require 'net/http'
class Import
	def self.sync
		result = eval(Net::HTTP.get(URI.parse('https://fakestoreapi.com/products')))
		result.each do |prod|
			Product.create(title: prod[:title], price: prod[:price], description: prod[:description], rating: prod[:rating], image: prod[:image])
		end
	end
end
