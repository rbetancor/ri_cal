require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])
require 'rubygems'
require 'tzinfo'

describe RiCal::Component::TZInfoTimezone do

  it "should produce an rfc representation" do
    tz = RiCal::Component::TZInfoTimezone.new(TZInfo::Timezone.get("America/New_York"))
    rez = tz.to_rfc2445_string(tz.local_to_utc(DateTime.parse("Apr 10, 2007")),
    tz.local_to_utc(DateTime.parse("Apr 6, 2008")))
    rez.should == <<-ENDDATA
BEGIN:VTIMEZONE
TZID;X-RICAL-TZSOURCE=TZINFO:America/New_York
BEGIN:DAYLIGHT
DTSTART:20070311T030000
RDATE:20070311T030000,20080309T030000
TZOFFSETFROM:-0500
TZOFFSETTO:-0400
TZNAME:EDT
END:DAYLIGHT
BEGIN:STANDARD
DTSTART:20071104T010000
RDATE:20071104T010000
TZOFFSETFROM:-0400
TZOFFSETTO:-0500
TZNAME:EST
END:STANDARD
END:VTIMEZONE
ENDDATA
  end
end