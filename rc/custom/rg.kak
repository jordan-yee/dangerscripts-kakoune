# Use rg for the grep command

%sh{
    if ! command -v rg &> /dev/null; then
        echo "echo -debug 'ripgrep is not installed; skipping configuration'"
    else
        echo "set-option global grepcmd 'rg --column'"
    fi
}
