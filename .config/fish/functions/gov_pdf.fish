function gov_pdf
    # List of words to avoid capitalizing
    set no_capitalize a an as at by for in of on or the to and

    set parts (string split -r '-' (string replace ".md" "" $argv[1]))
    set capitalized_parts
    for part in $parts
        if contains $part $no_capitalize
            set capitalized_parts $capitalized_parts $part
        else
            set capitalized_parts $capitalized_parts (string join "" (string upper (string sub -l 1 $part)) (string sub -s 2 $part))
        end
    end
    set new_name (string join '-' $capitalized_parts)
    set pdf_name "Alok-Swaminathan-$new_name.pdf"
    pandoc $argv[1] -o $pdf_name
    echo "Created pdf: $pdf_name"
    set full_path (pwd)"/$pdf_name"
    wl-copy "$full_path"
    echo "Copied pdf path to clipboard"
end
