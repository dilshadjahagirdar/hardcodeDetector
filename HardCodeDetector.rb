require 'json'
value = File.read('mapping.json')

mappings = JSON.parse(value)

def extractMapping(mapping)
	isHardcoding = false
	mapping.each do |map|
		unless map["defaultValue"] === ""
			print "\n #{map["to"]} = #{map["defaultValue"]}\n"
			isHardcoding = true
		end

		if map["rules"].length == 1
			map["rules"].each do |i|
				if i["name"] === "HARDCODED"
					print "\n #{map["to"]} = #{i["value"]}\n"
					isHardcoding = true
				end
			end
		end
	end
	unless isHardcoding
		print "\n Cool ! No hardcoding found.\n"
	end
end

mappings.each do |mapping|
	if mapping[0] === "requestMapping"
		print "===================================request mapping report==================================================="
		extractMapping(mapping[1])
	end

	if mapping[0] === "responseMapping"
		print "===================================response mapping report==================================================="
		extractMapping(mapping[1])
	end
end


