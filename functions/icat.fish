function icat --description 'alias icat kitty +kitten icat' --wraps 'kitty +kitten'
  kitty +kitten icat $argv;
end
