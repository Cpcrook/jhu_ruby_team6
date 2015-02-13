class DomainCounter
  def initialize
    @domains_count = {}
  end

  def parseDomain(emailAddress)
	#CPC: split the email to get the domain after the @
	split_email = emailAddress.split(/\@+/)
	
	#CPC: a little error checking in case there is a bogus @
	if split_email.count() > 1
		domain_plus_tail = split_email[1]
	else
		domain_plus_tail = split_email[0]
	end
	
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
	#CPC: the collect statement (not a loop!) could be chained onto the line above (didn't for clarity)
	domains = all_emails.collect{|word| parseDomain(word)}
	
	#CPC: Group down on the domains collection into a hash
	domains = domains.group_by{|domain| domain}
	
	#CPC: Merge the hash into itself so the code block for duplicate handling is used to provide new values 
	#for each key (the count instead of an array of parsed domain elements)
	@domains_count = domains.merge(domains){|key, old, new| old.count()}

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
