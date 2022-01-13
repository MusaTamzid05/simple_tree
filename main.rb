

def get_dirname_from(path)
  path.split(File::SEPARATOR)[-1]
end

def traverse(dir_path, space_count = 0)
  dir_name = get_dirname_from(dir_path)
  entries = Dir.entries(dir_path).sort

  if space_count == 0
    puts dir_name
  end

  middle_sign = "├── "
  end_sign = "└── "

  entries.each_with_index do |entry, index| 
    if entry == "." || entry == ".."
      next
    end

    if index != entries.length - 1
      sign = middle_sign
    else
      sign = end_sign 
    end

    space_count.times do |space_index|
      print "\t"
    end


    puts "#{sign} #{entry} #{space_count}"

    current_path = File.join(dir_path, entry)

    if File.directory?(current_path)
      traverse(current_path, space_count + 1)
    end
  end
end

def main
  traverse("./test")
end

main
