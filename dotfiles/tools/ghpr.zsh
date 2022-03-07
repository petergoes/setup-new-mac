ghpr() {
    gh pr create --title "$(git branch --show-current | sed -e 's/\-\-/\: /g' -e 's/\-/ /g' -e 's/\ /\-/1')"
}
