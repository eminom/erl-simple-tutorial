#! ruby

def getFiles(start_path, ext)
	rv = []
    # It gets the full path name
    Dir.glob("#{start_path}/**/*#{ext}") do |f|
        rv.push(f)
    end
    rv
end

path = File.absolute_path(__FILE__.encode("UTF-8"))
path = path.chomp(File.basename(path))  # And path is now ending with a slash

ebin_path = "#{path}ebin"
if not Dir.exist? ebin_path then
    puts "Not a directory for #{ebin_path}"
    exit
end

for i in getFiles("#{path}src", ".erl")
    #puts i
    cmd = "erlc -o \"#{ebin_path}\" \"#{i}\""
    #puts cmd
    if not system(cmd) then
        puts "#{cmd} failed"
    else
        puts "#{File.basename(i)} is generated"
    end
end

# puts path


