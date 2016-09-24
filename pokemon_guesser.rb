def valid(answ)

  until((answ == "y") or (answ == "n"))
    puts "Wrong choice. Enter a valid one"
    answ = gets.chomp
    valid(answ)
  end
  return answ
end
know = false

FILENAME = 'pokemon.yaml'

class Poke
  attr_accessor :Name, :Type, :Stage, :Generation
end

require "yaml"
data = YAML::load(File.open(FILENAME))

puts "\t\t Pokemon game!\n\n"
puts "Do you know the rules? (y/n)"
ans = gets.chomp
ans = valid(ans)
if ans != "y"
  puts "\n\nIn this game, I will guess the Pokemon you have in your mind!"
  puts "\n Think of a pokemon in any of the given 16 types!"
  puts "  Fire
  Grass
  Water
  Electric
  Ground
  Psychic
  Fighting
  Normal
  Fairy
  Steel
  Dragon
  Dark
  Flying
  Ghost
  Ice
  Poison"
  puts "\nYou can answer only yes or a no. Press either y or n."
end

guesses = 0.to_i
puts "\t\t Let's begin!"
generation = ""

puts "Before we begin, do you know the generation of the pokemon you have in your mind? (y/n)"
ans = gets.chomp
ans = valid(ans)
if ans == "y"
  know = true
  puts "\n\nIs your pokemon a generation one/ two/ three/ four Pokemon? (y/n)"
  ans = gets.chomp
  ans = valid(ans)
  guesses += 1
  if ans == "y"
    puts "Is your pokemon a generation one/ two Pokemon? (y/n)"
    ans = gets.chomp
    ans = valid(ans)
    guesses += 1
    if ans == "y"
      puts "Is your pokemon a generation one Pokemon? (y/n)"
      ans = gets.chomp
      ans = valid(ans)
      guesses += 1
      if ans == "y"
        generation = "One"
      else
        generation = "Two"
      end
    else
      puts "Is your pokemon a generation three Pokemon? (y/n)"
      ans = gets.chomp
      ans = valid(ans)
      guesses += 1
      if ans == "y"
        generation = "Three"
      else
        generation = "Four"
      end
    end
  end
  if generation.length.to_i == 0
    puts "Is your pokemon a generation five Pokemon? (y/n)"
    ans = gets.chomp
    ans = valid(ans)
    guesses += 1
    if ans == "y"
      generation = "Five"
    else
      generation = "Six"
    end
  end
end



type = ""
def check(a)
  if a == "y"
    return 1
  else
    return 0
  end
end




puts "Is pokemon's type Fire/ Grass/ Water/ Electric? (y/n)"
ans = gets.chomp
 guesses += 1
if ans == "y"
  puts "Is pokemon's type Fire/ Grass? (y/n)"
  ans = gets.chomp
  guesses += 1
  if ans == "y"
    puts "Is pokemon's type Fire? (y/n)"
    ans = gets.chomp
    guesses += 1
    if ans === "y"
      type = "Fire"
    else
      type = "Grass"
    end
  else
      puts "Is pokemon's type Electric? (y/n)"
      ans = gets.chomp
      guesses += 1
      if ans == "y"
        type = "Electric"
      else
        type = "Water"
      end
  end
end
if type.length.to_i == 0
  puts "Is pokemon's type Ground/ Fighting/ Psychic/ Normal? (y/n)"
  ans = gets.chomp
  guesses += 1
  if ans == "y"
    puts "Is pokemon's type Ground/ Fighting? (y/n)"
    ans = gets.chomp
    guesses += 1
    if ans == "y"
      puts "Is pokemon's type Ground? (y/n)"
      ans = gets.chomp
       guesses += 1
      if ans == "y"
        type = "Ground"
      else
        type = "Fighting"
      end
    else
      puts "Is pokemon's type Psychic? (y/n)"
      ans = gets.chomp
      guesses += 1
      if ans == "y"
        type = "Psychic"
      else
        type = "Normal"
      end
    end
  end
