swapFiles() {
    if [[ $# -ne 2 ]] then
        echo "Usage: swapFiles <file1> <file2>"
        return 1;
    fi

    local file1="$1"
    local file2="$2"
    local temp

    if [[ ! -e $file1 || ! -e $file2 ]] then 
        echo "Both files must exist"
        return 1;
    fi

    tmp=$(mktemp)

    mv "$file1" "$tmp"
    mv "$file2" "$file1"
    mv "$tmp" "$file2"
}