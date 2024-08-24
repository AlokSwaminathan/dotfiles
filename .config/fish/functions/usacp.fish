function usacp
  set og_path (pwd)
  set path (string split '/' $argv[1])
  if test (count path) -gt 1
    echo "Need to pass a cpp file that is under at least one new directory"
    return 1
  end
  set file_ending (string split '.' $path[-1])[-1]
  if test "$file_ending" != "cpp"
    echo "Needs to be cpp file"
    return 1
  end
  set folder_path ""
  for i in $path[..-2]
    set folder_path (string join '/' $folder_path $i)
  end
  set folder_path (string trim --left --char='/' $folder_path)
  mkdir -p $folder_path
  cd $folder_path
  cp ~/code/usaco/template.cpp $path[-1]

  if test (count $argv) -eq 3
    if test "$argv[2]" != "-i"
      echo "Only valid additional arguments are -i <io file name>" 
      return 1
    end
    touch "$argv[3].in"
    touch "$argv[3].out"
    sed -i "s|setIO()|setIO(\"$argv[3]\")|" $path[-1]
  end
  cd $og_path
end
