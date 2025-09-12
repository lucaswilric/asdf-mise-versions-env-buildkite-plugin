BEGIN {
  num_tools=0
  printf "{"
}

{
    if ($0!~/^\s*$/) {
        if (num_tools > 0) printf ","
        gsub(/-/, "_", $1)
        printf "\"" toupper($1) "_VERSION\":\"" $2 "\""
        num_tools++
    }
}

END { printf "}" }
