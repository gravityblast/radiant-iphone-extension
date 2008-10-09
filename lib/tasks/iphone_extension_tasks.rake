namespace :radiant do
  namespace :extensions do
    namespace :iphone do
      
      desc "Runs the migration of the Iphone extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          IphoneExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          IphoneExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Iphone to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[IphoneExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(IphoneExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end
      
      desc "Installs the iphone extension."
      task :install => :update do        
      end
        
    end
  end
end