end

if type.length.to_i == 0
  puts "Is pokemon's type Fairy/ Steel/ Dragon/ Dark? (y/n)"
  ans = gets.chomp
  guesses += 1
  if ans == "y"
    puts "Is pokemon's type Fairy/ Steel? (y/n)"
    ans = gets.chomp
    guesses += 1
    if ans == "y"
      puts "Is pokemon's type Fairy? (y/n)"
      ans = gets.chomp
      guesses += 1
      if ans == "y"
        type = "Fairy"
      else
        type = "Steel"
      end
    else
      puts "Is pokemon's type Dragon? (y/n)"
      ans = gets.chomp
      guesses += 1
      if ans == "y"
        type = "Dragon"
      else
        type = "Dark"
      end
    end
  end
end


index = 0
index = index.to_i

stage = ""
puts "Is pokemon a basic/ stage 1 pokemon? (y/n)"
ans = gets.chomp
ans = valid(ans)
guesses += 1
if ans == "y"
  puts "Is your pokemon a basic one? (y/n)"
  ans = gets.chomp
  ans = valid(ans)
  guesses += 1
  if ans == "y"
    stage = "Zero"
  else
    stage = "One"
  end
else
  stage = "Two"
end
rr = 0
arr = []
if know
data.each do
  |e|
  if e.Type == type and e.Stage == stage and e.Generation == generation
    arr.push(e.Name)
  end
end
else
  data.each do
    |e|
    if e.Type == type and e.Stage == stage
      arr.push(e.Name)
    end
  end
end
  count = 0
  count = count.to_i
arr.sort!
# p arr
lower = 0
upper = 0
lower = lower.to_i
upper = upper.to_i

if arr.length.to_i > 2
  count = 0
  puts "Is your pokemons starting letter between n and z (y/n)"
  ans = gets.chomp
  ans = valid(ans)
  guesses += 1
  if ans == "y"
    upper = 1
    arr.each do |e|
      arr[count.to_i] = "NIL" if e[0].to_s.downcase.match /[a-m]/
      count += 1
    end
  else
    lower = 1
    arr.each do |e|
      arr[count.to_i] = "NIL" if e[0].to_s.downcase.match /[n-z]/
      count += 1
    end
  end
end
arr.delete("NIL")
if ((arr.length.to_i > 2) and (lower == 1))
  count = 0
  puts "Is your pokemons starting letter between a and f (y/n)"
  ans = gets.chomp
  ans = valid(ans)
  guesses += 1
  if ans == "y"
    arr.each do |e|
      arr[count.to_i] = "NIL" if e[0].to_s.downcase.match /[g-m]/
      count += 1
    end
  else
    arr.each do |e|
      arr[count.to_i] = "NIL" if e[0].to_s.downcase.match /[a-f]/
      count += 1
    end
  end
end
arr.delete("NIL")
if ((arr.length.to_i > 2) and (upper == 1))
  count = 0
  puts "Is your pokemons starting letter between n and r (y/n)"
  ans = gets.chomp
  ans = valid(ans)
  guesses += 1
  if ans == "y"
    arr.each do |e|
      arr[count.to_i] = "NIL" if e[0].to_s.downcase.match /[s-z]/
      count += 1
    end
  else
    arr.each do |e|
      arr[count.to_i] = "NIL" if e[0].to_s.downcase.match /[n-r]/
      count += 1
    end
  end
end
arr.delete("NIL")
got_it = false
arr.each do |e|
  puts "Is #{e} your pokemon? (y/n)"
  ans = gets.chomp
  ans = valid(ans)
  guesses += 1
  if ans == "y"
    got_it = true
    break
  end
end

if got_it == true
  puts "\n So it took me #{guesses} number of guesses!. Thanks for playing!"
else
  puts "Sorry, could not find your pokemon"
end
