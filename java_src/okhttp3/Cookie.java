package okhttp3;

import com.vk.media.camera.CameraUtilsEffects;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okhttp3.internal.Util;
import okhttp3.internal.http.HttpDate;
/* loaded from: classes3.dex */
public final class Cookie {
    private final String domain;
    private final long expiresAt;
    private final boolean hostOnly;
    private final boolean httpOnly;
    private final String name;
    private final String path;
    private final boolean persistent;
    private final boolean secure;
    private final String value;
    private static final Pattern YEAR_PATTERN = Pattern.compile("(\\d{2,4})[^\\d]*");
    private static final Pattern MONTH_PATTERN = Pattern.compile("(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*");
    private static final Pattern DAY_OF_MONTH_PATTERN = Pattern.compile("(\\d{1,2})[^\\d]*");
    private static final Pattern TIME_PATTERN = Pattern.compile("(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*");

    private Cookie(String name, String value, long expiresAt, String domain, String path, boolean secure, boolean httpOnly, boolean hostOnly, boolean persistent) {
        this.name = name;
        this.value = value;
        this.expiresAt = expiresAt;
        this.domain = domain;
        this.path = path;
        this.secure = secure;
        this.httpOnly = httpOnly;
        this.hostOnly = hostOnly;
        this.persistent = persistent;
    }

    Cookie(Builder builder) {
        if (builder.name == null) {
            throw new NullPointerException("builder.name == null");
        }
        if (builder.value == null) {
            throw new NullPointerException("builder.value == null");
        }
        if (builder.domain == null) {
            throw new NullPointerException("builder.domain == null");
        }
        this.name = builder.name;
        this.value = builder.value;
        this.expiresAt = builder.expiresAt;
        this.domain = builder.domain;
        this.path = builder.path;
        this.secure = builder.secure;
        this.httpOnly = builder.httpOnly;
        this.persistent = builder.persistent;
        this.hostOnly = builder.hostOnly;
    }

    public String name() {
        return this.name;
    }

    public String value() {
        return this.value;
    }

    public boolean persistent() {
        return this.persistent;
    }

    public long expiresAt() {
        return this.expiresAt;
    }

    public boolean hostOnly() {
        return this.hostOnly;
    }

    public String domain() {
        return this.domain;
    }

    public String path() {
        return this.path;
    }

    public boolean httpOnly() {
        return this.httpOnly;
    }

    public boolean secure() {
        return this.secure;
    }

    public boolean matches(HttpUrl url) {
        boolean domainMatch;
        if (this.hostOnly) {
            domainMatch = url.host().equals(this.domain);
        } else {
            domainMatch = domainMatch(url, this.domain);
        }
        if (domainMatch && pathMatch(url, this.path)) {
            return !this.secure || url.isHttps();
        }
        return false;
    }

    private static boolean domainMatch(HttpUrl url, String domain) {
        String urlHost = url.host();
        if (urlHost.equals(domain)) {
            return true;
        }
        return urlHost.endsWith(domain) && urlHost.charAt((urlHost.length() - domain.length()) + (-1)) == '.' && !Util.verifyAsIpAddress(urlHost);
    }

    private static boolean pathMatch(HttpUrl url, String path) {
        String urlPath = url.encodedPath();
        if (urlPath.equals(path)) {
            return true;
        }
        return urlPath.startsWith(path) && (path.endsWith(CameraUtilsEffects.FILE_DELIM) || urlPath.charAt(path.length()) == '/');
    }

    public static Cookie parse(HttpUrl url, String setCookie) {
        return parse(System.currentTimeMillis(), url, setCookie);
    }

