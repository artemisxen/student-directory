def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    if name.length < 12 && name.start_with?('s')
      puts "Please enter the age of the students"
      age = gets.chomp
      puts "Please enter the nationality"
      nationality = gets.chomp
      students << {name: name, age: age, nationality: nationality, cohort: :november}
      puts "Now we have #{students.count} students"
      puts "Please enter the names of the students"
      puts "To finish, just hit return twice"
      name = gets.chompc
    else
      puts "Please enter the names of the students"
      puts "To finish, just hit return twice"
      name = gets.chomp
   end
 end
   students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:age]}, #{students[i][:nationality]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens untill we call the methods
students = input_students
print_header
print(students)
print_footer(students)
