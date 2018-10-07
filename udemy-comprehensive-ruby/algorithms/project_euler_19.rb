# You are given the following information, (...)
# 1 Jan 1900 was a Monday (...)
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?

require 'date'

start_date = Time.local(1901)
end_date = Time.local(2000, 12, 31)
sundays_on_first_of_the_month = 0

while start_date <= end_date
  if start_date.strftime("%A") == "Sunday" && start_date.strftime("%d") == "01"
    sundays_on_first_of_the_month += 1
  end
  start_date += 86400  # Increments the start_date by 1 day or 86400 seconds
end

p sundays_on_first_of_the_month