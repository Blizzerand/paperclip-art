  namespace :setup do 	
	task :all => [:init, :cleanup, :git, :git_branch] do
			puts "DOne"
	end	
end