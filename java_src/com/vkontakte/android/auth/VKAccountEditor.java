package com.vkontakte.android.auth;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
/* loaded from: classes2.dex */
public class VKAccountEditor {
    private VKAccount account;

    /* JADX INFO: Access modifiers changed from: package-private */
    public VKAccountEditor(@NonNull VKAccount account) {
        this.account = new VKAccount(account);
    }

    public VKAccountEditor setName(@Nullable String name) {
        this.account.name = name;
        return this;
    }

    public VKAccountEditor setPhoto(@Nullable String photo) {
        this.account.photo = photo;
        return this;
    }

    public VKAccountEditor setStatus(@Nullable String status) {
        this.account.status = status;
        return this;
    }

    public VKAccountEditor setCountry(int country) {
        this.account.country = country;
        return this;
    }

    public VKAccountEditor setAccessToken(String accessToken) {
        this.account.accessToken = accessToken;
        return this;
    }

    public VKAccountEditor setSecret(String secret) {
        this.account.secret = secret;
        return this;
    }

    public VKAccountEditor setIntro(int intro) {
        this.account.intro = intro;
        return this;
    }

    public VKAccountEditor setMusicIntro(boolean musicIntroWasShowed) {
        this.account.musicIntroWasShowed = musicIntroWasShowed;
        return this;
    }

    public VKAccountEditor setExportTwitterAvail(boolean exportTwitterAvail) {
        this.account.exportTwitterAvail = exportTwitterAvail;
        return this;
    }

    public VKAccountEditor setExportFacebookAvail(boolean exportFacebookAvail) {
        this.account.exportFacebookAvail = exportFacebookAvail;
        return this;
    }

    public void commit() {
        VKAccountManager.updateCurrent(this.account);
    }
}
