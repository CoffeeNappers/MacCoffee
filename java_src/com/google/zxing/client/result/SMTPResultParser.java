package com.google.zxing.client.result;

import com.google.zxing.Result;
/* loaded from: classes2.dex */
public final class SMTPResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse */
    public EmailAddressParsedResult mo430parse(Result result) {
        String rawText = getMassagedText(result);
        if (!rawText.startsWith("smtp:") && !rawText.startsWith("SMTP:")) {
            return null;
        }
        String emailAddress = rawText.substring(5);
        String subject = null;
        String body = null;
        int colon = emailAddress.indexOf(58);
        if (colon >= 0) {
            subject = emailAddress.substring(colon + 1);
            emailAddress = emailAddress.substring(0, colon);
            int colon2 = subject.indexOf(58);
            if (colon2 >= 0) {
                body = subject.substring(colon2 + 1);
                subject = subject.substring(0, colon2);
            }
        }
        String mailtoURI = "mailto:" + emailAddress;
        return new EmailAddressParsedResult(emailAddress, subject, body, mailtoURI);
    }
}
