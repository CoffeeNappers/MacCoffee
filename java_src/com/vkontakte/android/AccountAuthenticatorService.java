package com.vkontakte.android;

import android.accounts.AbstractAccountAuthenticator;
import android.accounts.Account;
import android.accounts.AccountAuthenticatorResponse;
import android.accounts.NetworkErrorException;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
/* loaded from: classes2.dex */
public class AccountAuthenticatorService extends Service {
    private static AccountAuthenticatorImpl accountAuthenticator;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        if (!intent.getAction().equals("android.accounts.AccountAuthenticator")) {
            return null;
        }
        IBinder ret = getAuthenticator().getIBinder();
        return ret;
    }

    private AccountAuthenticatorImpl getAuthenticator() {
        if (accountAuthenticator == null) {
            accountAuthenticator = new AccountAuthenticatorImpl(this);
        }
        return accountAuthenticator;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class AccountAuthenticatorImpl extends AbstractAccountAuthenticator {
        private Context mContext;

        public AccountAuthenticatorImpl(Context context) {
            super(context);
            this.mContext = context;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public Bundle addAccount(AccountAuthenticatorResponse response, String accountType, String authTokenType, String[] requiredFeatures, Bundle options) throws NetworkErrorException {
            Bundle reply = new Bundle();
            Intent i = new Intent(this.mContext, AuthActivity.class);
            i.putExtra("accountAuthenticatorResponse", response);
            reply.putParcelable("intent", i);
            return reply;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public Bundle confirmCredentials(AccountAuthenticatorResponse response, Account account, Bundle options) {
            return null;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public Bundle editProperties(AccountAuthenticatorResponse response, String accountType) {
            return null;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public Bundle getAuthToken(AccountAuthenticatorResponse response, Account account, String authTokenType, Bundle options) throws NetworkErrorException {
            return null;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public String getAuthTokenLabel(String authTokenType) {
            return null;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public Bundle hasFeatures(AccountAuthenticatorResponse response, Account account, String[] features) throws NetworkErrorException {
            return null;
        }

        @Override // android.accounts.AbstractAccountAuthenticator
        public Bundle updateCredentials(AccountAuthenticatorResponse response, Account account, String authTokenType, Bundle options) {
            return null;
        }
    }
}
