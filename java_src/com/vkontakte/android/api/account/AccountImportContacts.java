package com.vkontakte.android.api.account;

import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class AccountImportContacts extends ResultlessAPIRequest {
    public AccountImportContacts(List<String> ids, String myId) {
        super("account.importContacts");
        param("contacts", TextUtils.join(",", ids));
        if (myId != null) {
            param("my_contact", myId);
        }
    }
}
