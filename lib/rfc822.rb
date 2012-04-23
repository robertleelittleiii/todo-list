
# RFC822 Email Address Regex
# --------------------------
#
# Originally written by Cal Henderson
# c.f. http://iamcal.com/publish/articles/php/parsing_email/
#
# Translated to Ruby by Tim Fletcher, with changes suggested by Dan Kubb.
#
# Licensed under a Creative Commons Attribution-ShareAlike 2.5 License
# http://creativecommons.org/licenses/by-sa/2.5/
#

module RFC822
  EmailAddress = begin
      alpha = "a-zA-Z"
            digit = "0-9"
            atext = "[#{alpha}#{digit}\!\#\$\%\&\'\*+\/\=\?\^\_\`\{\|\}\~\-]"
            dot_atom_text = "#{atext}+([.]#{atext}*)*"
            dot_atom = "#{dot_atom_text}"
            qtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
            text = "[\\x01-\\x09\\x11\\x12\\x14-\\x7f]"
            quoted_pair = "(\\x5c#{text})"
            qcontent = "(?:#{qtext}|#{quoted_pair})"
            quoted_string = "[\"]#{qcontent}+[\"]"
            atom = "#{atext}+"
            word = "(?:#{atom}|#{quoted_string})"
            obs_local_part = "#{word}([.]#{word})*"
            local_part = "(?:#{dot_atom}|#{quoted_string}|#{obs_local_part})"
            no_ws_ctl = "\\x01-\\x08\\x11\\x12\\x14-\\x1f\\x7f"
            dtext = "[#{no_ws_ctl}\\x21-\\x5a\\x5e-\\x7e]"
            dcontent = "(?:#{dtext}|#{quoted_pair})"
            domain_literal = "\\[#{dcontent}+\\]"
            obs_domain = "#{atom}([.]#{atom})*"
            domain = "(?:#{dot_atom}|#{domain_literal}|#{obs_domain})"
            addr_spec = "#{local_part}\@#{domain}"
            pattern = /^#{addr_spec}$/
        end
  end


