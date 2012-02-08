class PotentialUserMailer < ActionMailer::Base
  def potential_lister_message(email)
    from "support@cozi.ly"
    bcc "notifications@cozi.ly"
    recipients email
    subject "List your apartment on Cozily"
  end

   def potential_finder_message(email)
    from "support@cozi.ly"
    bcc "notifications@cozi.ly"
    recipients email
    subject "Find your apartment on Cozily"
  end

  def inquiry(title, sender, first_name, last_name, recipient)
    from sender
    recipients recipient
    subject "Re: #{title}"

    @salutation = ["Hey there", "Hi", "Greetings", "Hey"].rand
    @question = ["Is this still available?", "Could you tell me if your item is still available?", "Did you sell this yet?", "Did anyone buy this yet?", "Did your item sell yet?"].rand
    @valediction = ["Best", "Thanks", "Thank you", "Let me know"].rand

    @first_name = first_name
    @last_name = last_name
    @sender = sender
  end
end
