remove-ds-store-files() {
  find . -name ".DS_Store" -type f -print -delete
}

delete-ds-store-files() {
  remove-ds-store-files
}

