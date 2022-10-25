package com.vkontakte.android.auth;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.auth.configs.AudioAdConfig;
import com.vkontakte.android.auth.configs.ProfilerConfig;
import com.vkontakte.android.auth.configs.VideoConfig;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes.dex */
public class VKAccount {
    static final String DEFAULT_NAME = "DELETED";
    static final int DEFAULT_UID = 0;
    @Nullable
    volatile String accessToken;
    boolean allowBuyVotes;
    boolean audioAdAvailable;
    AudioAdConfig audioAdConfig;
    int audioBackgroundLimit;
    public boolean communityComments;
    int country;
    public boolean debugAvailable;
    String defaultAudioPlayer;
    boolean exportFacebookAvail;
    boolean exportTwitterAvail;
    String first_name_gen;
    boolean gifAutoPlayAvailable;
    boolean hasMusicSubscription;
    public boolean htmlGamesEnabled;
    int intro;
    boolean isFemale;
    boolean isMusicRestricted;
    String last_name_gen;
    boolean masksAvailable;
    public String monetTransfersCurrency;
    public boolean moneyTransfersAvailable;
    public boolean moneyTransfersCanSend;
    public boolean moneyTransfersCanSendToCommunities;
    public int moneyTransfersMaxAmount;
    public int moneyTransfersMinAmount;
    boolean musicIntroWasShowed;
    @Nullable
    String name;
    @Nullable
    String photo;
    ProfilerConfig profilerConfig;
    boolean riseToRecordAvailable;
    @Nullable
    String secret;
    @Nullable
    String status;
    boolean storiesAvailable;
    @Nullable
    String supportUrl;
    int uid;
    boolean useVigo;
    public boolean useWebAppForReportContent;
    boolean verified;
    boolean videoAutoPlayAvailable;
    VideoConfig videoConfig;
    int vigoConnectTimeout;
    int vigoReadTimeout;
    boolean vkLiveStreamAvailable;

