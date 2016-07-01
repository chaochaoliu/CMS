module MessagesHelper

  def emailArrToHtml(emails)
    # result = ""
    # emails.each do |email|
    #   result = "#{result} <span> #{email} </span>"
    # end
    # return result
    emails.join(",")
  end

end
