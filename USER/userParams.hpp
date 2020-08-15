/*  Hier können eigene Missionsparameter eingebunden werden.
*   Ist in missionConfig >> Params included.
*/

class HOPPERS_BOMBS_MIN_DISTANCE {
    title = "Minimum distance between bombs layed";
    values[] = {250,500,750,1000,1250,1500,2000,3000};
    texts[] = {"0.25km", "0.5km", "0.75km", "1km", "1.25km", "1.5km", "2km", "3km"};
    default = 750;
};

class HOPPERS_BOMBS_MIN_PLACED
{
    title = "Minimum amount of bombs opfor has to place before extraction";
    values[] = {0,1,3,6,9,12,15,20};
    texts[] = {"none", "one", "three", "six", "nine", "twelve", "fifteen", "twenty"};
    default = 6;
};

class HOPPERS_MAX_DISTANCE_BOSS
{
    title = "Maximum distance opfor is allowed to boss without independent marker";
    values[] = {200,300,400,500};
    texts[] = {"200m", "300m", "400m", "500m"};
    default = 300;
};

class TIME_OF_DAY
{
    title = "Time of Day";
    values[] = {0,1,2,3,4,5,6,6.5,7,8,9,10,11,12,13,14,15,16,16.5,17,17.5,18,19,20,21,22,23};
    texts[] = {"00:00","01:00","02:00","03:00","04:00","05:00 - Full Moon","06:00","06:30 - Dawn","07:00 - Sunrise","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","16:30 - Sunset will arrive","17:00 - Sunset","17:30 - Dusk","18:00 - really dark already","19:00","20:00","21:00","22:00","23:00 - Moon Rise"};
    default = 7;
};

class WEATHER_OVERCAST
{
    title = "Overcast Settings";
    values[] = {0, 0.4, 0.5, 1, -1};
    texts[] = {"SUNNY", "CLOUDY", "SLIGHT RAIN", "HEAVY RAIN", "RANDOM"};
    default = 0.4;
};

class WEATHER_FOG
{
    title = "Fog Settings";
    values[] = {0, 0.05, 0.1, 0.2, 0.5, 1, -1};
    texts[] = {"None", "0.05", "0.1", "0.2", "0.5", "maximum perversum", "random"};
    default = 0.1;
};

class WEATHER_WIND
{
    title = "Wind Settings";
    values[] = {0, 1, 2, 4, 8, 32, -1};
    texts[] = {"None", "1 m/s", "2 m/s", "4 m/s", "8 m/s", "maximum perversum", "random"};
    default = 1;
};