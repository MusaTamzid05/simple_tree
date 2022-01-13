

def get_dirname_from(path)
  path.split(File::SEPARATOR)[-1]
end

def traverse(dir_path)
  dir_name = get_dirname_from(dir_path)
  entries = Dir.entries(dir_path).sort

  puts dir_name
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
    puts "#{sign} #{entry}"
  end
end

def main
  traverse("./test")
end

main
