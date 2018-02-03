
#!/usr/bin/ruby
###############################################################
#
# CSCI 305 - Ruby Programming Lab
#
# Laura Sullivan-Russett
# lbsrussett@gmail.com
#
###############################################################

$bigrams = Hash.new # The Bigram data structure
$name = "Laura Sullivan-Russett"

# function to process each line of a file and extract the song titles
def process_file(file_name)
	puts "Processing File.... "
	begin
		IO.foreach(file_name) do |line|
			title = clean_title(line)
			begin
				if(title =~ /^[A-za-z' 0-9]+$/)
					puts title.downcase
			end	
			# do something for each line
		end
	end
		
		puts "Finished. Bigram model built.\n"
	rescue
		STDERR.puts "Could not open file"
		exit 4
	end
end

def clean_title(line)
	str = line.dup
	str.sub!(/%(([A-Z0-9]+)<([A-Z]+)>)+/, "")
	str.sub!(/\A.*<([A-Z]+)>/, "")
	str.sub!(/[\(\[\{\\\/_\-:\"`\+=\*].*/, "")
	str.sub!(/\bfeat\b.*/, "")
	str.gsub!(/[?¿!¡\.;\&@\%#|]/, "")
	return str
end

# def ignore_noneng(titles)
# 	title_arr = Array.new()
# 	begin
# 		titles.each { |line| }
			
# 				title_arr.push(line)
# 			end
# 	end
# 	return title_arr



# Executes the program
def main_loop()
	puts "CSCI 305 Ruby Lab submitted by #{$name}"

	if ARGV.length < 1
		puts "You must specify the file name as the argument."
		exit 4
	end

	# process the file
	process_file(ARGV[0])

	# Get user input
end

if __FILE__==$0
	main_loop()
end
