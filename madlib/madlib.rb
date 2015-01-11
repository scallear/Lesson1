#Ask for nouns, verbs, and adjectives
#Open the file
#Search/parse for NOUNS, VERB, and ADJECTIVES
#Replace text with

dictionary = {
  nouns: ['dog', 'car', 'clown', 'hat'],
  verbs: ['juggle', 'spin'],
  adjectives: ['giant', 'red']
}

def say(message)
  puts "=> #{message}"
end

def exit_with(message)
  say(message)
  exit
end

exit_with("No input file!") && exit if ARGV.empty?
exit_with("Input file doesn't exist!") && exit if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

contents.gsub!('<NOUN>', dictionary[:nouns].sample)

contents.gsub!('<NOUN>').each do |noun|

contents.gsub!('<VERB>', dictionary[:verbs].sample)
contents.gsub!('<ADJECTIVE>', dictionary[:adjectives].sample)

p contents