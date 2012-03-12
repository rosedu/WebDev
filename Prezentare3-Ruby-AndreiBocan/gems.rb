before = $:.dup

require 'rubygems'
require 'xmpp4r'

p $: - before

b = []
a = b
b << 1
p a 
p b
