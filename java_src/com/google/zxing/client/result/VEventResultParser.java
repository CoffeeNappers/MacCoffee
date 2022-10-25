package com.google.zxing.client.result;

import com.facebook.share.internal.ShareConstants;
import com.google.zxing.Result;
import java.util.List;
/* loaded from: classes2.dex */
public final class VEventResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse */
    public CalendarParsedResult mo430parse(Result result) {
        double latitude;
        double longitude;
        String rawText = getMassagedText(result);
        int vEventStart = rawText.indexOf("BEGIN:VEVENT");
        if (vEventStart < 0) {
            return null;
        }
        String summary = matchSingleVCardPrefixedField("SUMMARY", rawText, true);
        String start = matchSingleVCardPrefixedField("DTSTART", rawText, true);
        if (start == null) {
            return null;
        }
        String end = matchSingleVCardPrefixedField("DTEND", rawText, true);
        String duration = matchSingleVCardPrefixedField("DURATION", rawText, true);
        String location = matchSingleVCardPrefixedField("LOCATION", rawText, true);
        String organizer = stripMailto(matchSingleVCardPrefixedField("ORGANIZER", rawText, true));
        String[] attendees = matchVCardPrefixedField("ATTENDEE", rawText, true);
        if (attendees != null) {
            for (int i = 0; i < attendees.length; i++) {
                attendees[i] = stripMailto(attendees[i]);
            }
        }
        String description = matchSingleVCardPrefixedField(ShareConstants.DESCRIPTION, rawText, true);
        String geoString = matchSingleVCardPrefixedField("GEO", rawText, true);
        if (geoString == null) {
            latitude = Double.NaN;
            longitude = Double.NaN;
        } else {
            int semicolon = geoString.indexOf(59);
            if (semicolon < 0) {
                return null;
            }
            try {
                latitude = Double.parseDouble(geoString.substring(0, semicolon));
                longitude = Double.parseDouble(geoString.substring(semicolon + 1));
            } catch (NumberFormatException e) {
                return null;
            }
        }
        try {
            return new CalendarParsedResult(summary, start, end, duration, location, organizer, attendees, description, latitude, longitude);
        } catch (IllegalArgumentException e2) {
            return null;
        }
    }

    private static String matchSingleVCardPrefixedField(CharSequence prefix, String rawText, boolean trim) {
        List<String> values = VCardResultParser.matchSingleVCardPrefixedField(prefix, rawText, trim, false);
        if (values == null || values.isEmpty()) {
            return null;
        }
        return values.get(0);
    }

    private static String[] matchVCardPrefixedField(CharSequence prefix, String rawText, boolean trim) {
        List<List<String>> values = VCardResultParser.matchVCardPrefixedField(prefix, rawText, trim, false);
        if (values == null || values.isEmpty()) {
            return null;
        }
        int size = values.size();
        String[] result = new String[size];
        for (int i = 0; i < size; i++) {
            result[i] = values.get(i).get(0);
        }
        return result;
    }

    private static String stripMailto(String s) {
        if (s != null) {
            if (s.startsWith("mailto:") || s.startsWith("MAILTO:")) {
                return s.substring(7);
            }
            return s;
        }
        return s;
    }
}
