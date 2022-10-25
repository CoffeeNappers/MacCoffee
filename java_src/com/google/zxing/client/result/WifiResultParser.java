package com.google.zxing.client.result;

import com.google.zxing.Result;
/* loaded from: classes2.dex */
public final class WifiResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse  reason: collision with other method in class */
    public WifiParsedResult mo430parse(Result result) {
        String ssid;
        String rawText = getMassagedText(result);
        if (rawText.startsWith("WIFI:") && (ssid = matchSinglePrefixedField("S:", rawText, ';', false)) != null && !ssid.isEmpty()) {
            String pass = matchSinglePrefixedField("P:", rawText, ';', false);
            String type = matchSinglePrefixedField("T:", rawText, ';', false);
            if (type == null) {
                type = "nopass";
            }
            boolean hidden = Boolean.parseBoolean(matchSinglePrefixedField("H:", rawText, ';', false));
            return new WifiParsedResult(type, ssid, pass, hidden);
        }
        return null;
    }
}
