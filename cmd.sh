#!/bin/bash

setup() {
    printer "🔨 Setting up the repo"
    git submodule update --init --recursive
    handler
}

notes() {
    printer "📚 Generating notes"
    mkdir -p dist
    FILES=()
    while IFS= read -r f; do
        FILES+=("$f")
    done < <(printf "%s\n" md/*.md | sort -V)
    pandoc "${FILES[@]}" \
        -o dist/content.pdf \
        --metadata-file=md/__metadata__.yml \
        --from=markdown \
        --template=pandoc-latex-template/template-multi-file/eisvogel.latex \
        --pdf-engine=xelatex \
        --filter=pandoc-latex-environment \
        --listings
    pdfunite \
        dist/front.pdf \
        dist/content.pdf \
        dist/Notes.pdf
    open dist/
    handler
}

printer() {
    echo ""
    echo $1
    echo ""
}

handler() {
    if [ $? -eq 0 ]; then
        printer "✅ Process completed successfully"
    else
        printer "❌ An error occurred during the process"
        exit 1
    fi
}

case $1 in
    setup)
        setup
        ;;
    notes)
        notes
        ;;
    *)
        echo "Usage: $0 {setup|notes}"
        ;;
esac
