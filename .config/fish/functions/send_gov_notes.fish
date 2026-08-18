function send_gov_notes
    set msg "Hello Mrs. Bennett,\nI've attached my notes for today as a PDF file.\nThank you,\nAlok Swaminathan"
    set recv "jennifer.bennett@pccsk12.com"
    # set recv "aswami124@pccsk12.com"
    set subject "Notes for" (date +"%m/%d")
    set filename $argv[1]

    if test (count $argv) -le 0
        echo "Need to give .md file"
        return 1
    else if not string match -r ".*\.md" $filename
        echo "$filename is not a markdown file"
        return 1
    else if not test -f $filename
        echo "$filename doesn't exist"
        return 1
    end

    echo "Are you sure you want to email Mrs. Bennett the notes in $filename? (y/n)"
    read -l confirmation

    if not test "$confirmation" = "y"
        echo "Quitting..."
        return 0
    end

    set pdf_name (string replace -r '\.md$' '.pdf' $filename)
    pandoc $filename -o $pdf_name

    echo -e $msg | mailx -s "$subject" -a "$pdf_name" "$recv"
end
