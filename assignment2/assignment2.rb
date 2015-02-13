class DomainCounter
  def initialize
    @domains_count = {}
  end

  def parseDomain(emailAddress)
	#CPC: split the email to get the domain after the @
	domain_plus_tail = emailAddress.split(/\@+/)[1]
	
	#CPC: assume 3-letter TLD so we can trim junk chars off the end
	tld_end = domain_plus_tail.index(".")+3 
	
	#CPC: return the substring to the end of the domain
	return domain_plus_tail[0..tld_end]
  end
  
  def countDomains(file)
    #change directory to the current directory
    Dir.chdir(File.dirname(__FILE__))

	#split on spaces to get words
    words = IO.read(file).split(/\s+/)
	
	#CPC: match more broadly to get all of the email addresses so this works for any domain
	all_emails = words.select{|word| word =~ /.@*.com/}
	
	#CPC: put all email addresses through the parseDomain function to get the list of domains
	#CPC: collect technically isn't a loop construct...
	domains = all_emails.collect{|word| parseDomain(word)}
	
	#CPC: create a hash entry in @domains_count with the name of the domain as the key
	# and the count of each unique domain, measured by the number of times it appears in the @domains array
	domains.uniq.collect{|domain| @domains_count[:"#{domain}"] = domains.count(domain)}
	
    #return self to enable method chaining
    self
  end

  def display
    #convert @domains_count to array, sort it, and convert back to hash
    counts = @domains_count.to_a.sort.to_h
    counts.each do |key, value|
      #right justify the output strings
      puts "#{key}: #{value} time(s)".rjust(25)
    end
  end
  
  private :parseDomain
end

counter = DomainCounter.new
counter.countDomains('assignment_two_text.txt').display
