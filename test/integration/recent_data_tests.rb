require 'test_helper'

class RecentDataTests < Minitest::Test

  def setup
    BounceHammerAPI.settings = {
      'bounceHammerBinDir' => File.join(BounceHammerAPI.root, 'test/binstubs')
    }
  end


  def test_seven_years_ago
    data_dumper = BounceHammerAPI::DataDumper.new({ 'howrecent' => '7y' })
    results     = JSON.parse(data_dumper.results)
    assert_equal([sender_zero_one], results)
  end


  def test_one_year_ago
    data_dumper = BounceHammerAPI::DataDumper.new({ 'howrecent' => '1y' })
    results     = JSON.parse(data_dumper.results)
    assert_equal([], results)
  end


  def test_fifteen_years_ago
    data_dumper = BounceHammerAPI::DataDumper.new({ 'howrecent' => '15y' })
    results     = JSON.parse(data_dumper.results)
    assert_equal([sender_zero_one, sender_zero_two], results)
  end


# Example Bounce Data ##########################################################


  def sender_zero_one
    { "bounced" => 1234567890,
      "addresser" => "sender01@example.jp",
      "recipient" => "user01@example.org",
      "senderdomain" => "example.jp",
      "destination" => "example.org",
      "reason" => "userunknown",
      "hostgroup" => "reserved",
      "provider" => "rfc2606",
      "frequency" => 1,
      "description" => {
        "deliverystatus" => "5.0.0",
        "diagnosticcode" => "Example1",
        "timezoneoffset" => "+0900"
      },
      "token" => "8dbb1b9ce9cc47eb6bb1316096c858cd"
    }
  end

  def sender_zero_two
    { "bounced" => 1011121314,
      "addresser" => "sender02@example.jp",
      "recipient" => "user02@example.org",
      "senderdomain" => "example.jp",
      "destination" => "example.org",
      "reason" => "hostunknown",
      "hostgroup" => "reserved",
      "provider" => "reserved",
      "frequency" => 1,
      "description" => {
        "deliverystatus" => "5.2.2",
        "diagnosticcode" => "Example2",
        "timezoneoffset" => "-0400"
      },
      "token" => "ac69fa7503ac32dc0291a91fd90e7ea3"
    }
  end


end