    static Cookie parse(long currentTimeMillis, HttpUrl url, String setCookie) {
        int limit = setCookie.length();
        int cookiePairEnd = Util.delimiterOffset(setCookie, 0, limit, ';');
        int pairEqualsSign = Util.delimiterOffset(setCookie, 0, cookiePairEnd, '=');
        if (pairEqualsSign == cookiePairEnd) {
            return null;
        }
        String cookieName = Util.trimSubstring(setCookie, 0, pairEqualsSign);
        if (cookieName.isEmpty()) {
            return null;
        }
        String cookieValue = Util.trimSubstring(setCookie, pairEqualsSign + 1, cookiePairEnd);
        long expiresAt = HttpDate.MAX_DATE;
        long deltaSeconds = -1;
        String domain = null;
        String path = null;
        boolean secureOnly = false;
        boolean httpOnly = false;
        boolean hostOnly = true;
        boolean persistent = false;
        int pos = cookiePairEnd + 1;
        while (pos < limit) {
            int attributePairEnd = Util.delimiterOffset(setCookie, pos, limit, ';');
            int attributeEqualsSign = Util.delimiterOffset(setCookie, pos, attributePairEnd, '=');
            String attributeName = Util.trimSubstring(setCookie, pos, attributeEqualsSign);
            String attributeValue = attributeEqualsSign < attributePairEnd ? Util.trimSubstring(setCookie, attributeEqualsSign + 1, attributePairEnd) : "";
            if (attributeName.equalsIgnoreCase("expires")) {
                try {
                    expiresAt = parseExpires(attributeValue, 0, attributeValue.length());
                    persistent = true;
                } catch (IllegalArgumentException e) {
                }
            } else if (attributeName.equalsIgnoreCase("max-age")) {
                try {
                    deltaSeconds = parseMaxAge(attributeValue);
                    persistent = true;
                } catch (NumberFormatException e2) {
                }
            } else if (attributeName.equalsIgnoreCase("domain")) {
                try {
                    domain = parseDomain(attributeValue);
                    hostOnly = false;
                } catch (IllegalArgumentException e3) {
                }
            } else if (attributeName.equalsIgnoreCase("path")) {
                path = attributeValue;
            } else if (attributeName.equalsIgnoreCase("secure")) {
                secureOnly = true;
            } else if (attributeName.equalsIgnoreCase("httponly")) {
                httpOnly = true;
            }
            pos = attributePairEnd + 1;
        }
        if (deltaSeconds == Long.MIN_VALUE) {
            expiresAt = Long.MIN_VALUE;
        } else if (deltaSeconds != -1) {
            long deltaMilliseconds = deltaSeconds <= 9223372036854775L ? deltaSeconds * 1000 : Long.MAX_VALUE;
            expiresAt = currentTimeMillis + deltaMilliseconds;
            if (expiresAt < currentTimeMillis || expiresAt > HttpDate.MAX_DATE) {
                expiresAt = HttpDate.MAX_DATE;
            }
        }
        if (domain == null) {
            domain = url.host();
        } else if (!domainMatch(url, domain)) {
            return null;
        }
        if (path == null || !path.startsWith(CameraUtilsEffects.FILE_DELIM)) {
            String encodedPath = url.encodedPath();
            int lastSlash = encodedPath.lastIndexOf(47);
            path = lastSlash != 0 ? encodedPath.substring(0, lastSlash) : CameraUtilsEffects.FILE_DELIM;
        }
        return new Cookie(cookieName, cookieValue, expiresAt, domain, path, secureOnly, httpOnly, hostOnly, persistent);
    }

