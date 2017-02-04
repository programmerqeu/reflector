/* Magic Mirror Config Sample
 *
 * By Michael Teeuw http://michaelteeuw.nl
 * MIT Licensed.
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
            header: 'US Holidays',
            position: 'top_left',
            config: {
                calendars: [{
                    symbol: 'calendar-check-o ',
                    url: 'webcal://www.calendarlabs.com/templates/ical/Germany-Holidays.ics'
                }]
            }
        },
        {
            module: 'compliments',
            position: 'lower_third'
        },
        {
            module: 'currentweather',
            position: 'top_left',
            config: {
                location: 'Leipzig, DE',
                locationID: '2879139', //ID from http://www.openweathermap.org
                appid: '7e8a87121610991cdb6b628d25907fa5'
            }
        },
        {
            module: 'weatherforecast',
            position: 'top_left',
            header: 'Weather Forecast',
            config: {
                location: 'Leipzig, DE',
                locationID: '2879139', //ID from http://www.openweathermap.org
                appid: '7e8a87121610991cdb6b628d25907fa5'
            }
        },
        {
            module: 'newsfeed',
            position: 'bottom_bar',
            config: {
                feeds: [{
                    title: "New York Times",
                    url: "http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml"
                }],
                showSourceTitle: true,
                showPublishDate: true
            }
        },
    ]

};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== 'undefined') {
    module.exports = config;
}
