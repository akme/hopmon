{
    if (match($0, /^[0-9]/, _))
    {
        gsub(",", "", $6);
        $6 = $6 + 0;
        if ($6>128)
            hop=255-$6
        else if ($6>64)
            hop=128-$6
        else if ($6>32)
            hop=64-$6
        else
            hop=32-$6

        printf (NR == 1 ? "%s " : "\n%s "), $1" "$5" "hop; fflush()
    }
    else
    {
        gsub("\n", "");
        printf "%s", $1
    }
}
