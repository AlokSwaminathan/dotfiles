function nameOutFileUsaco
  set r ""
  set res (string split . $argv[1])
  for i in $res[1..-2]
    set r (string join '.' $r $i)
  end
  set r (string join '' $r E.out)
  set r (string trim --left --char=. $r)
  echo $r
end
