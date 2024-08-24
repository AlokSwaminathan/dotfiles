function r++ -d "Compile and run usaco c++ files"
  u++ $argv
  set exec (nameOutFileUsaco $argv[1])
  ./$exec
end
