/**
 * reflector
 *
 * LICENSE:    MIT
 *
 * @project    reflector
 * @author     André Lademann <vergissberlin@googlemail.com>
 * @license    http://opensource.org/licenses/MIT
 * @link       https://netresearch.atlassian.net/wiki/display/IT/Smart+mirror
 */

var config = {
    port: 8080,
    ipWhitelist: ["127.0.0.1", "::ffff:127.0.0.1", "::1"],

    language: 'de',
    timeFormat: 24,
    units: 'metric',

    modules: [{
            module: 'alert',
        },
        {
            module: "updatenotification",
            position: "top_bar"
        },
        {
            module: 'clock',
            position: 'top_left'
        },
        {
            module: 'calendar',
            header: 'Kalender',
            position: 'top_left',
            config: {
                calendars: [{
                    symbol: 'calendar-check-o',
                    url: 'http://ical.mac.com/ical/German32Holidays.ics'
                }]
            }
        },
        //		{
        //			module: 'compliments',
        //			position: 'lower_third'
        //		},
        {
            module: 'currentweather',
            position: 'top_right',
            config: {
                location: 'Leipzig',
                locationID: '2879139', //ID from http://www.openweathermap.org
                appid: '1cf3eb2d811f7690890d3f7648d8aeb1'
            }
        },
        {
            module: 'weatherforecast',
            position: 'top_right',
            header: 'Wettervorhersage',
            config: {
                location: 'Leipzig',
                locationID: '2879139', //ID from http://www.openweathermap.org
                appid: '1cf3eb2d811f7690890d3f7648d8aeb1'
            }
        },
        {
            module: 'newsfeed',
            position: 'bottom_bar',
            config: {
                feeds: [{
                    title: "Netresearch",
                    url: "https://www.netresearch.de/blog/rss.xml"
                }],
                showSourceTitle: true,
                showPublishDate: true
            }
        },

        {
            module: 'mmm-systemtemperature',
            position: 'bottom_left', // This can be any of the regions.
            classes: 'small dimmed', // Add your own styling. Optional.
            config: {
                // See 'Configuration options' for more information.
                prependString: 'Systemtemperatur: '
            }
        }
    ]

};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== 'undefined') {
    module.exports = config;
}
