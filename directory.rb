@students = [] #empty array accessible to all methods

def print_menu
  # print the menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  # repeat until the user wants to exit
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  # do what user has asked
  case selection
    when "1"
      # input the students
      @students = input_students
    when "2"
      # show the students
      show_students
    when "3"
      # save the list to the file
      save_students
    when "4"
      load_students
    when "9"
      exit # terminate the program
    else
      puts "I don't know what you meant, try again"
  end
end

def save_at_students(name, age, nationality, cohort)
  @students << {name: name, age: age, nationality: nationality, cohort: cohort}
end

def input_students
  puts "- Please enter the names of the students:"
  puts "To finish, just hit return twice."
  name = STDIN.gets.gsub!(/\s/, '')
  # while the name is not empty
  while !name.empty? do
    #name starts with "s" and has length < 12
    if name.length < 12 && name.start_with?('s')
      puts "- Please enter the age of the students:"
      # using gsub instead of chomp to delete the new lines
      age = STDIN.gets.gsub!(/\s/, '')
      puts "- Please enter the nationality:"
      nationality = STDIN.gets.gsub!(/\s/, '')
      puts "- Please enter your cohort"
      cohort_input = STDIN.gets.gsub!(/\s/, '')
      if cohort_input == ''
        cohort = :november
        puts cohort
      else
        cohort = cohort_input.to_sym
        puts cohort
      end
      # save users inputs in the students array
      save_at_students(name, age, nationality, cohort.to_sym)
      puts "Now we have #{@students.count} students"
      puts "- Please enter the names of the students:"
      puts "To finish, just hit return twice"
      name = STDIN.gets.gsub!(/\s/, '')
    else
      # if the user gives a name not starting with "s", or longer than 12 characters
      # he can give the next name
      puts "- Please enter the names of the students:"
      puts "To finish, just hit return twice"
      name = STDIN.gets.gsub!(/\s/, '')
    end
	end
  # students array sorted with the cohort
  @students.sort_by! {|student| student[:cohort] }
end

def show_students
  print_header
  print_students_list
  print_footer
end

def student_or_students(n)
  # choose between student and students according to the number of them
  if
    n > 1
    "students"
  else
    "student"
  end
end

def print_header
  if @students != []
    puts " The students of Villains Academy ".center(70, "* ")
    puts "--------------------------------".center(70)
  end
end

def print_students_list
  if @students != []
    i = 0
    while i < @students.length
      puts "#{i + 1}. #{@students[i][:name]}, #{@students[i][:age]}, #{@students[i][:nationality]} (#{@students[i][:cohort]} cohort) ".center(70)
      i += 1
    end
  end
end

def print_footer
  if @students != []
    puts "Overall, we have #{@students.count} great #{student_or_students(@students.count)}".center(70)
  end
end

# save students to a file
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:nationality], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  #load students.csv file
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, age, nationality, cohort = line.chomp.split(',')
    save_at_students(name, age, nationality, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from tah command lines
  return if filename.nil? #return if it is not given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
