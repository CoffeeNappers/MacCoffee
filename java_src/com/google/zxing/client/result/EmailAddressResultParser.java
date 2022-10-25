package com.google.zxing.client.result;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.zxing.Result;
import java.util.Map;
/* loaded from: classes2.dex */
public final class EmailAddressResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse */
    public EmailAddressParsedResult mo430parse(Result result) {
        String rawText = getMassagedText(result);
        if (rawText.startsWith("mailto:") || rawText.startsWith("MAILTO:")) {
            String emailAddress = rawText.substring(7);
            int queryStart = emailAddress.indexOf(63);
            if (queryStart >= 0) {
                emailAddress = emailAddress.substring(0, queryStart);
            }
            String emailAddress2 = urlDecode(emailAddress);
            Map<String, String> nameValues = parseNameValuePairs(rawText);
            String subject = null;
            String body = null;
            if (nameValues != null) {
                if (emailAddress2.isEmpty()) {
                    emailAddress2 = nameValues.get("to");
                }
                String subject2 = nameValues.get("subject");
                subject = subject2;
                String body2 = nameValues.get(TtmlNode.TAG_BODY);
                body = body2;
            }
            return new EmailAddressParsedResult(emailAddress2, subject, body, rawText);
        } else if (!EmailDoCoMoResultParser.isBasicallyValidEmailAddress(rawText)) {
            return null;
        } else {
            return new EmailAddressParsedResult(rawText, null, null, "mailto:" + rawText);
        }
    }
}
