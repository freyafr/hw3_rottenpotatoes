# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
   @movie = Movie.create(:title => movie["title"], :rating => movie["rating"], :release_date=> movie["release_date"])
	assert @movie!=nil, "Failed to save"
    
  end
  #assert true, "Unimplmemented"
end

#Given /I check the following ratings: .*/ do |rating_list|
 
#rating_list.split(',').each do  |rating| 
#  check ("ratings_"+rating.delete("()")) 
#end
#end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #print page.html	
  @i=0
  @p1=0
  @p2=0
  @elem1=e1.delete("""'")
  @elem2=e2.delete("""'")
  page.all('table#movies tr').each do |row| 
    #puts row.value 
    if row.has_content?(@elem1) 
      @p1=@i
    end
    if row.has_content?(@elem2) 
      @p2=@i
    end
  @i+=1	
  end
  
  assert @p1<@p2 
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
 
rating_list.split(',').each do  |rating| 
 if uncheck =="un"
   uncheck ("ratings_"+rating.delete("()'"))
 else
    check ("ratings_"+rating.delete("()'"))
 end
end



#uncheck ? "When I uncheck (rating)": "When I check (rating)" }
#rating_list.split(',').each { |rating| uncheck==true ? uncheck ("ratings_"+rating.delete("()")) : check ('ratings_'+rating.delete("()")) }
  
  #end    
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end
