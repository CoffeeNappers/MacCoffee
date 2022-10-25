.class public final Lcom/vkontakte/android/utils/AdsUtil;
.super Ljava/lang/Object;
.source "AdsUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Lcom/vkontakte/android/api/ButtonAction;

    .prologue
    .line 28
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/AdsUtil;->processButtonActionLink(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V

    return-void
.end method

.method private static formSourceString(Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/String;
    .locals 2
    .param p0, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 159
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/data/PostInteract;->getPostIdStr()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 160
    :goto_0
    return-object v0

    .line 159
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "wall"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/data/PostInteract;->getPostIdStr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static joinGroup(Landroid/content/Context;ILcom/vkontakte/android/api/ButtonAction;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "groupId"    # I
    .param p2, "buttonAction"    # Lcom/vkontakte/android/api/ButtonAction;
    .param p3, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 138
    invoke-static {p3}, Lcom/vkontakte/android/utils/AdsUtil;->formSourceString(Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "source":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/vkontakte/android/api/groups/GroupsJoin;->createGroupsJoinAndSendAllStats(IZ)Lcom/vkontakte/android/api/groups/GroupsJoin;

    move-result-object v0

    .line 141
    .local v0, "join":Lcom/vkontakte/android/api/groups/GroupsJoin;
    if-eqz v1, :cond_0

    .line 142
    const-string/jumbo v2, "source"

    invoke-virtual {v0, v2, v1}, Lcom/vkontakte/android/api/groups/GroupsJoin;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 145
    :cond_0
    new-instance v3, Lcom/vkontakte/android/utils/AdsUtil$1;

    const/4 v2, 0x0

    check-cast v2, Landroid/app/Activity;

    invoke-direct {v3, v2, p0, p2}, Lcom/vkontakte/android/utils/AdsUtil$1;-><init>(Landroid/content/Context;Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/api/groups/GroupsJoin;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 155
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 156
    return-void
.end method

.method public static onActionButtonClick(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "buttonAction"    # Lcom/vkontakte/android/api/ButtonAction;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 123
    iget-object v0, p1, Lcom/vkontakte/android/api/ButtonAction;->type:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 131
    :goto_1
    return-void

    .line 123
    :sswitch_0
    const-string/jumbo v2, "join_group_and_open_url"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "open_url"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 125
    :pswitch_0
    iget v0, p1, Lcom/vkontakte/android/api/ButtonAction;->group_id:I

    invoke-static {p0, v0, p1, p2}, Lcom/vkontakte/android/utils/AdsUtil;->joinGroup(Landroid/content/Context;ILcom/vkontakte/android/api/ButtonAction;Lcom/vkontakte/android/data/PostInteract;)V

    goto :goto_1

    .line 128
    :pswitch_1
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/AdsUtil;->processButtonActionLink(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V

    goto :goto_1

    .line 123
    :sswitch_data_0
    .sparse-switch
        -0x1e0f1a06 -> :sswitch_1
        0x7f266e57 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static onAdsPostClick(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "ad"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 34
    const-string/jumbo v0, "click"

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->deepLink:Ljava/lang/String;

    iget-boolean v2, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/AdsUtil;->trackClicks(Ljava/util/List;Ljava/lang/String;Z)V

    .line 36
    iget-object v0, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    if-nez v0, :cond_1

    .line 37
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    iget v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->linkTarget:I

    iget-object v2, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->link:Ljava/lang/String;

    invoke-static {p0, v0, v1, v2}, Lcom/vkontakte/android/utils/AdsUtil;->processClickWithoutApp(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    .line 42
    :goto_0
    return-void

    .line 39
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    const-string/jumbo v0, "click_deeplink"

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    iget-object v4, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->deepLink:Ljava/lang/String;

    iget-object v5, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->link:Ljava/lang/String;

    iget-boolean v6, p1, Lcom/vkontakte/android/attachments/ShitAttachment;->installed:Z

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/utils/AdsUtil;->processClickWithApp(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public static onPrettyCardClick(Landroid/content/Context;Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "card"    # Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    .prologue
    .line 119
    iget-object v0, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrl:Ljava/lang/String;

    iget-object v1, p1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrlTarget:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/utils/LinkUtils;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method private static processButtonActionLink(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "buttonAction"    # Lcom/vkontakte/android/api/ButtonAction;

    .prologue
    .line 134
    iget-object v0, p1, Lcom/vkontakte/android/api/ButtonAction;->url:Ljava/lang/String;

    iget-object v1, p1, Lcom/vkontakte/android/api/ButtonAction;->target:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/utils/LinkUtils;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return-void
.end method

.method public static processClickWithApp(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "adData"    # Ljava/lang/String;
    .param p3, "appPackage"    # Ljava/lang/String;
    .param p4, "deepLink"    # Ljava/lang/String;
    .param p5, "link"    # Ljava/lang/String;
    .param p6, "installed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .local p2, "statDeepLink":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    const/4 v8, 0x1

    .line 79
    if-eqz p6, :cond_2

    .line 80
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 81
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, p3}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 88
    :cond_0
    const-string/jumbo v2, "ads/click_open_app"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "ad_data"

    .line 89
    invoke-virtual {v2, v3, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "ads_device_id"

    .line 90
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    .line 91
    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 115
    :goto_0
    return-void

    .line 83
    :cond_1
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, p3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 85
    .local v1, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_1

    .line 94
    .end local v1    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_2
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "market://details?id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 95
    const-string/jumbo v2, "pending_installs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    const-wide/32 v6, 0x15180

    add-long/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "~"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p3, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 97
    const-string/jumbo v2, "ads/click_install_app"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "ad_data"

    .line 98
    invoke-virtual {v2, v3, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "ads_device_id"

    .line 99
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    .line 100
    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 101
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    const-class v4, Lcom/vkontakte/android/PackageAddedReceiver;

    invoke-direct {v3, p0, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    invoke-static {p5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 108
    const-string/jumbo v2, "ads/click_open_link_url"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "ad_data"

    .line 109
    invoke-virtual {v2, v3, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "ads_device_id"

    .line 110
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "no_google_play"

    .line 111
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    .line 112
    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto/16 :goto_0
.end method

.method public static processClickWithoutApp(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "adData"    # Ljava/lang/String;
    .param p2, "linkTarget"    # I
    .param p3, "link"    # Ljava/lang/String;

    .prologue
    .line 60
    const-string/jumbo v1, "play.google.com"

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 61
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 62
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.android.vending"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 71
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    const-string/jumbo v1, "ads/click_open_link_url"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "ad_data"

    .line 72
    invoke-virtual {v1, v2, p1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "ads_device_id"

    .line 73
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    .line 74
    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 75
    return-void

    .line 64
    :cond_0
    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    .line 65
    invoke-static {p0, p3}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalHiddenLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 66
    :cond_1
    const/4 v1, 0x2

    if-ne p2, v1, :cond_2

    .line 67
    invoke-static {p0, p3}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 69
    :cond_2
    invoke-static {p0, p3}, Lcom/vkontakte/android/utils/LinkUtils;->processExternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static trackClicks(Ljava/util/List;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "deepLink"    # Ljava/lang/String;
    .param p2, "installed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "statClickURLs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/statistics/StatisticUrl;>;"
    if-eqz p2, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 53
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 54
    .local v0, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_0

    .line 57
    .end local v0    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_1
    return-void
.end method

.method public static trackImpression(Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 3
    .param p0, "att"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 45
    iget-object v1, p0, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->trackImpression(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 46
    const-string/jumbo v1, "impression"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 47
    .local v0, "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->trackExternal(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    goto :goto_0

    .line 49
    .end local v0    # "url":Lcom/vkontakte/android/statistics/StatisticUrl;
    :cond_0
    return-void
.end method
