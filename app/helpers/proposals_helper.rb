# frozen_string_literal: true

##
# Helpers for Proposal
module ProposalsHelper
  def display_likes(proposal)
    '<span class="fas fa-heart"></span> '.html_safe + \
      pluralize(proposal.cached_votes_score, 'Like')
  end

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
