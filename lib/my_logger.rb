require 'singleton'
class MyLogger
	include Singleton
	def initialize
		@log = File.open("log.txt", "a")
		#opens file in penned mode
	end

	def logInfo(information)
		@log.puts("---start---")
		@log.puts(information)
		@log.puts("---end---")
		@log.flush
	end


end

