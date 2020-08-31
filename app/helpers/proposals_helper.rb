# frozen_string_literal: true

##
# Helpers for Proposal
module ProposalsHelper
  ##
  # Display formatted likes
  #
  # @param proposal Proposal to display likes for
  # @return Formatted HTML (heart icon with number of votes)
  def display_likes(proposal)
    '<span class="fas fa-heart"></span> '.html_safe + \
      pluralize(proposal.cached_votes_score, 'Like')
  end

  ##
  # Wrapper for displaying statistics about the voting
  #
  # @param title Title to use on the card
  # @param text Text to use on the card
  # @return String formatted HTML Boostrap card
  def stats_card(title, text)
    "<div class='card'>
      <div class='card-body'>
        <h5 class='card-title'>
          #{title}
        </h5>
        <p class='card-text'>#{text}</p>
      </div>
    </div>".html_safe
  end

  ##
  # Map icons to the formats
  #
  # @param format Format from data
  # @return String HTML string of FontAwesome icon
  def format_icon(format)
    icon = case format
           when 'NDSA Working Group Meeting'
             'users'
           when 'Presentation'
             'user'
           when 'Dork Shorts'
             'hand-spock'
           when 'Snapshot'
             'camera'
           when 'Workshop'
             'map-pin'
           when 'Panel'
             'users'
           when 'Talks or Demos'
             'desktop'
           when 'Poster'
             'map'
           when 'Hands-on Workshop'
             'hands-helping'
           # icon = 'hand-spock-o'
           when 'Lightning Talk'
             # icon = 'lightbulb-o'
             'bolt'
           when 'Lunchtime Working Session'
             'flask'
           else
             'user'
           end

    "<span class='fas fa-#{icon}' aria-hidden='true'></span>".html_safe
  end
end
