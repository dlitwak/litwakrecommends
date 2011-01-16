class PagesController < ApplicationController
  def home
    @title="Home"
	@posts = Post.all
	@count = Post.count
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  def help
    @title = "Help"
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
