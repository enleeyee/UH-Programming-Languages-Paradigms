require "processor"

describe "Schedule Tests" do
  it "true is true" do
    expect(true).to be_truthy
  end

  it "first line of the DSL" do
    result = schedule meeting

    expect(result).to match("Meeting:")
  end

  it "meeting name can be set" do 
    result = schedule meeting do
      name 'Early Admissions'
    end

    expect(result).to match("Meeting: Early Admissions")
  end

  it "meeting start time can be set" do
    result = schedule meeting do
      name 'Early Admissions'
      starts 1000
    end

    expect(result).to match("Meeting: Early Admissions, start time: 10:00")
  end

  it "meeting end time can be set" do 
    result = schedule meeting do
      name 'Early Admissions'
      starts 1000
      ends 1100
    end

    expect(result).to match("Meeting: Early Admissions, start time: 10:00, end time: 11:00")
  end

  it "meeting duration can be calculated" do 
    result = schedule meeting do
      name 'Early Admissions'
      starts 1000
      ends 1100
    end
    
    expect(result).to match("Meeting: Early Admissions, start time: 10:00, end time: 11:00, duration: 1h 0m")
  end

  it "meeting date can be set" do
    result = schedule meeting do
      name 'Early Admissions'
      starts 1000
      ends 1100
      on 10/31/2024
    end
    
    expect(result).to match("Meeting: Early Admissions, start time: 10:00, end time: 11:00, duration: 1h 0m, date: 10/31/2024")
  end

  it "meeting can add participants" do 
    result = schedule meeting do
      name 'Early Admissions'
      starts 1000
      ends 1100
      on 10/31/2024
      participants 'Kim R.', 'Mike B.', 'Paula P.', 'Chin Z.'
    end

    expect(result).to match("Meeting: Early Admissions, start time: 10:00, end time: 11:00, duration: 1h 0m, date: 10/31/2024, number of attendees: 4")
  end
end
