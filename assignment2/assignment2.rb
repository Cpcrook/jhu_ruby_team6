class DomainCounter
  def initialize
    @domains_count = {hotmail: 0, yahoo: 0, gmail: 0}
  end

  def countDomains(file)
    #change directory to the current directory
    Dir.chdir(File.dirname(__FILE__))

    words = IO.read(file).split(/\s+/)
    @domains_count[:hotmail] = words.count {|word| word =~ /.*@hotmail.com/}
    @domains_count[:yahoo] = words.count {|word| word =~ /.*@yahoo.com/}
    @domains_count[:gmail] = words.count {|word| word =~ /.*@gmail.com/}

    #return self to enable method chaining
    self
  end

  def display
    #convert @domains_count to array, sort it, and convert back to hash
    counts = @domains_count.to_a.sort.to_h
    counts.each do |key, value|
      #right justify the output strings
      puts "#{key}.com: #{value} time(s)".rjust(25)
    end
  end
end

counter = DomainCounter.new
counter.countDomains('assignment_two_text.txt').display
