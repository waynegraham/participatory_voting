# frozen_string_literal: true

module ApplicationHelper
  def format_icon(format)
    icon = case format
           when 'NDSA Working Group Meeting'
             'users'
           when 'Presentation'
             'user'
           when 'Dork Shorts'
             'hand-spock-o'
           when 'Snapshot'
             'camera'
           when 'Workshop'
             'map-pin'
           when 'Panel'
             'users'
           when 'Talks or Demos'
             'desktop'
           when 'Poster'
             'map-o'
           when 'Hands-on Workshop'
             'hand-lizard-o'
           # icon = 'hand-spock-o'
           when 'Lightning Talk'
             # icon = 'lightbulb-o'
             'bolt'
           when 'Lunchtime Working Session'
             'flask'
           else
             ''
           end

    "<span class='fa fa-#{icon}' aria-hidden='true'></span>".html_safe
  end
end
