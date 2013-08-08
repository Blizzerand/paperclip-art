namespace :setup do 
	desc "Initiate setup. This task serves as a dependency for other tasks."
	task :init do
		print "Name of the destination directory: "
		name = STDIN.gets.strip 
		if pwd().split('/').last == "Rake"	
			puts "Copying the files to #{name}/lib/tasks."
			cp_r '.', "../#{name}/lib/tasks", verbose: false

			print "Do you want to continue with the setup?(y/n): "
			option = STDIN.gets.strip
	
	   		case_code(option)
				cd "../#{name}"
		else 
			puts "We are already on the destination directory"
		end		
    end
 

	def abort_message
		abort("Exiting. You can each task individually. See rake -T for more info")
	end 

	
	def case_code(option)
		case option
	   		
	   		when /[^Yy]/
     			abort_message
	   	end 
	end
end