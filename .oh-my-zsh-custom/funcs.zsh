cl() {
    cd "$1"
    ls
}

unpack () {
  case $1 in
      *tar.gz) tar -xvf $1 --one-top-level;;
      *tar) tar -xvf $1 --one-top-level;;
      *rar) unrar x $1 -op`basename $1 .rar`;;
      *zip) 7z x $1 -o`basename $1 .zip`;;
      *7z) 7z x $1 -o`basename $1 .zip`;;
  esac
}
