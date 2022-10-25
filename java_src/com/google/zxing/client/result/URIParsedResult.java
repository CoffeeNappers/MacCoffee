package com.google.zxing.client.result;

import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public final class URIParsedResult extends ParsedResult {
    private static final Pattern USER_IN_HOST = Pattern.compile(":/*([^/@]+)@[^/]+");
    private final String title;
    private final String uri;

    public URIParsedResult(String uri, String title) {
        super(ParsedResultType.URI);
        this.uri = massageURI(uri);
        this.title = title;
    }

    public String getURI() {
        return this.uri;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean isPossiblyMaliciousURI() {
        return USER_IN_HOST.matcher(this.uri).find();
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(30);
        maybeAppend(this.title, result);
        maybeAppend(this.uri, result);
        return result.toString();
    }

    private static String massageURI(String uri) {
        String uri2 = uri.trim();
        int protocolEnd = uri2.indexOf(58);
        if (protocolEnd < 0) {
            return "http://" + uri2;
        }
        if (isColonFollowedByPortNumber(uri2, protocolEnd)) {
            return "http://" + uri2;
        }
        return uri2;
    }

    private static boolean isColonFollowedByPortNumber(String uri, int protocolEnd) {
        int start = protocolEnd + 1;
        int nextSlash = uri.indexOf(47, start);
        if (nextSlash < 0) {
            nextSlash = uri.length();
        }
        return ResultParser.isSubstringOfDigits(uri, start, nextSlash - start);
    }
}
