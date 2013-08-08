require 'tempfile'

namespace :setup do
	desc "design and layout"
	task :design do
		puts "Adding bootstrap gem to Gemfile."
		temp_file = Tempfile.new('Gemfile')
		line0 = "gem 'bootstrap-sass', '2.3.2.1'"
		preceeding_line0 = "gem 'rails', '4.0.0'"

		begin 
			File.readlines('Gemfile').each do |line|
				temp_file.puts(line)

				if line.chomp == preceeding_line0
					temp_file.puts(line0)
				end

			end

			temp_file.close

			mv temp_file.path, 'Gemfile'

		ensure
			temp_file.delete
		end

	  	puts "Running bundle install. This may take a while...\n\n"
		#sh "bundle install"
		
		puts "Creating a custom stylesheet file. You can find me at app/assets/stylesheets/custom.css.scss"
		File.open("app/assets/stylesheets/custom.css.scss", "w") { |f| f.write("@import 'bootstrap';") }
		Rake::Task["setup:layout"].invoke
	end

	task :layout do
		puts "Configuring your application layout..."
		temp_file = Tempfile.new('application.html.erb')
		line0 = { shiv: "<%= render 'layouts/htmlshiv' %>", header: "<%= render 'layouts/header' %>", footer:  "<%= render 'layouts/footer' %>" }
		preceeding = { shiv: "<%= csrf_meta_tags %>", header: "<body>", footer: "<%= yield %>"}
		begin 
			File.readlines('app/views/layouts/application.html.erb').each do |line|
				temp_file.puts(line)

				

				if line.strip == preceeding[:shiv]
					temp_file.puts(line0[:shiv])
				end
				if line.strip == preceeding[:header]
					temp_file.puts(line0[:header])
				end
				if line.strip == preceeding[:footer]
					temp_file.puts(line0[:footer])
				end
			end

			temp_file.close

			mv temp_file.path, 'app/views/layouts/application.html.erb', verbose: false

			puts "Copying partials"
			cp_r 'lib/tasks/partials/.', 'app/views/layouts'

		ensure
			temp_file.delete
		end

		print "Setup and install Guard + Spork?(y/n)"
		option = STDIN.gets.strip
	
	   	if option.to_s[0] =~ /[Yy]/ 
		load "lib/tasks/guardspork.rake"
		Rake::Task["setup:guard_spork"].invoke
		end
	end
end