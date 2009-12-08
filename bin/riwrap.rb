require 'rdoc/ri/driver'

options = {
  :use_cache=>true,
  :use_system=>true,
  :use_site=>true,
  :use_home=>true,
  :use_gems=>true,
  :extra_doc_dirs=>[],
  :names=>[]
}

puts RDoc::RI::Driver.new(options).class_cache.keys.join("\n")