    /* JADX INFO: Access modifiers changed from: package-private */
    public VKAccount() {
        this.uid = 0;
        this.accessToken = null;
        this.secret = null;
        this.name = DEFAULT_NAME;
        this.photo = null;
        this.status = null;
        this.country = 0;
        this.isFemale = false;
        this.intro = 0;
        this.debugAvailable = false;
        this.exportTwitterAvail = false;
        this.exportFacebookAvail = false;
        this.allowBuyVotes = false;
        this.supportUrl = "about:blank";
        this.useVigo = false;
        this.vigoConnectTimeout = 1000;
        this.vigoReadTimeout = 1000;
        this.gifAutoPlayAvailable = false;
        this.videoAutoPlayAvailable = false;
        this.hasMusicSubscription = false;
        this.isMusicRestricted = false;
        this.storiesAvailable = false;
        this.masksAvailable = false;
        this.useWebAppForReportContent = false;
        this.communityComments = false;
        this.musicIntroWasShowed = false;
        this.audioBackgroundLimit = -1;
        this.riseToRecordAvailable = false;
        this.vkLiveStreamAvailable = false;
        this.audioAdAvailable = false;
        this.first_name_gen = "";
        this.last_name_gen = "";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public VKAccount(@NonNull VKAccount account) {
        this.uid = 0;
        this.accessToken = null;
        this.secret = null;
        this.name = DEFAULT_NAME;
        this.photo = null;
        this.status = null;
        this.country = 0;
        this.isFemale = false;
        this.intro = 0;
        this.debugAvailable = false;
        this.exportTwitterAvail = false;
        this.exportFacebookAvail = false;
        this.allowBuyVotes = false;
        this.supportUrl = "about:blank";
        this.useVigo = false;
        this.vigoConnectTimeout = 1000;
        this.vigoReadTimeout = 1000;
        this.gifAutoPlayAvailable = false;
        this.videoAutoPlayAvailable = false;
        this.hasMusicSubscription = false;
        this.isMusicRestricted = false;
        this.storiesAvailable = false;
        this.masksAvailable = false;
        this.useWebAppForReportContent = false;
        this.communityComments = false;
        this.musicIntroWasShowed = false;
        this.audioBackgroundLimit = -1;
        this.riseToRecordAvailable = false;
        this.vkLiveStreamAvailable = false;
        this.audioAdAvailable = false;
        this.first_name_gen = "";
        this.last_name_gen = "";
        this.uid = account.uid;
        this.accessToken = account.accessToken;
        this.secret = account.secret;
        fillUserData(account);
    }

    public void fillUserData(@NonNull VKAccount account) {
        this.name = account.name;
        this.first_name_gen = account.first_name_gen;
        this.last_name_gen = account.last_name_gen;
        this.verified = account.verified;
        this.photo = account.photo;
        this.status = account.status;
        this.country = account.country;
        this.isFemale = account.isFemale;
        this.intro = account.intro;
        this.exportTwitterAvail = account.exportTwitterAvail;
        this.exportFacebookAvail = account.exportFacebookAvail;
        this.allowBuyVotes = account.allowBuyVotes;
        this.supportUrl = account.supportUrl;
        this.useVigo = account.useVigo;
        this.htmlGamesEnabled = account.htmlGamesEnabled;
        this.communityComments = account.communityComments;
        this.useWebAppForReportContent = account.useWebAppForReportContent;
        this.vigoConnectTimeout = account.vigoConnectTimeout;
        this.vigoReadTimeout = account.vigoReadTimeout;
        this.gifAutoPlayAvailable = account.gifAutoPlayAvailable;
        this.videoAutoPlayAvailable = account.videoAutoPlayAvailable;
        this.moneyTransfersAvailable = account.moneyTransfersAvailable;
        this.moneyTransfersCanSend = account.moneyTransfersCanSend;
        this.monetTransfersCurrency = account.monetTransfersCurrency;
        this.moneyTransfersMinAmount = account.moneyTransfersMinAmount;
        this.moneyTransfersMaxAmount = account.moneyTransfersMaxAmount;
        this.moneyTransfersCanSendToCommunities = account.moneyTransfersCanSendToCommunities;
        this.riseToRecordAvailable = account.riseToRecordAvailable;
        this.vkLiveStreamAvailable = account.vkLiveStreamAvailable;
        this.debugAvailable = account.debugAvailable;
        this.defaultAudioPlayer = account.defaultAudioPlayer;
        this.storiesAvailable = account.storiesAvailable;
        this.masksAvailable = account.masksAvailable;
        this.audioAdAvailable = account.audioAdAvailable;
        this.audioAdConfig = account.audioAdConfig;
        this.hasMusicSubscription = account.hasMusicSubscription;
        this.profilerConfig = account.profilerConfig;
        this.isMusicRestricted = account.isMusicRestricted;
        this.videoConfig = account.videoConfig;
        this.musicIntroWasShowed = account.musicIntroWasShowed;
        this.audioBackgroundLimit = account.audioBackgroundLimit;
    }

    public int getUid() {
        return this.uid;
    }

    @Nullable
    public String getAccessToken() {
        return this.accessToken;
    }

    @Nullable
    public String getSecret() {
        return this.secret;
    }

    @Nullable
    public String getName() {
        return this.name;
    }

    public String getFirstNameGen() {
        return this.first_name_gen;
    }

    public String getLastNameGen() {
        return this.last_name_gen;
    }

    public boolean getIsVerified() {
        return this.verified;
    }

    @Nullable
    public String getPhoto() {
        return this.photo;
    }

    @Nullable
    public String getStatus() {
        return this.status;
    }

    public int getCountry() {
        return this.country;
    }

    public boolean isFemale() {
        return this.isFemale;
    }

    public int getIntro() {
        return this.intro;
    }

    public boolean isMusicIntroWasShowed() {
        return this.musicIntroWasShowed;
    }

    public int getAudioBackgroundLimit() {
        return this.audioBackgroundLimit;
    }

    public boolean isExportTwitterAvail() {
        return this.exportTwitterAvail;
    }

    public boolean isExportFacebookAvail() {
        return this.exportFacebookAvail;
    }

    public boolean isAllowBuyVotes() {
        return this.allowBuyVotes;
    }

    @Nullable
    public String getSupportUrl() {
        return this.supportUrl;
    }

    public boolean isUseVigo() {
        return this.useVigo;
    }

    public int getVigoConnectTimeout() {
        return this.vigoConnectTimeout;
    }

    public int getVigoReadTimeout() {
        return this.vigoReadTimeout;
    }

    public boolean isGifAutoPlayAvailable() {
        return this.gifAutoPlayAvailable;
    }

    public boolean isVideoAutoPlayAvailable() {
        return this.videoAutoPlayAvailable;
    }

    public String getDefaultAudioPlayer() {
        return this.defaultAudioPlayer;
    }

    public boolean isStoriesAvailable() {
        return this.storiesAvailable;
    }

    public boolean isMasksAvailable() {
        return this.masksAvailable;
    }

    public boolean isRiseToRecordAvailable() {
        return this.riseToRecordAvailable;
    }

    public boolean isVkLiveStreamAvailable() {
        return this.vkLiveStreamAvailable;
    }

    public boolean isAudioAdAvailable() {
        return this.audioAdAvailable && !hasMusicSubscription();
    }

    public boolean hasMusicSubscription() {
        return this.hasMusicSubscription;
    }

    public boolean isMusicRestricted() {
        return this.isMusicRestricted;
    }

    public AudioAdConfig getAudioAdConfig() {
        return this.audioAdConfig;
    }

    public ProfilerConfig getProfilerConfig() {
        return this.profilerConfig;
    }

    public VideoConfig getVideoConfig() {
        return this.videoConfig;
    }

    public boolean isReal() {
        return this.uid != 0;
    }

    public String toString() {
        return Utils.objectToString(this);
    }
}
