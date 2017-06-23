def input_students
  puts "- Please enter the names of the students:"
  puts "To finish, just hit return twice."
  students = []
  name = gets.chomp
  while !name.empty? do
    #name starts with "s" and has length < 12
    if name.length < 12 && name.start_with?('s')
      puts "- Please enter the age of the students:"
      age = gets.chomp
      puts "- Please enter the nationality:"
      nationality = gets.chomp
      puts "- Please enter your cohort"
      cohort_input = gets.chomp
      if cohort_input == ''
        cohort = :november
        puts cohort
      else
        cohort = cohort_input.to_sym
        puts cohort
      end
      students << {name: name, age: age, nationality: nationality, cohort: cohort}
      puts "Now we have #{students.count} students"
      puts "- Please enter the names of the students:"
      puts "To finish, just hit return twice"
      name = gets.chomp
    else
      puts "- Please enter the names of the students:"
      puts "To finish, just hit return twice"
      name = gets.chomp
    end
	end
  students.sort_by! {|student| student[:cohort] }
end

def print_header
  puts " The students of Villains Academy ".center(70, "* ")
  puts "--------------------------------".center(70)
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:age]}, #{students[i][:nationality]} (#{students[i][:cohort]} cohort) ".center(70)
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(70)
end

students = input_students
print_header
print(students)
print_footer(students)
