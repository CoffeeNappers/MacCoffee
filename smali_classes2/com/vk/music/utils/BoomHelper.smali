.class public final Lcom/vk/music/utils/BoomHelper;
.super Ljava/lang/Object;
.source "BoomHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/utils/BoomHelper$From;,
        Lcom/vk/music/utils/BoomHelper$Action;
    }
.end annotation


# static fields
.field private static final BOOM_PACKAGE:Ljava/lang/String; = "com.uma.musicvk"


# instance fields
.field private setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/utils/BoomHelper;->setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/utils/BoomHelper;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/utils/BoomHelper;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vk/music/utils/BoomHelper;->setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method private static isAppInstalled(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 3
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 119
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 120
    .local v1, "mgr":Landroid/content/pm/PackageManager;
    const/4 v0, 0x0

    .line 122
    .local v0, "info":Landroid/content/pm/PackageInfo;
    const/16 v2, 0x80

    :try_start_0
    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 126
    :goto_0
    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :goto_1
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 123
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static isBoomInstalled(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 85
    const-string/jumbo v0, "com.uma.musicvk"

    invoke-static {v0, p0}, Lcom/vk/music/utils/BoomHelper;->isAppInstalled(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private static open(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .locals 10
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "refer"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 130
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 131
    :cond_0
    const-string/jumbo v5, "No platform_id, can\'t start app!"

    invoke-static {p1, v5, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 161
    :goto_0
    return-void

    .line 135
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 136
    .local v3, "mgr":Landroid/content/pm/PackageManager;
    const/4 v1, 0x0

    .line 138
    .local v1, "info":Landroid/content/pm/PackageInfo;
    const/16 v5, 0x80

    :try_start_1
    invoke-virtual {v3, p0, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 142
    :goto_1
    if-eqz v1, :cond_3

    .line 143
    :try_start_2
    invoke-virtual {v3, p0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 144
    .local v2, "launcherIntent":Landroid/content/Intent;
    if-nez v2, :cond_2

    .line 145
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Package "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " has no launchable activities"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {p1, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 157
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "launcherIntent":Landroid/content/Intent;
    .end local v3    # "mgr":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v4

    .line 158
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    const v5, 0x7f0801f9

    invoke-static {p1, v5, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 148
    .end local v4    # "x":Ljava/lang/Exception;
    .restart local v1    # "info":Landroid/content/pm/PackageInfo;
    .restart local v2    # "launcherIntent":Landroid/content/Intent;
    .restart local v3    # "mgr":Landroid/content/pm/PackageManager;
    :cond_2
    :try_start_3
    const-string/jumbo v5, "auth_user_id"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 149
    invoke-virtual {p1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 152
    .end local v2    # "launcherIntent":Landroid/content/Intent;
    :cond_3
    :try_start_4
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "market://details?id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "&referrer="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_4
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 153
    :catch_1
    move-exception v0

    .line 154
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    :try_start_5
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "http://play.google.com/store/apps/details?id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "&referrer="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    .line 139
    .end local v0    # "anfe":Landroid/content/ActivityNotFoundException;
    :catch_2
    move-exception v5

    goto/16 :goto_1
.end method

.method private static openBoom(Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$Action;Ljava/lang/String;I)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "action"    # Lcom/vk/music/utils/BoomHelper$Action;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "mid"    # Ljava/lang/String;
    .param p3, "position"    # I

    .prologue
    .line 106
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "boom://store/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "?action="

    .line 107
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vk/music/utils/BoomHelper$Action;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 108
    .local v0, "boomLink":Ljava/lang/StringBuilder;
    sget-object v2, Lcom/vk/music/utils/BoomHelper$Action;->play:Lcom/vk/music/utils/BoomHelper$Action;

    if-ne p1, v2, :cond_0

    .line 109
    const-string/jumbo v2, "&position="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    :cond_0
    const-string/jumbo v2, "&from=vk"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 113
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 114
    return-void
.end method

.method public static openBoom(Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$From;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "from"    # Lcom/vk/music/utils/BoomHelper$From;

    .prologue
    .line 89
    sget-object v0, Lcom/vk/music/utils/BoomHelper$3;->$SwitchMap$com$vk$music$utils$BoomHelper$From:[I

    invoke-virtual {p1}, Lcom/vk/music/utils/BoomHelper$From;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 103
    :goto_0
    return-void

    .line 91
    :pswitch_0
    const-string/jumbo v0, "com.uma.musicvk"

    const-string/jumbo v1, "utm_source%3Dvkontakte%26utm_campaign%3Dcache"

    invoke-static {v0, p0, v1}, Lcom/vk/music/utils/BoomHelper;->open(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 94
    :pswitch_1
    const-string/jumbo v0, "com.uma.musicvk"

    const-string/jumbo v1, "utm_source%3Dvkontakte%26utm_campaign%3Dplayer"

    invoke-static {v0, p0, v1}, Lcom/vk/music/utils/BoomHelper;->open(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 97
    :pswitch_2
    const-string/jumbo v0, "com.uma.musicvk"

    const-string/jumbo v1, "utm_source%3Dvkontakte%26utm_campaign%3Dsubscription"

    invoke-static {v0, p0, v1}, Lcom/vk/music/utils/BoomHelper;->open(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 100
    :pswitch_3
    const-string/jumbo v0, "com.uma.musicvk"

    const-string/jumbo v1, "utm_source%3Dvkontakte%26utm_campaign%3Dmenu"

    invoke-static {v0, p0, v1}, Lcom/vk/music/utils/BoomHelper;->open(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 89
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public loadTrack(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/utils/BoomHelper$From;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "from"    # Lcom/vk/music/utils/BoomHelper$From;

    .prologue
    .line 39
    if-nez p2, :cond_1

    .line 80
    :cond_0
    :goto_0
    return-void

    .line 42
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->hasMusicSubscription()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 43
    invoke-static {p1}, Lcom/vk/music/utils/BoomHelper;->isBoomInstalled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 44
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v1

    .line 45
    .local v1, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    if-nez v1, :cond_2

    const/4 v0, 0x0

    .line 46
    .local v0, "position":I
    :goto_1
    sget-object v2, Lcom/vk/music/utils/BoomHelper$Action;->download:Lcom/vk/music/utils/BoomHelper$Action;

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3, v0}, Lcom/vk/music/utils/BoomHelper;->openBoom(Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$Action;Ljava/lang/String;I)V

    goto :goto_0

    .line 45
    .end local v0    # "position":I
    :cond_2
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v2

    div-int/lit16 v0, v2, 0x3e8

    goto :goto_1

    .line 48
    .end local v1    # "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_3
    iget-object v2, p0, Lcom/vk/music/utils/BoomHelper;->setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-nez v2, :cond_0

    .line 49
    new-instance v2, Lcom/vk/music/utils/BoomHelper$1;

    const-string/jumbo v3, "audio.setForDownload"

    invoke-direct {v2, p0, v3}, Lcom/vk/music/utils/BoomHelper$1;-><init>(Lcom/vk/music/utils/BoomHelper;Ljava/lang/String;)V

    const-string/jumbo v3, "owner_id"

    iget v4, p2, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 59
    invoke-virtual {v2, v3, v4}, Lcom/vk/music/utils/BoomHelper$1;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "audio_id"

    iget v4, p2, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/music/utils/BoomHelper;->setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 60
    iget-object v2, p0, Lcom/vk/music/utils/BoomHelper;->setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    new-instance v3, Lcom/vk/music/utils/BoomHelper$2;

    invoke-direct {v3, p0, p1, p3}, Lcom/vk/music/utils/BoomHelper$2;-><init>(Lcom/vk/music/utils/BoomHelper;Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$From;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 74
    iget-object v2, p0, Lcom/vk/music/utils/BoomHelper;->setForDownloadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 78
    :cond_4
    invoke-static {p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->show(Landroid/content/Context;)V

    goto :goto_0
.end method
