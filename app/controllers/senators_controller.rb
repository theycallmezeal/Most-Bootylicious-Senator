class SenatorsController < ApplicationController
	def score
		
		if params["winner"] != nil
			winner = Senator.find(params["winner"]);
			winner.score = winner.score + 1;
			winner.save();
			
			loser = Senator.find(params["loser"]);
			loser.score = loser.score - 1;
			loser.save();
		end
		
		redirect_to "/vote"
	end
	
	def vote
		offset_1 = rand(Senator.count);
		offset_2 = rand(Senator.count);
		while offset_2 == offset_1 do
			offset_2 = rand(Senator.count);
		end
		
		@random_1 = Senator.offset(offset_1).first;
		@random_2 = Senator.offset(offset_2).first;
	end
	
	def new
		@senator = Senator.new;
	end
	
	def create
		@senator = Senator.new(senator_params);
		@senator.save();
	end
	
	def display
		demcount = 0.0;
		demscore = 0.0;
		repcount = 0.0;
		repscore = 0.0;
		fcount = 0.0;
		fscore = 0.0;
		mcount = 0.0;
		mscore = 0.0;
		
		Senator.find_each do |senator|
		
			if senator.party == "Democratic"
				demcount += 1;
				demscore += senator.score;
			else
				repcount += 1;
				repscore += senator.score;
			end
			
			if senator.gender == "Female"
				fcount += 1;
				fscore += senator.score;
			else
				mcount += 1;
				mscore += senator.score;
			end
		end
		
		@demavg = (demscore / demcount).round(2);
		@repavg = (repscore / repcount).round(2);
		@favg = (fscore / fcount).round(2);
		@mavg = (mscore / mcount).round(2);
	end
	
	private
	def senator_params
		params.require(:senator).permit(:name, :score, :gender, :state, :party);
    end
end
