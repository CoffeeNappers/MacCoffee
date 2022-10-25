.class public Lcom/vkontakte/android/auth/VKAccount;
.super Ljava/lang/Object;
.source "VKAccount.java"


# static fields
.field static final DEFAULT_NAME:Ljava/lang/String; = "DELETED"

.field static final DEFAULT_UID:I


# instance fields
.field volatile accessToken:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field allowBuyVotes:Z

.field audioAdAvailable:Z

.field audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

.field audioBackgroundLimit:I

.field public communityComments:Z

.field country:I

.field public debugAvailable:Z

.field defaultAudioPlayer:Ljava/lang/String;

.field exportFacebookAvail:Z

.field exportTwitterAvail:Z

.field first_name_gen:Ljava/lang/String;

.field gifAutoPlayAvailable:Z

.field hasMusicSubscription:Z

.field public htmlGamesEnabled:Z

.field intro:I

.field isFemale:Z

.field isMusicRestricted:Z

.field last_name_gen:Ljava/lang/String;

.field masksAvailable:Z

.field public monetTransfersCurrency:Ljava/lang/String;

.field public moneyTransfersAvailable:Z

.field public moneyTransfersCanSend:Z

.field public moneyTransfersCanSendToCommunities:Z

.field public moneyTransfersMaxAmount:I

.field public moneyTransfersMinAmount:I

.field musicIntroWasShowed:Z

.field name:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field photo:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

.field riseToRecordAvailable:Z

.field secret:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field status:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field storiesAvailable:Z

.field supportUrl:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field uid:I

.field useVigo:Z

.field public useWebAppForReportContent:Z

.field verified:Z

.field videoAutoPlayAvailable:Z

.field videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

.field vigoConnectTimeout:I

.field vigoReadTimeout:I

.field vkLiveStreamAvailable:Z


