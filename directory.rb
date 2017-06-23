def input_students
  puts "- Please enter the names of the students:"
  puts "To finish, just hit return twice."
  students = []
  name = gets.gsub!(/\s/, '')
  
  while !name.empty? do
    #name starts with "s" and has length < 12
    if name.length < 12 && name.start_with?('s')
      puts "- Please enter the age of the students:"
      age = gets.gsub!(/\s/, '')
      puts "- Please enter the nationality:"
      nationality = gets.gsub!(/\s/, '')
      puts "- Please enter your cohort"
      cohort_input = gets.gsub!(/\s/, '')
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

def student_or_students(n)
  if
    n > 1
    "students"
  else
    "student"
  end
end

def print_header(students)
  if students != []
    puts " The students of Villains Academy ".center(70, "* ")
    puts "--------------------------------".center(70)
  end
end

def print(students)
  if students != []
    i = 0
    while i < students.length
      puts "#{i + 1}. #{students[i][:name]}, #{students[i][:age]}, #{students[i][:nationality]} (#{students[i][:cohort]} cohort) ".center(70)
      i += 1
    end
  end
end

def print_footer(students)
  if students != []
    puts "Overall, we have #{students.count} great #{student_or_students(students.count)}".center(70)
  end
end

students = input_students
print_header(students)
print(students)
print_footer(students)
