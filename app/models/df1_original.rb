module CityMappings
  # That's a lot of cities!
  @@ALL_CITIES = {
    "Gloversville, NY" => "104",
    "Hudson, NY" => "104",
    "Glens Falls, NY" => "104",
    "Amsterdam, NY" => "104",
    "Albany-Schenectady-Troy, NY" => "104",
    "Espa?ola, NM" => "106",
    "Santa Fe, NM" => "106",
    "Las Vegas, NM" => "106",
    "Albuquerque, NM" => "106",
    "Los Alamos, NM" => "106",
    "Altoona, PA" => "107",
    "Huntingdon, PA" => "107",
    "Amarillo, TX" => "108",
    "Borger, TX" => "108",
    "Pampa, TX" => "108",
    "Oshkosh-Neenah, WI" => "118",
    "Appleton, WI" => "118",
    "Marion, NC" => "120",
    "Asheville, NC" => "120",
    "Brevard, NC" => "120",
    "Cedartown, GA" => "122",
    "Athens-Clarke County, GA" => "122",
    "Rome, GA" => "122",
    "LaGrange, GA-AL" => "122",
    "Cornelia, GA" => "122",
    "Toccoa, GA" => "122",
    "Thomaston, GA" => "122",
    "Gainesville, GA" => "122",
    "Atlanta-Sandy Springs-Alpharetta, GA" => "122",
    "Jefferson, GA" => "122",
    "Prineville, OR" => "140",
    "Bend, OR" => "140",
    "Talladega-Sylacauga, AL" => "142",
    "Jasper, AL" => "142",
    "Birmingham-Hoover, AL" => "142",
    "Cullman, AL" => "142",
    "Bedford, IN" => "144",
    "Bloomington, IN" => "144",
    "Pontiac, IL" => "145",
    "Bloomington, IL" => "145",
    "Lewisburg, PA" => "146",
    "Bloomsburg-Berwick, PA" => "146",
    "Sunbury, PA" => "146",
    "Selinsgrove, PA" => "146",
    "Ontario, OR-ID" => "147",
    "Mountain Home, ID" => "147",
    "Boise City, ID" => "147",
    "Concord, NH" => "148",
    "Worcester, MA-CT" => "148",
    "Boston-Cambridge-Newton, MA-NH" => "148",
    "Manchester-Nashua, NH" => "148",
    "Barnstable Town, MA" => "148",
    "Laconia, NH" => "148",
    "Providence-Warwick, RI-MA" => "148",
    "Bowling Green, KY" => "150",
    "Glasgow, KY" => "150",
    "Raymondville, TX" => "154",
    "Brownsville-Harlingen, TX" => "154",
    "Buffalo-Cheektowaga, NY" => "160",
    "Olean, NY" => "160",
    "Fort Madison-Keokuk, IA-IL-MO" => "161",
    "Burlington, IA-IL" => "161",
    "Burlington-South Burlington, VT" => "162",
    "Barre, VT" => "162",
    "Cape Coral-Fort Myers, FL" => "163",
    "Naples-Marco Island, FL" => "163",
    "Clewiston, FL" => "163",
    "Sikeston, MO" => "164",
    "Cape Girardeau, MO-IL" => "164",
    "Iowa City, IA" => "168",
    "Cedar Rapids, IA" => "168",
    "Huntington-Ashland, WV-KY-OH" => "170",
    "Portsmouth, OH" => "170",
    "Point Pleasant, WV-OH" => "170",
    "Mount Gay-Shamrock, WV" => "170",
    "Charleston, WV" => "170",
    "Shelby, NC" => "172",
    "Charlotte-Concord-Gastonia, NC-SC" => "172",
    "Albemarle, NC" => "172",
    "Summerville, GA" => "174",
    "Cleveland, TN" => "174",
    "Calhoun, GA" => "174",
    "Dayton, TN" => "174",
    "Dalton, GA" => "174",
    "Athens, TN" => "174",
    "Chattanooga, TN-GA" => "174",
    "Kankakee, IL" => "176",
    "Ottawa, IL" => "176",
    "Chicago-Naperville-Elgin, IL-IN-WI" => "176",
    "Michigan City-La Porte, IN" => "176",
    "Wilmington, OH" => "178",
    "Maysville, KY" => "178",
    "Cincinnati, OH-KY-IN" => "178",
    "New Philadelphia-Dover, OH" => "184",
    "Wooster, OH" => "184",
    "Akron, OH" => "184",
    "Norwalk, OH" => "184",
    "Ashtabula, OH" => "184",
    "Sandusky, OH" => "184",
    "Canton-Massillon, OH" => "184",
    "Cleveland-Elyria, OH" => "184",
    "Indianola, MS" => "185",
    "Cleveland, MS" => "185",
    "Portales, NM" => "188",
    "Clovis, NM" => "188",
    "Columbia, MO" => "190",
    "Mexico, MO" => "190",
    "Moberly, MO" => "190",
    "Columbia, SC" => "192",
    "Newberry, SC" => "192",
    "Orangeburg, SC" => "192",
    "Columbus, GA-AL" => "194",
    "Auburn-Opelika, AL" => "194",
    "Columbus, OH" => "198",
    "Chillicothe, OH" => "198",
    "Bellefontaine, OH" => "198",
    "Cambridge, OH" => "198",
    "Mount Vernon, OH" => "198",
    "Marion, OH" => "198",
    "Washington Court House, OH" => "198",
    "Zanesville, OH" => "198",
    "Columbus, MS" => "200",
    "West Point, MS" => "200",
    "Rockport, TX" => "204",
    "Kingsville, TX" => "204",
    "Corpus Christi, TX" => "204",
    "Alice, TX" => "204",
    "Durant, OK" => "206",
    "Gainesville, TX" => "206",
    "Dallas-Fort Worth-Arlington, TX" => "206",
    "Athens, TX" => "206",
    "Sherman-Denison, TX" => "206",
    "Bonham, TX" => "206",
    "Granbury, TX" => "206",
    "Corsicana, TX" => "206",
    "Mineral Wells, TX" => "206",
    "Clinton, IA" => "209",
    "Davenport-Moline-Rock Island, IA-IL" => "209",
    "Muscatine, IA" => "209",
    "Greenville, OH" => "212",
    "Dayton-Kettering, OH" => "212",
    "Urbana, OH" => "212",
    "Sidney, OH" => "212",
    "Springfield, OH" => "212",
    "Boulder, CO" => "216",
    "Denver-Aurora-Lakewood, CO" => "216",
    "Greeley, CO" => "216",
    "DeRidder, LA" => "217",
    "Fort Polk South, LA" => "217",
    "Ames, IA" => "218",
    "Oskaloosa, IA" => "218",
    "Des Moines-West Des Moines, IA" => "218",
    "Pella, IA" => "218",
    "Detroit-Warren-Dearborn, MI" => "220",
    "Ann Arbor, MI" => "220",
    "Monroe, MI" => "220",
    "Flint, MI" => "220",
    "Adrian, MI" => "220",
    "Sterling, IL" => "221",
    "Dixon, IL" => "221",
    "Ozark, AL" => "222",
    "Dothan, AL" => "222",
    "Eau Claire, WI" => "232",
    "Menomonie, WI" => "232",
    "Edwards, CO" => "233",
    "Glenwood Springs, CO" => "233",
    "Elmira, NY" => "236",
    "Corning, NY" => "236",
    "Las Cruces, NM" => "238",
    "El Paso, TX" => "238",
    "Erie, PA" => "240",
    "Meadville, PA" => "240",
    "Fargo, ND-MN" => "244",
    "Wahpeton, ND-MN" => "244",
    "Lumberton, NC" => "246",
    "Fayetteville, NC" => "246",
    "Laurinburg, NC" => "246",
    "Sanford, NC" => "246",
    "Pinehurst-Southern Pines, NC" => "246",
    "Angola, IN" => "258",
    "Kendallville, IN" => "258",
    "Decatur, IN" => "258",
    "Auburn, IN" => "258",
    "Fort Wayne, IN" => "258",
    "Huntington, IN" => "258",
    "Hanford-Corcoran, CA" => "260",
    "Madera, CA" => "260",
    "Fresno, CA" => "260",
    "Gainesville, FL" => "264",
    "Lake City, FL" => "264",
    "Holland, MI" => "266",
    "Grand Rapids-Kentwood, MI" => "266",
    "Muskegon, MI" => "266",
    "Big Rapids, MI" => "266",
    "Shawano, WI" => "267",
    "Green Bay, WI" => "267",
    "Greensboro-High Point, NC" => "268",
    "Burlington, NC" => "268",
    "Winston-Salem, NC" => "268",
    "Mount Airy, NC" => "268",
    "Greenville, NC" => "272",
    "Kinston, NC" => "272",
    "Washington, NC" => "272",
    "Union, SC" => "273",
    "Seneca, SC" => "273",
    "Greenwood, SC" => "273",
    "Greenville-Anderson, SC" => "273",
    "Gaffney, SC" => "273",
    "Spartanburg, SC" => "273",
    "York-Hanover, PA" => "276",
    "Lebanon, PA" => "276",
    "Harrisburg-Carlisle, PA" => "276",
    "Gettysburg, PA" => "276",
    "Harrisonburg, VA" => "277",
    "Staunton, VA" => "277",
    "Norwich-New London, CT" => "278",
    "Hartford-East Hartford-Middletown, CT" => "278",
    "Laurel, MS" => "279",
    "Hattiesburg, MS" => "279",
    "Hot Springs, AR" => "284",
    "Malvern, AR" => "284",
    "Houston-The Woodlands-Sugar Land, TX" => "288",
    "Brenham, TX" => "288",
    "Bay City, TX" => "288",
    "Huntsville, TX" => "288",
    "El Campo, TX" => "288",
    "Huntsville, AL" => "290",
    "Decatur, AL" => "290",
    "Rexburg, ID" => "292",
    "Idaho Falls, ID" => "292",
    "Blackfoot, ID" => "292",
    "New Castle, IN" => "294",
    "Muncie, IN" => "294",
    "Indianapolis-Carmel-Anderson, IN" => "294",
    "Greensburg, IN" => "294",
    "Columbus, IN" => "294",
    "Crawfordsville, IN" => "294",
    "North Vernon, IN" => "294",
    "Seymour, IN" => "294",
    "Ithaca, NY" => "296",
    "Cortland, NY" => "296",
    "Brownsville, TN" => "297",
    "Jackson, TN" => "297",
    "Jackson, MS" => "298",
    "Brookhaven, MS" => "298",
    "Vicksburg, MS" => "298",
    "Palatka, FL" => "300",
    "St. Marys, GA" => "300",
    "Jacksonville, FL" => "300",
    "Kingsport-Bristol, TN-VA" => "304",
    "Johnson City, TN" => "304",
    "Somerset, PA" => "306",
    "Johnstown, PA" => "306",
    "Paragould, AR" => "308",
    "Jonesboro, AR" => "308",
    "Joplin, MO" => "309",
    "Miami, OK" => "309",
    "Kalamazoo-Portage, MI" => "310",
    "Sturgis, MI" => "310",
    "Coldwater, MI" => "310",
    "Battle Creek, MI" => "310",
    "St. Joseph, MO-KS" => "312",
    "Ottawa, KS" => "312",
    "Warrensburg, MO" => "312",
    "Kansas City, MO-KS" => "312",
    "Lawrence, KS" => "312",
    "Atchison, KS" => "312",
    "Kennewick-Richland, WA" => "313",
    "Walla Walla, WA" => "313",
    "Fredericksburg, TX" => "314",
    "Kerrville, TX" => "314",
    "Knoxville, TN" => "315",
    "Newport, TN" => "315",
    "Sevierville, TN" => "315",
    "Morristown, TN" => "315",
    "Kokomo, IN" => "316",
    "Peru, IN" => "316",
    "Lafayette, LA" => "318",
    "Morgan City, LA" => "318",
    "Opelousas, LA" => "318",
    "Lafayette-West Lafayette, IN" => "320",
    "Frankfort, IN" => "320",
    "Jennings, LA" => "324",
    "Lake Charles, LA" => "324",
    "Pahrump, NV" => "332",
    "Las Vegas-Henderson-Paradise, NV" => "332",
    "Richmond-Berea, KY" => "336",
    "Mount Sterling, KY" => "336",
    "Lexington-Fayette, KY" => "336",
    "Frankfort, KY" => "336",
    "Wapakoneta, OH" => "338",
    "Celina, OH" => "338",
    "Van Wert, OH" => "338",
    "Lima, OH" => "338",
    "Lincoln, NE" => "339",
    "Beatrice, NE" => "339",
    "Little Rock-North Little Rock-Conway, AR" => "340",
    "Pine Bluff, AR" => "340",
    "Searcy, AR" => "340",
    "Los Angeles-Long Beach-Anaheim, CA" => "348",
    "Oxnard-Thousand Oaks-Ventura, CA" => "348",
    "Riverside-San Bernardino-Ontario, CA" => "348",
    "Louisville/Jefferson County, KY-IN" => "350",
    "Scottsburg, IN" => "350",
    "Bardstown, KY" => "350",
    "Elizabethtown-Fort Knox, KY" => "350",
    "Lubbock, TX" => "352",
    "Plainview, TX" => "352",
    "Levelland, TX" => "352",
    "Warner Robins, GA" => "356",
    "Macon-Bibb County, GA" => "356",
    "Baraboo, WI" => "357",
    "Madison, WI" => "357",
    "Janesville-Beloit, WI" => "357",
    "New Ulm, MN" => "359",
    "Mankato, MN" => "359",
    "Mansfield, OH" => "360",
    "Bucyrus-Galion, OH" => "360",
    "Ashland, OH" => "360",
    "Iron Mountain, MI-WI" => "361",
    "Marinette, WI-MI" => "361",
    "Martin, TN" => "362",
    "Union City, TN" => "362",
    "San Germn, PR" => "364",
    "Mayag`z, PR" => "364",
    "Rio Grande City-Roma, TX" => "365",
    "McAllen-Edinburg-Mission, TX" => "365",
    "Grants Pass, OR" => "366",
    "Medford, OR" => "366",
    "Memphis, TN-MS-AR" => "368",
    "Forrest City, AR" => "368",
    "Port St. Lucie, FL" => "370",
    "Sebastian-Vero Beach, FL" => "370",
    "Miami-Fort Lauderdale-Pompano Beach, FL" => "370",
    "Key West, FL" => "370",
    "Odessa, TX" => "372",
    "Midland, TX" => "372",
    "Milwaukee-Waukesha, WI" => "376",
    "Whitewater, WI" => "376",
    "Watertown-Fort Atkinson, WI" => "376",
    "Racine, WI" => "376",
    "Beaver Dam, WI" => "376",
    "St. Cloud, MN" => "378",
    "Red Wing, MN" => "378",
    "Owatonna, MN" => "378",
    "Faribault-Northfield, MN" => "378",
    "Hutchinson, MN" => "378",
    "Minneapolis-St. Paul-Bloomington, MN-WI" => "378",
    "Mobile, AL" => "380",
    "Daphne-Fairhope-Foley, AL" => "380",
    "Ruston, LA" => "384",
    "Monroe, LA" => "384",
    "Montgomery, AL" => "388",
    "Alexander City, AL" => "388",
    "Selma, AL" => "388",
    "Fairmont, WV" => "390",
    "Morgantown, WV" => "390",
    "Moses Lake, WA" => "393",
    "Othello, WA" => "393",
    "Mount Pleasant, MI" => "394",
    "Alma, MI" => "394",
    "Georgetown, SC" => "396",
    "Myrtle Beach-Conway-North Myrtle Beach, SC-NC" => "396",
    "Nashville-Davidson--Murfreesboro--Franklin, TN" => "400",
    "Lewisburg, TN" => "400",
    "Lawrenceburg, TN" => "400",
    "Shelbyville, TN" => "400",
    "Morehead City, NC" => "404",
    "New Bern, NC" => "404",
    "Hammond, LA" => "406",
    "Bogalusa, LA" => "406",
    "Picayune, MS" => "406",
    "New Orleans-Metairie, LA" => "406",
    "Kingston, NY" => "408",
    "Bridgeport-Stamford-Norwalk, CT" => "408",
    "Poughkeepsie-Newburgh-Middletown, NY" => "408",
    "New York-Newark-Jersey City, NY-NJ-PA" => "408",
    "Torrington, CT" => "408",
    "New Haven-Milford, CT" => "408",
    "East Stroudsburg, PA" => "408",
    "Trenton-Princeton, NJ" => "408",
    "Arcadia, FL" => "412",
    "Punta Gorda, FL" => "412",
    "North Port-Sarasota-Bradenton, FL" => "412",
    "Oklahoma City, OK" => "416",
    "Shawnee, OK" => "416",
    "Fremont, NE" => "420",
    "Omaha-Council Bluffs, NE-IA" => "420",
    "Lakeland-Winter Haven, FL" => "422",
    "Orlando-Kissimmee-Sanford, FL" => "422",
    "The Villages, FL" => "422",
    "Deltona-Daytona Beach-Ormond Beach, FL" => "422",
    "Wauchula, FL" => "422",
    "Mayfield, KY" => "424",
    "Paducah, KY-IL" => "424",
    "Parkersburg-Vienna, WV" => "425",
    "Marietta, OH" => "425",
    "Atmore, AL" => "426",
    "Pensacola-Ferry Pass-Brent, FL" => "426",
    "Philadelphia-Camden-Wilmington, PA-NJ-DE-MD" => "428",
    "Vineland-Bridgeton, NJ" => "428",
    "Dover, DE" => "428",
    "Atlantic City-Hammonton, NJ" => "428",
    "Reading, PA" => "428",
    "Ocean City, NJ" => "428",
    "Payson, AZ" => "429",
    "Phoenix-Mesa-Chandler, AZ" => "429",
    "Indiana, PA" => "430",
    "Weirton-Steubenville, WV-OH" => "430",
    "Pittsburgh, PA" => "430",
    "New Castle, PA" => "430",
    "Ponce, PR" => "434",
    "Santa Isabel, PR" => "434",
    "Yauco, PR" => "434",
    "Coamo, PR" => "434",
    "Lewiston-Auburn, ME" => "438",
    "Portland-South Portland, ME" => "438",
    "Albany-Lebanon, OR" => "440",
    "Salem, OR" => "440",
    "Longview, WA" => "440",
    "Portland-Vancouver-Hillsboro, OR-WA" => "440",
    "Corvallis, OR" => "440",
    "Ca?on City, CO" => "444",
    "Pueblo, CO" => "444",
    "Moscow, ID" => "446",
    "Pullman, WA" => "446",
    "Hannibal, MO" => "448",
    "Quincy, IL-MO" => "448",
    "Raleigh-Cary, NC" => "450",
    "Durham-Chapel Hill, NC" => "450",
    "Henderson, NC" => "450",
    "Spearfish, SD" => "452",
    "Rapid City, SD" => "452",
    "Redding, CA" => "454",
    "Red Bluff, CA" => "454",
    "Fernley, NV" => "456",
    "Gardnerville Ranchos, NV" => "456",
    "Carson City, NV" => "456",
    "Reno, NV" => "456",
    "Richmond, IN" => "458",
    "Connersville, IN" => "458",
    "Austin, MN" => "462",
    "Rochester, MN" => "462",
    "Rochester, NY" => "464",
    "Seneca Falls, NY" => "464",
    "Batavia, NY" => "464",
    "Rochelle, IL" => "466",
    "Freeport, IL" => "466",
    "Rockford, IL" => "466",
    "Roanoke Rapids, NC" => "468",
    "Wilson, NC" => "468",
    "Rocky Mount, NC" => "468",
    "Yuba City, CA" => "472",
    "Truckee-Grass Valley, CA" => "472",
    "Sacramento-Roseville-Folsom, CA" => "472",
    "Bay City, MI" => "474",
    "Midland, MI" => "474",
    "Saginaw, MI" => "474",
    "St. Louis, MO-IL" => "476",
    "Farmington, MO" => "476",
    "Centralia, IL" => "476",
    "Cambridge, MD" => "480",
    "Salisbury, MD-DE" => "480",
    "Provo-Orem, UT" => "482",
    "Salt Lake City, UT" => "482",
    "Heber, UT" => "482",
    "Ogden-Clearfield, UT" => "482",
    "San Antonio-New Braunfels, TX" => "484",
    "Pearsall, TX" => "484",
    "Napa, CA" => "488",
    "Santa Cruz-Watsonville, CA" => "488",
    "Modesto, CA" => "488",
    "Santa Rosa-Petaluma, CA" => "488",
    "Vallejo, CA" => "488",
    "Merced, CA" => "488",
    "Stockton, CA" => "488",
    "San Francisco-Oakland-Berkeley, CA" => "488",
    "San Jose-Sunnyvale-Santa Clara, CA" => "488",
    "Coco, PR" => "490",
    "San Juan-Bayam?n-Caguas, PR" => "490",
    "Guayama, PR" => "490",
    "Arecibo, PR" => "490",
    "Hinesville, GA" => "496",
    "Savannah, GA" => "496",
    "Jesup, GA" => "496",
    "Statesboro, GA" => "496",
    "Fort Payne, AL" => "497",
    "Scottsboro, AL" => "497",
    "Oak Harbor, WA" => "500",
    "Mount Vernon-Anacortes, WA" => "500",
    "Centralia, WA" => "500",
    "Olympia-Lacey-Tumwater, WA" => "500",
    "Bremerton-Silverdale-Port Orchard, WA" => "500",
    "Seattle-Tacoma-Bellevue, WA" => "500",
    "Shelton, WA" => "500",
    "Minden, LA" => "508",
    "Shreveport-Bossier City, LA" => "508",
    "Niles, MI" => "515",
    "Warsaw, IN" => "515",
    "Plymouth, IN" => "515",
    "South Bend-Mishawaka, IN-MI" => "515",
    "Elkhart-Goshen, IN" => "515",
    "Spirit Lake, IA" => "517",
    "Spencer, IA" => "517",
    "Coeur d'Alene, ID" => "518",
    "Spokane-Spokane Valley, WA" => "518",
    "Taylorville, IL" => "522",
    "Jacksonville, IL" => "522",
    "Springfield, IL" => "522",
    "Lincoln, IL" => "522",
    "DuBois, PA" => "524",
    "State College, PA" => "524",
    "Craig, CO" => "525",
    "Steamboat Springs, CO" => "525",
    "Syracuse, NY" => "532",
    "Auburn, NY" => "532",
    "Fremont, OH" => "534",
    "Tiffin, OH" => "534",
    "Toledo, OH" => "534",
    "Findlay, OH" => "534",
    "Tucson, AZ" => "536",
    "Nogales, AZ" => "536",
    "Tulsa, OK" => "538",
    "Bartlesville, OK" => "538",
    "Muskogee, OK" => "538",
    "Corinth, MS" => "539",
    "Tupelo, MS" => "539",
    "Tyler, TX" => "540",
    "Jacksonville, TX" => "540",
    "Port Lavaca, TX" => "544",
    "Victoria, TX" => "544",
    "Elizabeth City, NC" => "545",
    "Kill Devil Hills, NC" => "545",
    "Virginia Beach-Norfolk-Newport News, VA-NC" => "545",
    "Chambersburg-Waynesboro, PA" => "548",
    "Washington-Arlington-Alexandria, DC-VA-MD-WV" => "548",
    "Winchester, VA-WV" => "548",
    "California-Lexington Park, MD" => "548",
    "Easton, MD" => "548",
    "Baltimore-Columbia-Towson, MD" => "548",
    "Hagerstown-Martinsburg, MD-WV" => "548",
    "Wausau-Weston, WI" => "554",
    "Wisconsin Rapids-Marshfield, WI" => "554",
    "Stevens Point, WI" => "554",
    "Winfield, KS" => "556",
    "Wichita, KS" => "556",
    "Lock Haven, PA" => "558",
    "Williamsport, PA" => "558",
    "Salem, OH" => "566",
    "Youngstown-Warren-Boardman, OH-PA" => "566",
    "Aberdeen, SD" => "Aberdeen, SD",
    "Aberdeen, WA" => "Aberdeen, WA",
    "Abilene, TX" => "Abilene, TX",
    "Ada, OK" => "Ada, OK",
    "Aguadilla-Isabela, PR" => "Aguadilla-Isabela, PR",
    "Alamogordo, NM" => "Alamogordo, NM",
    "Albany, GA" => "Albany, GA",
    "Albert Lea, MN" => "Albert Lea, MN",
    "Albertville, AL" => "Albertville, AL",
    "Alexandria, LA" => "Alexandria, LA",
    "Alexandria, MN" => "Alexandria, MN",
    "Allentown-Bethlehem-Easton, PA-NJ" => "Allentown-Bethlehem-Easton, PA-NJ",
    "Alpena, MI" => "Alpena, MI",
    "Altus, OK" => "Altus, OK",
    "Americus, GA" => "Americus, GA",
    "Anchorage, AK" => "Anchorage, AK",
    "Andrews, TX" => "Andrews, TX",
    "Anniston-Oxford, AL" => "Anniston-Oxford, AL",
    "Ardmore, OK" => "Ardmore, OK",
    "Arkadelphia, AR" => "Arkadelphia, AR",
    "Astoria, OR" => "Astoria, OR",
    "Athens, OH" => "Athens, OH",
    "Augusta-Richmond County, GA-SC" => "Augusta-Richmond County, GA-SC",
    "Augusta-Waterville, ME" => "Augusta-Waterville, ME",
    "Austin-Round Rock-Georgetown, TX" => "Austin-Round Rock-Georgetown, TX",
    "Bainbridge, GA" => "Bainbridge, GA",
    "Bakersfield, CA" => "Bakersfield, CA",
    "Bangor, ME" => "Bangor, ME",
    "Batesville, AR" => "Batesville, AR",
    "Baton Rouge, LA" => "Baton Rouge, LA",
    "Beaumont-Port Arthur, TX" => "Beaumont-Port Arthur, TX",
    "Beckley, WV" => "Beckley, WV",
    "Beeville, TX" => "Beeville, TX",
    "Bellingham, WA" => "Bellingham, WA",
    "Bemidji, MN" => "Bemidji, MN",
    "Bennettsville, SC" => "Bennettsville, SC",
    "Bennington, VT" => "Bennington, VT",
    "Berlin, NH" => "Berlin, NH",
    "Big Spring, TX" => "Big Spring, TX",
    "Big Stone Gap, VA" => "Big Stone Gap, VA",
    "Billings, MT" => "Billings, MT",
    "Binghamton, NY" => "Binghamton, NY",
    "Bismarck, ND" => "Bismarck, ND",
    "Blacksburg-Christiansburg, VA" => "Blacksburg-Christiansburg, VA",
    "Bluefield, WV-VA" => "Bluefield, WV-VA",
    "Blytheville, AR" => "Blytheville, AR",
    "Boone, NC" => "Boone, NC",
    "Bozeman, MT" => "Bozeman, MT",
    "Bradford, PA" => "Bradford, PA",
    "Brainerd, MN" => "Brainerd, MN",
    "Branson, MO" => "Branson, MO",
    "Breckenridge, CO" => "Breckenridge, CO",
    "Brookings, OR" => "Brookings, OR",
    "Brookings, SD" => "Brookings, SD",
    "Brownwood, TX" => "Brownwood, TX",
    "Brunswick, GA" => "Brunswick, GA",
    "Burley, ID" => "Burley, ID",
    "Butte-Silver Bow, MT" => "Butte-Silver Bow, MT",
    "Cadillac, MI" => "Cadillac, MI",
    "Camden, AR" => "Camden, AR",
    "Campbellsville, KY" => "Campbellsville, KY",
    "Carbondale-Marion, IL" => "Carbondale-Marion, IL",
    "Carlsbad-Artesia, NM" => "Carlsbad-Artesia, NM",
    "Carroll, IA" => "Carroll, IA",
    "Casper, WY" => "Casper, WY",
    "Cedar City, UT" => "Cedar City, UT",
    "Central City, KY" => "Central City, KY",
    "Champaign-Urbana, IL" => "Champaign-Urbana, IL",
    "Charleston-Mattoon, IL" => "Charleston-Mattoon, IL",
    "Charleston-North Charleston, SC" => "Charleston-North Charleston, SC",
    "Charlottesville, VA" => "Charlottesville, VA",
    "Cheyenne, WY" => "Cheyenne, WY",
    "Chico, CA" => "Chico, CA",
    "Clarksburg, WV" => "Clarksburg, WV",
    "Clarksdale, MS" => "Clarksdale, MS",
    "Clarksville, TN-KY" => "Clarksville, TN-KY",
    "Clearlake, CA" => "Clearlake, CA",
    "Coffeyville, KS" => "Coffeyville, KS",
    "College Station-Bryan, TX" => "College Station-Bryan, TX",
    "Colorado Springs, CO" => "Colorado Springs, CO",
    "Columbus, NE" => "Columbus, NE",
    "Cookeville, TN" => "Cookeville, TN",
    "Coos Bay, OR" => "Coos Bay, OR",
    "Cordele, GA" => "Cordele, GA",
    "Coshocton, OH" => "Coshocton, OH",
    "Crescent City, CA" => "Crescent City, CA",
    "Crestview-Fort Walton Beach-Destin, FL" => "Crestview-Fort Walton Beach-Destin, FL",
    "Crossville, TN" => "Crossville, TN",
    "Cullowhee, NC" => "Cullowhee, NC",
    "Cumberland, MD-WV" => "Cumberland, MD-WV",
    "Danville, IL" => "Danville, IL",
    "Danville, KY" => "Danville, KY",
    "Danville, VA" => "Danville, VA",
    "Decatur, IL" => "Decatur, IL",
    "Defiance, OH" => "Defiance, OH",
    "Del Rio, TX" => "Del Rio, TX",
    "Deming, NM" => "Deming, NM",
    "Dickinson, ND" => "Dickinson, ND",
    "Dodge City, KS" => "Dodge City, KS",
    "Douglas, GA" => "Douglas, GA",
    "Dublin, GA" => "Dublin, GA",
    "Dubuque, IA" => "Dubuque, IA",
    "Duluth, MN-WI" => "Duluth, MN-WI",
    "Dumas, TX" => "Dumas, TX",
    "Duncan, OK" => "Duncan, OK",
    "Durango, CO" => "Durango, CO",
    "Dyersburg, TN" => "Dyersburg, TN",
    "Eagle Pass, TX" => "Eagle Pass, TX",
    "Effingham, IL" => "Effingham, IL",
    "El Centro, CA" => "El Centro, CA",
    "El Dorado, AR" => "El Dorado, AR",
    "Elk City, OK" => "Elk City, OK",
    "Elkins, WV" => "Elkins, WV",
    "Elko, NV" => "Elko, NV",
    "Ellensburg, WA" => "Ellensburg, WA",
    "Emporia, KS" => "Emporia, KS",
    "Enid, OK" => "Enid, OK",
    "Enterprise, AL" => "Enterprise, AL",
    "Escanaba, MI" => "Escanaba, MI",
    "Eufaula, AL-GA" => "Eufaula, AL-GA",
    "Eugene-Springfield, OR" => "Eugene-Springfield, OR",
    "Eureka-Arcata, CA" => "Eureka-Arcata, CA",
    "Evanston, WY" => "Evanston, WY",
    "Evansville, IN-KY" => "Evansville, IN-KY",
    "Fairbanks, AK" => "Fairbanks, AK",
    "Fairfield, IA" => "Fairfield, IA",
    "Fairmont, MN" => "Fairmont, MN",
    "Fallon, NV" => "Fallon, NV",
    "Farmington, NM" => "Farmington, NM",
    "Fayetteville-Springdale-Rogers, AR" => "Fayetteville-Springdale-Rogers, AR",
    "Fergus Falls, MN" => "Fergus Falls, MN",
    "Fitzgerald, GA" => "Fitzgerald, GA",
    "Flagstaff, AZ" => "Flagstaff, AZ",
    "Florence-Muscle Shoals, AL" => "Florence-Muscle Shoals, AL",
    "Florence, SC" => "Florence, SC",
    "Fond du Lac, WI" => "Fond du Lac, WI",
    "Forest City, NC" => "Forest City, NC",
    "Fort Collins, CO" => "Fort Collins, CO",
    "Fort Dodge, IA" => "Fort Dodge, IA",
    "Fort Leonard Wood, MO" => "Fort Leonard Wood, MO",
    "Fort Morgan, CO" => "Fort Morgan, CO",
    "Fort Smith, AR-OK" => "Fort Smith, AR-OK",
    "Gadsden, AL" => "Gadsden, AL",
    "Galesburg, IL" => "Galesburg, IL",
    "Gallup, NM" => "Gallup, NM",
    "Garden City, KS" => "Garden City, KS",
    "Gillette, WY" => "Gillette, WY",
    "Goldsboro, NC" => "Goldsboro, NC",
    "Grand Forks, ND-MN" => "Grand Forks, ND-MN",
    "Grand Island, NE" => "Grand Island, NE",
    "Grand Junction, CO" => "Grand Junction, CO",
    "Grand Rapids, MN" => "Grand Rapids, MN",
    "Grants, NM" => "Grants, NM",
    "Great Bend, KS" => "Great Bend, KS",
    "Great Falls, MT" => "Great Falls, MT",
    "Greeneville, TN" => "Greeneville, TN",
    "Greenville, MS" => "Greenville, MS",
    "Greenwood, MS" => "Greenwood, MS",
    "Grenada, MS" => "Grenada, MS",
    "Gulfport-Biloxi, MS" => "Gulfport-Biloxi, MS",
    "Guymon, OK" => "Guymon, OK",
    "Hailey, ID" => "Hailey, ID",
    "Harrison, AR" => "Harrison, AR",
    "Hastings, NE" => "Hastings, NE",
    "Hays, KS" => "Hays, KS",
    "Helena, MT" => "Helena, MT",
    "Helena-West Helena, AR" => "Helena-West Helena, AR",
    "Hereford, TX" => "Hereford, TX",
    "Hermiston-Pendleton, OR" => "Hermiston-Pendleton, OR",
    "Hickory-Lenoir-Morganton, NC" => "Hickory-Lenoir-Morganton, NC",
    "Hillsdale, MI" => "Hillsdale, MI",
    "Hilo, HI" => "Hilo, HI",
    "Hilton Head Island-Bluffton, SC" => "Hilton Head Island-Bluffton, SC",
    "Hobbs, NM" => "Hobbs, NM",
    "Homosassa Springs, FL" => "Homosassa Springs, FL",
    "Hood River, OR" => "Hood River, OR",
    "Hope, AR" => "Hope, AR",
    "Houghton, MI" => "Houghton, MI",
    "Houma-Thibodaux, LA" => "Houma-Thibodaux, LA",
    "Huron, SD" => "Huron, SD",
    "Hutchinson, KS" => "Hutchinson, KS",
    "Jackson, MI" => "Jackson, MI",
    "Jackson, OH" => "Jackson, OH",
    "Jacksonville, NC" => "Jacksonville, NC",
    "Jackson, WY-ID" => "Jackson, WY-ID",
    "Jamestown-Dunkirk-Fredonia, NY" => "Jamestown-Dunkirk-Fredonia, NY",
    "Jamestown, ND" => "Jamestown, ND",
    "Jasper, IN" => "Jasper, IN",
    "Jayuya, PR" => "Jayuya, PR",
    "Jefferson City, MO" => "Jefferson City, MO",
    "Juneau, AK" => "Juneau, AK",
    "Kahului-Wailuku-Lahaina, HI" => "Kahului-Wailuku-Lahaina, HI",
    "Kalispell, MT" => "Kalispell, MT",
    "Kapaa, HI" => "Kapaa, HI",
    "Kearney, NE" => "Kearney, NE",
    "Keene, NH" => "Keene, NH",
    "Kennett, MO" => "Kennett, MO",
    "Ketchikan, AK" => "Ketchikan, AK",
    "Killeen-Temple, TX" => "Killeen-Temple, TX",
    "Kirksville, MO" => "Kirksville, MO",
    "Klamath Falls, OR" => "Klamath Falls, OR",
    "La Crosse-Onalaska, WI-MN" => "La Crosse-Onalaska, WI-MN",
    "La Grande, OR" => "La Grande, OR",
    "Lake Havasu City-Kingman, AZ" => "Lake Havasu City-Kingman, AZ",
    "Lamesa, TX" => "Lamesa, TX",
    "Lancaster, PA" => "Lancaster, PA",
    "Lansing-East Lansing, MI" => "Lansing-East Lansing, MI",
    "Laramie, WY" => "Laramie, WY",
    "Laredo, TX" => "Laredo, TX",
    "Lawton, OK" => "Lawton, OK",
    "Lebanon, MO" => "Lebanon, MO",
    "Lebanon, NH-VT" => "Lebanon, NH-VT",
    "Lewiston, ID-WA" => "Lewiston, ID-WA",
    "Lewistown, PA" => "Lewistown, PA",
    "Lexington, NE" => "Lexington, NE",
    "Liberal, KS" => "Liberal, KS",
    "Logansport, IN" => "Logansport, IN",
    "Logan, UT-ID" => "Logan, UT-ID",
    "London, KY" => "London, KY",
    "Longview, TX" => "Longview, TX",
    "Ludington, MI" => "Ludington, MI",
    "Lufkin, TX" => "Lufkin, TX",
    "Lynchburg, VA" => "Lynchburg, VA",
    "Macomb, IL" => "Macomb, IL",
    "Madison, IN" => "Madison, IN",
    "Madisonville, KY" => "Madisonville, KY",
    "Magnolia, AR" => "Magnolia, AR",
    "Malone, NY" => "Malone, NY",
    "Manhattan, KS" => "Manhattan, KS",
    "Manitowoc, WI" => "Manitowoc, WI",
    "Marion, IN" => "Marion, IN",
    "Marquette, MI" => "Marquette, MI",
    "Marshall, MN" => "Marshall, MN",
    "Marshall, MO" => "Marshall, MO",
    "Marshalltown, IA" => "Marshalltown, IA",
    "Martinsville, VA" => "Martinsville, VA",
    "Maryville, MO" => "Maryville, MO",
    "Mason City, IA" => "Mason City, IA",
    "McAlester, OK" => "McAlester, OK",
    "McComb, MS" => "McComb, MS",
    "McMinnville, TN" => "McMinnville, TN",
    "McPherson, KS" => "McPherson, KS",
    "Meridian, MS" => "Meridian, MS",
    "Middlesborough, KY" => "Middlesborough, KY",
    "Milledgeville, GA" => "Milledgeville, GA",
    "Minot, ND" => "Minot, ND",
    "Missoula, MT" => "Missoula, MT",
    "Mitchell, SD" => "Mitchell, SD",
    "Montrose, CO" => "Montrose, CO",
    "Moultrie, GA" => "Moultrie, GA",
    "Mountain Home, AR" => "Mountain Home, AR",
    "Mount Pleasant, TX" => "Mount Pleasant, TX",
    "Mount Vernon, IL" => "Mount Vernon, IL",
    "Murray, KY" => "Murray, KY",
    "Nacogdoches, TX" => "Nacogdoches, TX",
    "Natchez, MS-LA" => "Natchez, MS-LA",
    "Natchitoches, LA" => "Natchitoches, LA",
    "Newport, OR" => "Newport, OR",
    "Norfolk, NE" => "Norfolk, NE",
    "North Platte, NE" => "North Platte, NE",
    "North Wilkesboro, NC" => "North Wilkesboro, NC",
    "Ocala, FL" => "Ocala, FL",
    "Ogdensburg-Massena, NY" => "Ogdensburg-Massena, NY",
    "Oil City, PA" => "Oil City, PA",
    "Okeechobee, FL" => "Okeechobee, FL",
    "Oneonta, NY" => "Oneonta, NY",
    "Ottumwa, IA" => "Ottumwa, IA",
    "Owensboro, KY" => "Owensboro, KY",
    "Oxford, MS" => "Oxford, MS",
    "Palestine, TX" => "Palestine, TX",
    "Palm Bay-Melbourne-Titusville, FL" => "Palm Bay-Melbourne-Titusville, FL",
    "Panama City, FL" => "Panama City, FL",
    "Paris, TN" => "Paris, TN",
    "Paris, TX" => "Paris, TX",
    "Parsons, KS" => "Parsons, KS",
    "Pecos, TX" => "Pecos, TX",
    "Peoria, IL" => "Peoria, IL",
    "Pierre, SD" => "Pierre, SD",
    "Pittsburg, KS" => "Pittsburg, KS",
    "Pittsfield, MA" => "Pittsfield, MA",
    "Platteville, WI" => "Platteville, WI",
    "Plattsburgh, NY" => "Plattsburgh, NY",
    "Pocatello, ID" => "Pocatello, ID",
    "Ponca City, OK" => "Ponca City, OK",
    "Poplar Bluff, MO" => "Poplar Bluff, MO",
    "Port Angeles, WA" => "Port Angeles, WA",
    "Pottsville, PA" => "Pottsville, PA",
    "Prescott Valley-Prescott, AZ" => "Prescott Valley-Prescott, AZ",
    "Price, UT" => "Price, UT",
    "Richmond, VA" => "Richmond, VA",
    "Riverton, WY" => "Riverton, WY",
    "Roanoke, VA" => "Roanoke, VA",
    "Rockingham, NC" => "Rockingham, NC",
    "Rock Springs, WY" => "Rock Springs, WY",
    "Rolla, MO" => "Rolla, MO",
    "Roseburg, OR" => "Roseburg, OR",
    "Roswell, NM" => "Roswell, NM",
    "Ruidoso, NM" => "Ruidoso, NM",
    "Russellville, AR" => "Russellville, AR",
    "Rutland, VT" => "Rutland, VT",
    "Safford, AZ" => "Safford, AZ",
    "Salina, KS" => "Salina, KS",
    "Salinas, CA" => "Salinas, CA",
    "San Angelo, TX" => "San Angelo, TX",
    "San Diego-Chula Vista-Carlsbad, CA" => "San Diego-Chula Vista-Carlsbad, CA",
    "Sandpoint, ID" => "Sandpoint, ID",
    "San Luis Obispo-Paso Robles, CA" => "San Luis Obispo-Paso Robles, CA",
    "Santa Maria-Santa Barbara, CA" => "Santa Maria-Santa Barbara, CA",
    "Sault Ste. Marie, MI" => "Sault Ste. Marie, MI",
    "Sayre, PA" => "Sayre, PA",
    "Scottsbluff, NE" => "Scottsbluff, NE",
    "Scranton--Wilkes-Barre, PA" => "Scranton--Wilkes-Barre, PA",
    "Sebring-Avon Park, FL" => "Sebring-Avon Park, FL",
    "Sedalia, MO" => "Sedalia, MO",
    "Sheboygan, WI" => "Sheboygan, WI",
    "Sheridan, WY" => "Sheridan, WY",
    "Show Low, AZ" => "Show Low, AZ",
    "Sierra Vista-Douglas, AZ" => "Sierra Vista-Douglas, AZ",
    "Silver City, NM" => "Silver City, NM",
    "Sioux City, IA-NE-SD" => "Sioux City, IA-NE-SD",
    "Sioux Falls, SD" => "Sioux Falls, SD",
    "Snyder, TX" => "Snyder, TX",
    "Somerset, KY" => "Somerset, KY",
    "Sonora, CA" => "Sonora, CA",
    "Springfield, MA" => "Springfield, MA",
    "Springfield, MO" => "Springfield, MO",
    "Starkville, MS" => "Starkville, MS",
    "Stephenville, TX" => "Stephenville, TX",
    "Sterling, CO" => "Sterling, CO",
    "St. George, UT" => "St. George, UT",
    "Stillwater, OK" => "Stillwater, OK",
    "St. Marys, PA" => "St. Marys, PA",
    "Storm Lake, IA" => "Storm Lake, IA",
    "Sulphur Springs, TX" => "Sulphur Springs, TX",
    "Sumter, SC" => "Sumter, SC",
    "Susanville, CA" => "Susanville, CA",
    "Sweetwater, TX" => "Sweetwater, TX",
    "Tahlequah, OK" => "Tahlequah, OK",
    "Tallahassee, FL" => "Tallahassee, FL",
    "Tampa-St. Petersburg-Clearwater, FL" => "Tampa-St. Petersburg-Clearwater, FL",
    "Taos, NM" => "Taos, NM",
    "Terre Haute, IN" => "Terre Haute, IN",
    "Texarkana, TX-AR" => "Texarkana, TX-AR",
    "The Dalles, OR" => "The Dalles, OR",
    "Thomasville, GA" => "Thomasville, GA",
    "Tifton, GA" => "Tifton, GA",
    "Topeka, KS" => "Topeka, KS",
    "Traverse City, MI" => "Traverse City, MI",
    "Troy, AL" => "Troy, AL",
    "Tullahoma-Manchester, TN" => "Tullahoma-Manchester, TN",
    "Tuscaloosa, AL" => "Tuscaloosa, AL",
    "Twin Falls, ID" => "Twin Falls, ID",
    "Ukiah, CA" => "Ukiah, CA",
    "Urban Honolulu, HI" => "Urban Honolulu, HI",
    "Utica-Rome, NY" => "Utica-Rome, NY",
    "Uvalde, TX" => "Uvalde, TX",
    "Valdosta, GA" => "Valdosta, GA",
    "Vermillion, SD" => "Vermillion, SD",
    "Vernal, UT" => "Vernal, UT",
    "Vernon, TX" => "Vernon, TX",
    "Vidalia, GA" => "Vidalia, GA",
    "Vincennes, IN" => "Vincennes, IN",
    "Vineyard Haven, MA" => "Vineyard Haven, MA",
    "Visalia, CA" => "Visalia, CA",
    "Wabash, IN" => "Wabash, IN",
    "Waco, TX" => "Waco, TX",
    "Warren, PA" => "Warren, PA",
    "Washington, IN" => "Washington, IN",
    "Waterloo-Cedar Falls, IA" => "Waterloo-Cedar Falls, IA",
    "Watertown-Fort Drum, NY" => "Watertown-Fort Drum, NY",
    "Watertown, SD" => "Watertown, SD",
    "Waycross, GA" => "Waycross, GA",
    "Weatherford, OK" => "Weatherford, OK",
    "Wenatchee, WA" => "Wenatchee, WA",
    "West Plains, MO" => "West Plains, MO",
    "Wheeling, WV-OH" => "Wheeling, WV-OH",
    "Wichita Falls, TX" => "Wichita Falls, TX",
    "Williston, ND" => "Williston, ND",
    "Willmar, MN" => "Willmar, MN",
    "Wilmington, NC" => "Wilmington, NC",
    "Winnemucca, NV" => "Winnemucca, NV",
    "Winona, MN" => "Winona, MN",
    "Woodward, OK" => "Woodward, OK",
    "Worthington, MN" => "Worthington, MN",
    "Yakima, WA" => "Yakima, WA",
    "Yankton, SD" => "Yankton, SD",
    "Yuma, AZ" => "Yuma, AZ",
    "Zapata, TX" => "Zapata, TX"
  }

  def get_all_cities
    return @@ALL_CITIES
  end

  def city_name_to_CSA(city_name)
    return @@ALL_CITIES[city_name]
  end

  def metro_name_to_CSA(metro_name)
    return @@TOP_10_METRO[metro_name]
  end
end

class Df1Original < ApplicationRecord
  extend CityMappings
  self.table_name = 'df1_original'
  self.primary_key = 'serial_no'
  # Distinct years in database
  @@YEARS = Df1Original.distinct.pluck(Arel.sql("substr(serial_no, 1, 4)")).sort
  @@YEAR_LENGTH = 4

  def self.get_years
    return @@YEARS
  end

  def self.year?(year_str)
    return (year_str.to_i.to_s == year_str and year_str.length == @@YEAR_LENGTH)
  end
end
