module VotesHelper
  def vote_box(voteable, source)
    %@
    <form action='#{votes_path}' method='post'>
      #{token_tag}
      <span class='votes'>
        #{hidden_field_tag "voteable_type", voteable.class.name}
        #{hidden_field_tag "voteable_id", voteable.id}
        #{hidden_field_tag "source", source}
        <button type="submit" name="vote_up" value="1" style="display:block; background-color: transparent">
          #{image_tag("vote_up.png", :width => 30, :height => 22)}
        </button>
        <span style="display:block">
          #{calculate_votes_average(voteable)}
        </span>
        <button type="submit" name="vote_down" value="-1" style="display:block; background-color: transparent">
          #{image_tag("vote_down.png", :width => 30, :height => 22)}
        </button>
      </span>
    </form>
    @
  end

  def calculate_votes_average(voteable)
    if voteable.respond_to?(:votes_average)
      voteable.votes_average
    else
      t = 0
      voteable.votes.each {|e| t += e.value }
      t
    end
  end
end
