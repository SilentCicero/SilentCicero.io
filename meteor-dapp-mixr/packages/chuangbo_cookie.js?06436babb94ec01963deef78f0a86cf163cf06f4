//////////////////////////////////////////////////////////////////////////
//                                                                      //
// This is a generated file. You can view the original                  //
// source in your browser if your browser supports source maps.         //
//                                                                      //
// If you are using Chrome, open the Developer Tools and click the gear //
// icon in its lower right corner. In the General Settings panel, turn  //
// on 'Enable source maps'.                                             //
//                                                                      //
// If you are using Firefox 23, go to `about:config` and set the        //
// `devtools.debugger.source-maps-enabled` preference to true.          //
// (The preference should be on by default in Firefox 24; versions      //
// older than 23 do not support source maps.)                           //
//                                                                      //
//////////////////////////////////////////////////////////////////////////


(function () {

/* Imports */
var Meteor = Package.meteor.Meteor;

/* Package-scope variables */
var Cookie;

(function () {

///////////////////////////////////////////////////////////////////////////////////
//                                                                               //
// packages/chuangbo:cookie/cookie.js                                            //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////
                                                                                 //
Cookie = {};                                                                     // 1
                                                                                 // 2
(function(exports) {                                                             // 3
                                                                                 // 4
    // Cookie                                                                    // 5
    // -------------                                                             // 6
    // Thanks to:                                                                // 7
    //  - http://www.nczonline.net/blog/2009/05/05/http-cookies-explained/       // 8
    //  - http://developer.yahoo.com/yui/3/cookie/                               // 9
                                                                                 // 10
                                                                                 // 11
    var Cookie = exports;                                                        // 12
                                                                                 // 13
    var decode = decodeURIComponent;                                             // 14
    var encode = encodeURIComponent;                                             // 15
                                                                                 // 16
                                                                                 // 17
    /**                                                                          // 18
     * Returns the cookie value for the given name.                              // 19
     *                                                                           // 20
     * @param {String} name The name of the cookie to retrieve.                  // 21
     *                                                                           // 22
     * @param {Function|Object} options (Optional) An object containing one or   // 23
     *     more cookie options: raw (true/false) and converter (a function).     // 24
     *     The converter function is run on the value before returning it. The   // 25
     *     function is not used if the cookie doesn't exist. The function can be // 26
     *     passed instead of the options object for conveniently. When raw is    // 27
     *     set to true, the cookie value is not URI decoded.                     // 28
     *                                                                           // 29
     * @return {*} If no converter is specified, returns a string or undefined   // 30
     *     if the cookie doesn't exist. If the converter is specified, returns   // 31
     *     the value returned from the converter.                                // 32
     */                                                                          // 33
    Cookie.get = function(name, options) {                                       // 34
        validateCookieName(name);                                                // 35
                                                                                 // 36
        if (typeof options === 'function') {                                     // 37
            options = { converter: options };                                    // 38
        }                                                                        // 39
        else {                                                                   // 40
            options = options || {};                                             // 41
        }                                                                        // 42
                                                                                 // 43
        var cookies = parseCookieString(document.cookie, !options['raw']);       // 44
        return (options.converter || same)(cookies[name]);                       // 45
    };                                                                           // 46
                                                                                 // 47
                                                                                 // 48
    /**                                                                          // 49
     * Sets a cookie with a given name and value.                                // 50
     *                                                                           // 51
     * @param {string} name The name of the cookie to set.                       // 52
     *                                                                           // 53
     * @param {*} value The value to set for the cookie.                         // 54
     *                                                                           // 55
     * @param {Object} options (Optional) An object containing one or more       // 56
     *     cookie options: path (a string), domain (a string),                   // 57
     *     expires (number or a Date object), secure (true/false),               // 58
     *     and raw (true/false). Setting raw to true indicates that the cookie   // 59
     *     should not be URI encoded before being set.                           // 60
     *                                                                           // 61
     * @return {string} The created cookie string.                               // 62
     */                                                                          // 63
    Cookie.set = function(name, value, options) {                                // 64
        validateCookieName(name);                                                // 65
                                                                                 // 66
        options = options || {};                                                 // 67
        var expires = options['expires'];                                        // 68
        var domain = options['domain'];                                          // 69
        var path = options['path'];                                              // 70
                                                                                 // 71
        if (!options['raw']) {                                                   // 72
            value = encode(String(value));                                       // 73
        }                                                                        // 74
                                                                                 // 75
        var text = name + '=' + value;                                           // 76
                                                                                 // 77
        // expires                                                               // 78
        var date = expires;                                                      // 79
        if (typeof date === 'number') {                                          // 80
            date = new Date();                                                   // 81
            date.setDate(date.getDate() + expires);                              // 82
        }                                                                        // 83
        if (date instanceof Date) {                                              // 84
            text += '; expires=' + date.toUTCString();                           // 85
        }                                                                        // 86
                                                                                 // 87
        // domain                                                                // 88
        if (isNonEmptyString(domain)) {                                          // 89
            text += '; domain=' + domain;                                        // 90
        }                                                                        // 91
                                                                                 // 92
        // path                                                                  // 93
        if (isNonEmptyString(path)) {                                            // 94
            text += '; path=' + path;                                            // 95
        }                                                                        // 96
                                                                                 // 97
        // secure                                                                // 98
        if (options['secure']) {                                                 // 99
            text += '; secure';                                                  // 100
        }                                                                        // 101
                                                                                 // 102
        document.cookie = text;                                                  // 103
        return text;                                                             // 104
    };                                                                           // 105
                                                                                 // 106
                                                                                 // 107
    /**                                                                          // 108
     * Removes a cookie from the machine by setting its expiration date to       // 109
     * sometime in the past.                                                     // 110
     *                                                                           // 111
     * @param {string} name The name of the cookie to remove.                    // 112
     *                                                                           // 113
     * @param {Object} options (Optional) An object containing one or more       // 114
     *     cookie options: path (a string), domain (a string),                   // 115
     *     and secure (true/false). The expires option will be overwritten       // 116
     *     by the method.                                                        // 117
     *                                                                           // 118
     * @return {string} The created cookie string.                               // 119
     */                                                                          // 120
    Cookie.remove = function(name, options) {                                    // 121
        options = options || {};                                                 // 122
        options['expires'] = new Date(0);                                        // 123
        return this.set(name, '', options);                                      // 124
    };                                                                           // 125
                                                                                 // 126
                                                                                 // 127
    function parseCookieString(text, shouldDecode) {                             // 128
        var cookies = {};                                                        // 129
                                                                                 // 130
        if (isString(text) && text.length > 0) {                                 // 131
                                                                                 // 132
            var decodeValue = shouldDecode ? decode : same;                      // 133
            var cookieParts = text.split(/;\s/g);                                // 134
            var cookieName;                                                      // 135
            var cookieValue;                                                     // 136
            var cookieNameValue;                                                 // 137
                                                                                 // 138
            for (var i = 0, len = cookieParts.length; i < len; i++) {            // 139
                                                                                 // 140
                // Check for normally-formatted cookie (name-value)              // 141
                cookieNameValue = cookieParts[i].match(/([^=]+)=/i);             // 142
                if (cookieNameValue instanceof Array) {                          // 143
                    try {                                                        // 144
                        cookieName = decode(cookieNameValue[1]);                 // 145
                        cookieValue = decodeValue(cookieParts[i]                 // 146
                                .substring(cookieNameValue[1].length + 1));      // 147
                    } catch (ex) {                                               // 148
                        // Intentionally ignore the cookie -                     // 149
                        // the encoding is wrong                                 // 150
                    }                                                            // 151
                } else {                                                         // 152
                    // Means the cookie does not have an "=", so treat it as     // 153
                    // a boolean flag                                            // 154
                    cookieName = decode(cookieParts[i]);                         // 155
                    cookieValue = '';                                            // 156
                }                                                                // 157
                                                                                 // 158
                if (cookieName) {                                                // 159
                    cookies[cookieName] = cookieValue;                           // 160
                }                                                                // 161
            }                                                                    // 162
                                                                                 // 163
        }                                                                        // 164
                                                                                 // 165
        return cookies;                                                          // 166
    }                                                                            // 167
                                                                                 // 168
                                                                                 // 169
    // Helpers                                                                   // 170
                                                                                 // 171
    function isString(o) {                                                       // 172
        return typeof o === 'string';                                            // 173
    }                                                                            // 174
                                                                                 // 175
    function isNonEmptyString(s) {                                               // 176
        return isString(s) && s !== '';                                          // 177
    }                                                                            // 178
                                                                                 // 179
    function validateCookieName(name) {                                          // 180
        if (!isNonEmptyString(name)) {                                           // 181
            throw new TypeError('Cookie name must be a non-empty string');       // 182
        }                                                                        // 183
    }                                                                            // 184
                                                                                 // 185
    function same(s) {                                                           // 186
        return s;                                                                // 187
    }                                                                            // 188
                                                                                 // 189
})(Cookie);                                                                      // 190
                                                                                 // 191
///////////////////////////////////////////////////////////////////////////////////

}).call(this);


/* Exports */
if (typeof Package === 'undefined') Package = {};
Package['chuangbo:cookie'] = {
  Cookie: Cookie
};

})();
