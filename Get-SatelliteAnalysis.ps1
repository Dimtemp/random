$url = 'https://www.ucsusa.org/sites/default/files/2020-05/UCS-Satellite-Database-4-1-2020.txt'
$r = Invoke-WebRequest $url -UseBasicParsing

# convert to CSV by hand

$sat = import-csv .\Downloads\UCS-Satellite-Database-4-1-2020.csv -Delimiter ';'

$sat.count

$sat|group 'class of orbit'|sort count -Descending

$sat|group Contractor|sort count -Descending | select -first 10 count, name

$sat|group 'Country of Contractor'|sort count -Descending | select -first 10 count, name
$sat|group 'Country of Operator/Owner'|sort count -Descending | select -first 10 count, name
$sat|group 'Country/Org of UN Registry'|sort count -Descending | select -first 10 count, name

$sat|group 'Expected Lifetime (yrs.)'|select  count, @{name='years';e={[float]($_.name.replace(',','.'))}}|sort count -Descending

$sat|group 'Launch Site' | sort count -Descending | select -first 10 count, name

$sat|group 'Launch Vehicle' | sort count -Descending | select -first 10 count, name
$sat|group 'Longitude of GEO (degrees)' | sort count -Descending | select -first 10 count, name
$sat|group 'Operator/Owner' | sort count -Descending | select -first 10 count, name

$sat|group 'Perigee (km)' | sort count -Descending | select -first 10 count, name
$sat|group 'Period (minutes)' | sort count -Descending | select -first 10 count, name
$sat|group 'Purpose' | sort count -Descending | select -first 10 count, name
$sat|group 'Source Used for Orbital Data' | sort count -Descending | select -first 10 count, name

$sat|group 'Type of Orbit' | sort count -Descending | select -first 10 count, name
$sat|group 'Type of Orbit' | sort count -Descending | select count, name

$sat|group 'Users' | sort count -Descending | select count, name -first 10


<#
Total satellites: 2666

Class of Orbit
 1918 LEO       
  554 GEO       
  137 MEO       
   57 Elliptical

Top 10 contractors
358 SpaceX
231 Planet Labs, Inc.
105 Space Systems/Loral
 98 China Academy of Space Technology (CAST)
 89 Thales Alenia Space
 88 Spire Global
 75 Thales Alenia Space/Orbital ATK
 74 OneWeb Satellites/Airbus
 73 Boeing Satellite Systems
 66 Orbital Sciences Corp.

Top 10 Country of Contractor
1284 USA
 356 China
 164 Russia
 111 UK
  89 France
  75 France/Italy/USA
  71 Japan
  60 SpaceX
  60 India
  38 Italy

Top 5 lifetime
   #    Lifetime in years
 403    15
 180     5
  85    12
  78    10
  77     7

Top 10 Launch Site
603 Cape Canaveral
360 Baikonur Cosmodrome
334 Satish Dhawan Space Centre
276 Guiana Space Center
243 Vandenberg AFB
145 Jiuquan Satellite Launch Center
119 Xichang Satellite Launch Center
113 Plesetsk Cosmodrome
111 Taiyuan Launch Center
 64 Vostochny Cosmodrome

Top 10 Launch Vehicle
539 Falcon 9
254 PSLV
123 Soyuz 2.1a
 97 Atlas 5
 87 Ariane 5
 86 Dnepr
 79 Long March 2D
 79 Soyuz-2.1b
 73 Ariane 5 ECA
 71 Proton M

Let op! Er kunnen MEERDERE satellieten worden gelanceerd met 1 raket.

Top 10 Operator/Owner
358 SpaceX
246 Planet Labs, Inc.
109 Ministry of Defense
 89 Spire Global Inc.
 78 Iridium Communications, Inc.
 74 OneWeb Satellites
 68 People's Liberation Army (C41)
 49 Chinese Defense Ministry
 48 SES S.A.
 45 Indian Space Research Organization (ISRO)

Top 10 Period (minutes)
195 94,6
184 1436,1
 82 97
 69 90,5
 64 94,5
 60 94
 58 95,7
 52 95,6
 51 96,3
 51 94,7

Eigenlijk maar 2 groepen: circa 95 minuten rondje om de aarde en de geostationaire satellieten, zoals Astra (ca 1400 minuten).

Top 5 Power (watts)
33 1.500
26 1.700
25 1.136
24 160
23 300
22 13.000
22 1.000
18 120

Top 10 Purpose
1194 Communications
 867 Earth Observation
 296 Technology Development
 136 Navigation/Global Positioning
  84 Space Science
  15 Earth Science
  12 Navigation/Regional Positioning
   9 Technology Demonstration
   8 Space Observation
   8 Communications/Technology Development


All types of orbit
931 Sun-Synchronous
770 Non-Polar Inclined
619 unspecified
269 Polar
 38 Equatorial
 20 Molniya
  9 Deep Highly Eccentric
  9 Elliptical
  1 Cislunar

Vooral de onderste zijn interessant

Top 10 users
1439 Commercial
 436 Government
 338 Military
 133 Civil
 114 Government/Commercial
  77 Military/Commercial
  55 Military/Government
  43 Government/Civil
  11 Commercial/Civil
   6 Military/Civil

More info
https://www.ucsusa.org/resources/satellite-database

#>
