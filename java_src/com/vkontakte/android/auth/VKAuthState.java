package com.vkontakte.android.auth;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.Global;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class VKAuthState implements Parcelable {
    public static final Parcelable.Creator<VKAuthState> CREATOR = new Parcelable.Creator<VKAuthState>() { // from class: com.vkontakte.android.auth.VKAuthState.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public VKAuthState mo950createFromParcel(Parcel in) {
            int size = in.readInt();
            VKAuthState VKAuthState = new VKAuthState();
            for (int i = 0; i < size; i++) {
                VKAuthState.map.put(in.readString(), in.readString());
            }
            VKAuthState.accessToken = in.readString();
            VKAuthState.secret = in.readString();
            VKAuthState.userId = in.readInt();
            return VKAuthState;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public VKAuthState[] mo951newArray(int size) {
            return new VKAuthState[size];
        }
    };
    String accessToken;
    private boolean isNeedStoreAfterAuth;
    private final LinkedHashMap<String, String> map;
    String secret;
    int userId;

    public VKAuthState libverifySupport() {
        this.map.put("libverify_support", String.valueOf(1));
        return this;
    }

    public String getUserName() {
        return this.map.get("username");
    }

    private static VKAuthState newState() {
        VKAuthState state = new VKAuthState();
        state.map.put("device_id", Settings.Secure.getString(VKApplication.context.getContentResolver(), "android_id"));
        return state;
    }

    public static VKAuthState byLoginPassword(@NonNull String login, @NonNull String password) {
        VKAuthState helper = newState();
        helper.map.put("grant_type", "password");
        helper.map.put("username", login);
        helper.map.put("password", password);
        return helper;
    }

    public static VKAuthState byExternalService(@NonNull String service, @NonNull String token) {
        VKAuthState helper = newState();
        helper.map.put("grant_type", "vk_external_auth");
        helper.map.put("vk_external_token", token);
        helper.map.put("vk_service", service);
        return helper;
    }

    public static VKAuthState restoreWithCode(@NonNull String sid, @NonNull String code) {
        VKAuthState helper = newState();
        helper.map.put("grant_type", "restore_code");
        helper.map.put("sid", sid);
        helper.map.put(AuthCheckFragment.KEY_CODE, code);
        helper.isNeedStoreAfterAuth = false;
        return helper;
    }

    public static VKAuthState restoreWithLibverifyToken(@NonNull String sid, @NonNull String session, @NonNull String token) {
        VKAuthState helper = newState();
        helper.map.put("grant_type", "restore_code");
        helper.map.put("sid", sid);
        helper.map.put("validate_session", session);
        helper.map.put("validate_token", token);
        helper.map.put("libverify_support", String.valueOf(1));
        helper.isNeedStoreAfterAuth = false;
        return helper;
    }

    public static VKAuthState byAuthData(@NonNull String accessToken, @NonNull String secret, int userId) {
        return new VKAuthState(accessToken, secret, userId);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public VKAuthState setCaptchaInfo(@Nullable String captchaSid, @Nullable String captchaKey) {
        if (!TextUtils.isEmpty(captchaSid) && !TextUtils.isEmpty(captchaKey)) {
            this.map.put("captcha_sid", captchaSid);
            this.map.put("captcha_key", captchaKey);
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public VKAuthState setValidateCode(@Nullable String code) {
        if (!TextUtils.isEmpty(code)) {
            this.map.put(AuthCheckFragment.KEY_CODE, code);
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public VKAuthState setLibverifyToken(@NonNull String session, @NonNull String token) {
        this.map.put("validate_session", session);
        this.map.put("validate_token", token);
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean canSkipAuth() {
        return !TextUtils.isEmpty(this.accessToken) && !TextUtils.isEmpty(this.secret) && this.userId != 0 && mapIsEmpty(this.map);
    }

    private boolean mapIsEmpty(@NonNull Map<String, String> map) {
        for (String s : map.keySet()) {
            String valueOf = String.valueOf(s);
            char c = 65535;
            switch (valueOf.hashCode()) {
                case 3314158:
                    if (valueOf.equals("lang")) {
                        c = 0;
                        continue;
                    } else {
                        continue;
                    }
            }
            switch (c) {
                case 0:
                    break;
                default:
                    return false;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isNeedStoreAfterAuth() {
        return this.isNeedStoreAfterAuth;
    }

    private VKAuthState() {
        this.isNeedStoreAfterAuth = true;
        this.map = new LinkedHashMap<>();
        this.map.put("lang", Global.getDeviceLang());
    }

    private VKAuthState(String accessToken, String secret, int userId) {
        this();
        this.accessToken = accessToken;
        this.secret = secret;
        this.userId = userId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void visit(Uri.Builder uriBuilder) {
        for (Map.Entry<String, String> entry : this.map.entrySet()) {
            uriBuilder.appendQueryParameter(entry.getKey(), entry.getValue());
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeInt(this.map.size());
        for (Map.Entry<String, String> entry : this.map.entrySet()) {
            parcel.writeString(entry.getKey());
            parcel.writeString(entry.getValue());
        }
        parcel.writeString(this.accessToken);
        parcel.writeString(this.secret);
        parcel.writeInt(this.userId);
    }
}
