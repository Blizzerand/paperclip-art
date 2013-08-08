namespace :setup do
	
	desc "Git tasks"
	task :git => :init do

		print "Create a new GIT repository?(y/n): "
		option = STDIN.gets.strip
	  	
	  	case_code(option)
	  	
				sh 'git init'
				puts "Adding a few items to .gitignore."
				mv 'lib/tasks/.gitignore', '.', verbose: false

				puts "Setting up git"
				sh 'git add .'
				sh 'git commit -m "Init" '

				puts "Enter the link to your repository for this app." 
				repo = STDIN.gets.strip
				sh "git remote add origin #{repo}"
				sh 'git push -u origin master'
			
			
	end

	task :git_branch => :git do
		puts "Creating a git branch, just to be safe!"
		sh 'git checkout -b Pre-development'

		print "Do you want to configure the layout, design and bootstrap?(y/n)"
		ption = STDIN.gets.strip
	end
	   
	   	

end