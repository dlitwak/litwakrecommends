class PagesController < ApplicationController
  def home
	@title="Home"
	@metadescription = "LitwakRecommends is David Litwak's personal travel blog, with advice on how to save money while backpacking around
	the world."
	@posts = Post.all
	@count = Post.count
  end
  def hostels
	@hostels = Hostel.all
	@title = "Litwak Recommends Personal Party Hostel Recommendations"
	@metadescription = "LitwakRecommends party hostel recommendations. Personal experience has led me to recommend the following hostels for young
	travelers looking for a good party atmosphere."
	@posts = Post.all
  end
  def contact
    @title = "Contact"
	@metadescription = "Contact LitwakRecommends author David Litwak"
	@posts = Post.all
  end

  def about
    @title = "About David Litwak"
	@metadescription = "About LitwakRecommends author David Litwak"
	@posts = Post.all
  end
  def help
    @title = "Help"
	@posts = Post.all
  end
  
  def live_search
		@query = params[:query]
		
		@results = Hostel.find(:all, :conditions => [ "city LIKE ?", "%" + @query + "%"])
  end
  
  
  def country_select
	englishCities=["London", "Liverpool", "Manchester", "Dover", "Brighton", "Everton"];
	frenchCities=["Paris", "Lourdes", "St. Malo", "Toulouse", "Aix-en-Provence", "Tours", "Montpelier", "Nancy"];
	spanishCities=["Malaga", "Alicante", "Valencia", "Pamplona", "Madrid", "Cadiz", "Barcelona"];
	str="";
	
	if params[:countries].index('France') != nil
		render :partial => "options",
			:locals => { :countryList => FrenchCities, :country => "France" }
	elsif params[:countries].index('England') != nil
		render :partial => "options",
			:locals => { :countryList => EnglishCities, :country => "England" }
	elsif params[:countries].index('Spain') != nil
		render :partial => "options",
			:locals => { :countryList => SpanishCities, :country => "Spain" }
	else
		str="<select id='individual' name='individual'>
			<option>unknown</option></select>";
		render :text => str;
	end
  end
  def say_when
	render_text "<p>The time is <b>" + DateTime.now.to_s + "</b></p>"
  end
end
