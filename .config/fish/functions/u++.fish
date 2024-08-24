function u++ -d "Compile C++ program to usaco standard"
  g++ -std=c++17 $argv[1] -include ~/code/usaco/bits/stdc++.h $argv[2..] -o (nameOutFileUsaco $argv[1])
end

