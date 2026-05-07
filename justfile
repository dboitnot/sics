# SICS Inventory Classification System — justfile

src := "sics.adoc"
out_dir := "build"

# Default: build HTML
default: html

# Build HTML output
html:
    mkdir -p {{out_dir}}
    asciidoctor -D {{out_dir}} {{src}}

# Build PDF output (requires asciidoctor-pdf)
pdf:
    mkdir -p {{out_dir}}
    asciidoctor-pdf -D {{out_dir}} {{src}}

# Build both HTML and PDF
all: html pdf

# Watch for changes and rebuild HTML
watch:
    find . -name "*.adoc" | entr just html

# Remove build artifacts
clean:
    rm -rf {{out_dir}}
