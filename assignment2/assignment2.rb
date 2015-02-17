class DomainCounter
  def initialize
    @domains_count = {}
  end

  def parseDomain(emailAddress)
    #CPC: split the email to get the domain after the @
    split_email = emailAddress.split(/\@/)

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
    all_emails = words.select{|word| word =~ /.+@.+\..+/}

    #CPC: put all email addresses through the parseDomain function to get the list of domains
    #CPC: the collect statement (not a loop!) could be chained onto the line above (didn't for clarity)
    domains = all_emails.collect {|word| parseDomain(word)}

    #CJB: for each unique domain, create a key in @domains_count and set the
    # value to the number of times the domain appears in the words array
    domains.uniq.each do |domain|
      @domains_count[domain.to_sym] = words.count{|word| word =~ /#{domain}/}
    end

    #CJB: return self to enable method chaining
    self
  end

  def display
    #CJB: convert @domains_count to array, sort it, and convert back to hash
    counts = @domains_count.to_a.sort.to_h
    counts.each do |key, value|
      #CJB: right justify the output strings
      puts "#{key}: #{value} time(s)".rjust(25)
    end
  end

  private :parseDomain
end

counter = DomainCounter.new
counter.countDomains('assignment_two_text.txt').display
