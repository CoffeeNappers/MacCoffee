package com.google.zxing.client.result;

import com.google.zxing.Result;
/* loaded from: classes2.dex */
public final class URLTOResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse  reason: collision with other method in class */
    public URIParsedResult mo430parse(Result result) {
        int titleEnd;
        String title = null;
        String rawText = getMassagedText(result);
        if ((rawText.startsWith("urlto:") || rawText.startsWith("URLTO:")) && (titleEnd = rawText.indexOf(58, 6)) >= 0) {
            if (titleEnd > 6) {
                title = rawText.substring(6, titleEnd);
            }
            String uri = rawText.substring(titleEnd + 1);
            return new URIParsedResult(uri, title);
        }
        return null;
    }
}
