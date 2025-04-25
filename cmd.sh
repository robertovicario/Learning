#!/bin/bash

setup() {
    printer "🔨 Setting up the repo"
    git submodule update --init --recursive
    handler
}

docs() {
    printer "📚 Generating documentation"
    pandoc ./docs/md/tmp.md \
    -o ./docs/tmp.pdf \
    --template=./pandoc-latex-template/template-multi-file/eisvogel.latex \
    --pdf-engine=xelatex
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
    docs)
        docs
        ;;
    *)
        echo "Usage: $0 {setup|docs}"
        ;;
esac
