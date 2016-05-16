module ApplicationHelper
  def format_icon(format)
    case format
      when 'Presentation'
          icon = 'user'
      when 'Snapshot'
        icon = 'camera'
      when 'Workshop'
        icon = 'map-pin'
      when 'Panel'
        icon = 'users'
      when 'Talks or Demos'
        icon = 'desktop'
      when 'Poster'
        icon = 'map-o'
      when 'Hands-on Workshop'
        # icon = 'hand-lizard-o'
        icon = 'hand-spock-o'
      when 'Lunchtime Working Session'
        icon = 'flask'
      else
        icon = ""
    end

    "<span class='fa fa-#{icon}' aria-hidden='true'></span>".html_safe
  end
end
