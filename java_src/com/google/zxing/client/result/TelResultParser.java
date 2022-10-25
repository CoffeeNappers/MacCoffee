package com.google.zxing.client.result;

import com.google.zxing.Result;
/* loaded from: classes2.dex */
public final class TelResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse  reason: collision with other method in class */
    public TelParsedResult mo430parse(Result result) {
        String rawText = getMassagedText(result);
        if (rawText.startsWith("tel:") || rawText.startsWith("TEL:")) {
            String telURI = rawText.startsWith("TEL:") ? "tel:" + rawText.substring(4) : rawText;
            int queryStart = rawText.indexOf(63, 4);
            String number = queryStart < 0 ? rawText.substring(4) : rawText.substring(4, queryStart);
            return new TelParsedResult(number, telURI, null);
        }
        return null;
    }
}