# direct methods
.method constructor <init>()V
    .locals 4

    .prologue
    const/16 v3, 0x3e8

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput v1, p0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    .line 18
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 21
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 24
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 27
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 30
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 33
    iput v1, p0, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 35
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    .line 37
    iput v1, p0, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 39
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    .line 41
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 43
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 45
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    .line 47
    const-string/jumbo v0, "about:blank"

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    .line 50
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    .line 52
    iput v3, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    .line 54
    iput v3, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    .line 56
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    .line 58
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    .line 60
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    .line 62
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    .line 66
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    .line 68
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    .line 79
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    .line 81
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 83
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    .line 86
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    .line 87
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    .line 88
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    .line 93
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    .line 94
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    .line 99
    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 4
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/16 v3, 0x3e8

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput v1, p0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    .line 18
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 21
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 24
    const-string/jumbo v0, "DELETED"

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 27
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 30
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 33
    iput v1, p0, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 35
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    .line 37
    iput v1, p0, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 39
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    .line 41
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 43
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 45
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    .line 47
    const-string/jumbo v0, "about:blank"

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    .line 50
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    .line 52
    iput v3, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    .line 54
    iput v3, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    .line 56
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    .line 58
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    .line 60
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    .line 62
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    .line 66
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    .line 68
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    .line 79
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    .line 81
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 83
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    .line 86
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    .line 87
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    .line 88
    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    .line 93
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    .line 94
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    .line 102
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    .line 103
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    .line 104
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    .line 105
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/auth/VKAccount;->fillUserData(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 106
    return-void
.end method


# virtual methods
.method public fillUserData(Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 1
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 109
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 110
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    .line 111
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    .line 112
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    .line 113
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    .line 114
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    .line 115
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->country:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->country:I

    .line 116
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    .line 117
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    .line 118
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    .line 119
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    .line 120
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    .line 121
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    .line 122
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    .line 123
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    .line 124
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 125
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    .line 126
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    .line 127
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    .line 128
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    .line 129
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    .line 130
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    .line 131
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    .line 132
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    .line 133
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    .line 134
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    .line 135
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    .line 136
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    .line 137
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    .line 138
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    .line 139
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    .line 140
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    .line 141
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    .line 142
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    .line 143
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    .line 144
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    .line 145
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    .line 146
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    .line 147
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    .line 148
    iget-boolean v0, p1, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    .line 149
    iget v0, p1, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    .line 150
    return-void
.end method

.method public getAccessToken()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getAudioAdConfig()Lcom/vkontakte/android/auth/configs/AudioAdConfig;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioAdConfig:Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    return-object v0
.end method

.method public getAudioBackgroundLimit()I
    .locals 1

    .prologue
    .line 208
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioBackgroundLimit:I

    return v0
.end method

.method public getCountry()I
    .locals 1

    .prologue
    .line 192
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->country:I

    return v0
.end method

.method public getDefaultAudioPlayer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->defaultAudioPlayer:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstNameGen()Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->first_name_gen:Ljava/lang/String;

    return-object v0
.end method

.method public getIntro()I
    .locals 1

    .prologue
    .line 200
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->intro:I

    return v0
.end method

.method public getIsVerified()Z
    .locals 1

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->verified:Z

    return v0
.end method

.method public getLastNameGen()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->last_name_gen:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoto()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getProfilerConfig()Lcom/vkontakte/android/auth/configs/ProfilerConfig;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    return-object v0
.end method

.method public getSecret()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportUrl()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->supportUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()I
    .locals 1

    .prologue
    .line 153
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    return v0
.end method

.method public getVideoConfig()Lcom/vkontakte/android/auth/configs/VideoConfig;
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAccount;->videoConfig:Lcom/vkontakte/android/auth/configs/VideoConfig;

    return-object v0
.end method

.method public getVigoConnectTimeout()I
    .locals 1

    .prologue
    .line 233
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoConnectTimeout:I

    return v0
.end method

.method public getVigoReadTimeout()I
    .locals 1

    .prologue
    .line 237
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->vigoReadTimeout:I

    return v0
.end method

.method public hasMusicSubscription()Z
    .locals 1

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription:Z

    return v0
.end method

.method public isAllowBuyVotes()Z
    .locals 1

    .prologue
    .line 220
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->allowBuyVotes:Z

    return v0
.end method

.method public isAudioAdAvailable()Z
    .locals 1

    .prologue
    .line 269
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->audioAdAvailable:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExportFacebookAvail()Z
    .locals 1

    .prologue
    .line 216
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->exportFacebookAvail:Z

    return v0
.end method

.method public isExportTwitterAvail()Z
    .locals 1

    .prologue
    .line 212
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->exportTwitterAvail:Z

    return v0
.end method

.method public isFemale()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->isFemale:Z

    return v0
.end method

.method public isGifAutoPlayAvailable()Z
    .locals 1

    .prologue
    .line 241
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->gifAutoPlayAvailable:Z

    return v0
.end method

.method public isMasksAvailable()Z
    .locals 1

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->masksAvailable:Z

    return v0
.end method

.method public isMusicIntroWasShowed()Z
    .locals 1

    .prologue
    .line 204
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->musicIntroWasShowed:Z

    return v0
.end method

.method public isMusicRestricted()Z
    .locals 1

    .prologue
    .line 277
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted:Z

    return v0
.end method

.method public isReal()Z
    .locals 1

    .prologue
    .line 293
    iget v0, p0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRiseToRecordAvailable()Z
    .locals 1

    .prologue
    .line 261
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->riseToRecordAvailable:Z

    return v0
.end method

.method public isStoriesAvailable()Z
    .locals 1

    .prologue
    .line 253
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->storiesAvailable:Z

    return v0
.end method

.method public isUseVigo()Z
    .locals 1

    .prologue
    .line 229
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->useVigo:Z

    return v0
.end method

.method public isVideoAutoPlayAvailable()Z
    .locals 1

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->videoAutoPlayAvailable:Z

    return v0
.end method

.method public isVkLiveStreamAvailable()Z
    .locals 1

    .prologue
    .line 265
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAccount;->vkLiveStreamAvailable:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 298
    invoke-static {p0}, Lcom/vkontakte/android/utils/Utils;->objectToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
