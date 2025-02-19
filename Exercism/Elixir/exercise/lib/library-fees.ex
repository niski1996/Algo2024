defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
    %NaiveDateTime{hour: hour} = datetime
    hour < 12
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date
    |> Date.add((if before_noon?(checkout_datetime), do: 28, else: 29))

  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_date = NaiveDateTime.to_date(actual_return_datetime)
    case Date.compare(planned_return_date, actual_date) do
      :lt -> Date.diff(actual_date,planned_return_date)
      :eq -> 0
      :gt -> 0
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, actual_return, rate) do
    checkout_dt = datetime_from_string(checkout)
    actual_return_dt = datetime_from_string(actual_return)
    planned_return_date = return_date(checkout_dt)
    late_days = days_late(planned_return_date, actual_return_dt)
    if monday?(actual_return_dt) do

      div(late_days*rate, 2)
    else
      late_days * rate
    end
  end

end