    private static long parseExpires(String s, int pos, int limit) {
        int pos2 = dateCharacterOffset(s, pos, limit, false);
        int hour = -1;
        int minute = -1;
        int second = -1;
        int dayOfMonth = -1;
        int month = -1;
        int year = -1;
        Matcher matcher = TIME_PATTERN.matcher(s);
        while (pos2 < limit) {
            int end = dateCharacterOffset(s, pos2 + 1, limit, true);
            matcher.region(pos2, end);
            if (hour == -1 && matcher.usePattern(TIME_PATTERN).matches()) {
                hour = Integer.parseInt(matcher.group(1));
                minute = Integer.parseInt(matcher.group(2));
                second = Integer.parseInt(matcher.group(3));
            } else if (dayOfMonth == -1 && matcher.usePattern(DAY_OF_MONTH_PATTERN).matches()) {
                dayOfMonth = Integer.parseInt(matcher.group(1));
            } else if (month == -1 && matcher.usePattern(MONTH_PATTERN).matches()) {
                String monthString = matcher.group(1).toLowerCase(Locale.US);
                month = MONTH_PATTERN.pattern().indexOf(monthString) / 4;
            } else if (year == -1 && matcher.usePattern(YEAR_PATTERN).matches()) {
                year = Integer.parseInt(matcher.group(1));
            }
            pos2 = dateCharacterOffset(s, end + 1, limit, false);
        }
        if (year >= 70 && year <= 99) {
            year += 1900;
        }
        if (year >= 0 && year <= 69) {
            year += 2000;
        }
        if (year < 1601) {
            throw new IllegalArgumentException();
        }
        if (month == -1) {
            throw new IllegalArgumentException();
        }
        if (dayOfMonth < 1 || dayOfMonth > 31) {
            throw new IllegalArgumentException();
        }
        if (hour < 0 || hour > 23) {
            throw new IllegalArgumentException();
        }
        if (minute < 0 || minute > 59) {
            throw new IllegalArgumentException();
        }
        if (second < 0 || second > 59) {
            throw new IllegalArgumentException();
        }
        Calendar calendar = new GregorianCalendar(Util.UTC);
        calendar.setLenient(false);
        calendar.set(1, year);
        calendar.set(2, month - 1);
        calendar.set(5, dayOfMonth);
        calendar.set(11, hour);
        calendar.set(12, minute);
        calendar.set(13, second);
        calendar.set(14, 0);
        return calendar.getTimeInMillis();
    }

    private static int dateCharacterOffset(String input, int pos, int limit, boolean invert) {
        for (int i = pos; i < limit; i++) {
            int c = input.charAt(i);
            boolean dateCharacter = (c < 32 && c != 9) || c >= 127 || (c >= 48 && c <= 57) || ((c >= 97 && c <= 122) || ((c >= 65 && c <= 90) || c == 58));
            if (dateCharacter == (!invert)) {
                return i;
            }
        }
        return limit;
    }

    private static long parseMaxAge(String s) {
        long parsed = Long.MIN_VALUE;
        try {
            long parsed2 = Long.parseLong(s);
            if (parsed2 > 0) {
                return parsed2;
            }
            return Long.MIN_VALUE;
        } catch (NumberFormatException e) {
            if (s.matches("-?\\d+")) {
                if (!s.startsWith("-")) {
                    parsed = Long.MAX_VALUE;
                }
                return parsed;
            }
            throw e;
        }
    }

    private static String parseDomain(String s) {
        if (s.endsWith(".")) {
            throw new IllegalArgumentException();
        }
        if (s.startsWith(".")) {
            s = s.substring(1);
        }
        String canonicalDomain = Util.domainToAscii(s);
        if (canonicalDomain == null) {
            throw new IllegalArgumentException();
        }
        return canonicalDomain;
    }

    public static List<Cookie> parseAll(HttpUrl url, Headers headers) {
        List<String> cookieStrings = headers.values("Set-Cookie");
        List<Cookie> cookies = null;
        int size = cookieStrings.size();
        for (int i = 0; i < size; i++) {
            Cookie cookie = parse(url, cookieStrings.get(i));
            if (cookie != null) {
                if (cookies == null) {
                    cookies = new ArrayList<>();
                }
                cookies.add(cookie);
            }
        }
        if (cookies != null) {
            return Collections.unmodifiableList(cookies);
        }
        return Collections.emptyList();
    }

    /* loaded from: classes3.dex */
    public static final class Builder {
        String domain;
        boolean hostOnly;
        boolean httpOnly;
        String name;
        boolean persistent;
        boolean secure;
        String value;
        long expiresAt = HttpDate.MAX_DATE;
        String path = CameraUtilsEffects.FILE_DELIM;

