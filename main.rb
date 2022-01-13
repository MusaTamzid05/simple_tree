

def get_dirname_from(path)
  path.split(File::SEPARATOR)[-1]
end

def traverse(dir_path)
  dir_name = get_dirname_from(dir_path)
  entries = Dir.entries(dir_path)

  puts dir_name

  entries.each do |entry| 
    if entry == "." || entry == ".."
      next
    end

    puts entry
  end
end

def main
  traverse("./test")
end

main
