# Incepand cu Ruby 1.9, `require` nu mai accepta ca argument o cale relativa
# pana la un fisier aflat pe disc, astfel incat se foloseste
# `File.expand_path` pentru a se genera o cale absoluta spre fisierul care
# contine aplicatia Sinatra.
#
# Inainte de 1.9, acelasi `require` putea fi scris si ca:
#
#     require "../miniflow"
#
# Versiunea cu `File.expand_path` functioneaza corect pentru toate versiunile
# de Ruby
require File.expand_path("../miniflow", __FILE__)
run Miniflow