        public Builder name(String name) {
            if (name == null) {
                throw new NullPointerException("name == null");
            }
            if (!name.trim().equals(name)) {
                throw new IllegalArgumentException("name is not trimmed");
            }
            this.name = name;
            return this;
        }

        public Builder value(String value) {
            if (value == null) {
                throw new NullPointerException("value == null");
            }
            if (!value.trim().equals(value)) {
                throw new IllegalArgumentException("value is not trimmed");
            }
            this.value = value;
            return this;
        }

        public Builder expiresAt(long expiresAt) {
            if (expiresAt <= 0) {
                expiresAt = Long.MIN_VALUE;
            }
            if (expiresAt > HttpDate.MAX_DATE) {
                expiresAt = HttpDate.MAX_DATE;
            }
            this.expiresAt = expiresAt;
            this.persistent = true;
            return this;
        }

        public Builder domain(String domain) {
            return domain(domain, false);
        }

        public Builder hostOnlyDomain(String domain) {
            return domain(domain, true);
        }

        private Builder domain(String domain, boolean hostOnly) {
            if (domain == null) {
                throw new NullPointerException("domain == null");
            }
            String canonicalDomain = Util.domainToAscii(domain);
            if (canonicalDomain == null) {
                throw new IllegalArgumentException("unexpected domain: " + domain);
            }
            this.domain = canonicalDomain;
            this.hostOnly = hostOnly;
            return this;
        }

        public Builder path(String path) {
            if (!path.startsWith(CameraUtilsEffects.FILE_DELIM)) {
                throw new IllegalArgumentException("path must start with '/'");
            }
            this.path = path;
            return this;
        }

        public Builder secure() {
            this.secure = true;
            return this;
        }

        public Builder httpOnly() {
            this.httpOnly = true;
            return this;
        }

        public Cookie build() {
            return new Cookie(this);
        }
    }

    public String toString() {
        return toString(false);
    }

    String toString(boolean forObsoleteRfc2965) {
        StringBuilder result = new StringBuilder();
        result.append(this.name);
        result.append('=');
        result.append(this.value);
        if (this.persistent) {
            if (this.expiresAt == Long.MIN_VALUE) {
                result.append("; max-age=0");
            } else {
                result.append("; expires=").append(HttpDate.format(new Date(this.expiresAt)));
            }
        }
        if (!this.hostOnly) {
            result.append("; domain=");
            if (forObsoleteRfc2965) {
                result.append(".");
            }
            result.append(this.domain);
        }
        result.append("; path=").append(this.path);
        if (this.secure) {
            result.append("; secure");
        }
        if (this.httpOnly) {
            result.append("; httponly");
        }
        return result.toString();
    }

    public boolean equals(Object other) {
        if (!(other instanceof Cookie)) {
            return false;
        }
        Cookie that = (Cookie) other;
        return that.name.equals(this.name) && that.value.equals(this.value) && that.domain.equals(this.domain) && that.path.equals(this.path) && that.expiresAt == this.expiresAt && that.secure == this.secure && that.httpOnly == this.httpOnly && that.persistent == this.persistent && that.hostOnly == this.hostOnly;
    }

    public int hashCode() {
        int i = 0;
        int hash = this.name.hashCode() + 527;
        int hashCode = ((((((((((((((hash * 31) + this.value.hashCode()) * 31) + this.domain.hashCode()) * 31) + this.path.hashCode()) * 31) + ((int) (this.expiresAt ^ (this.expiresAt >>> 32)))) * 31) + (this.secure ? 0 : 1)) * 31) + (this.httpOnly ? 0 : 1)) * 31) + (this.persistent ? 0 : 1)) * 31;
        if (!this.hostOnly) {
            i = 1;
        }
        int hash2 = hashCode + i;
        return hash2;
    }
}
