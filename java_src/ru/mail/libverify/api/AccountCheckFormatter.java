package ru.mail.libverify.api;

import java.util.List;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.sms.SmsItem;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
class AccountCheckFormatter implements Gsonable {
    final List<SmsItem> items;
    final VerificationApi.AccountCheckResult status;

    AccountCheckFormatter() {
        this.items = null;
        this.status = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AccountCheckFormatter(List<SmsItem> list) {
        this.items = list;
        this.status = VerificationApi.AccountCheckResult.OK;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AccountCheckFormatter(VerificationApi.AccountCheckResult accountCheckResult) {
        this.items = null;
        this.status = accountCheckResult;
    }
}
