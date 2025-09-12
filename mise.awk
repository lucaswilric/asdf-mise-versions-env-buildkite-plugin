BEGIN {
  in_tools=0
  num_tools=0
  printf "{"
}

{
  if ($0 == "[tools]")
    in_tools=1
  else if (in_tools)
    if ($0~/^\[.*\]$/)
        in_tools=0
    else {
        if ($0!~/^\s*$/) {
            if (num_tools > 0) printf ","
            gsub(/-/, "_", $1)
            printf "\"" toupper($1) "_VERSION\":" $3
            num_tools++
        }
    }
}

END { printf "}" }
