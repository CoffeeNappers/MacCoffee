.class public Lcom/vk/analytics/Analytics;
.super Ljava/lang/Object;
.source "Analytics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/analytics/Analytics$OnValueEventListener;,
        Lcom/vk/analytics/Analytics$AnalyticsImpl;
    }
.end annotation


# static fields
.field private static final HA_APP_ID:Ljava/lang/String; = "9648099e8023ad5cb2ae265b85802bbc"

.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/vk/analytics/Analytics;


# instance fields
.field private mAlwaysEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mAppHash:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDatabase:Lcom/vk/analytics/Firebase;

.field private mId:Ljava/lang/String;

.field private mIsNeedCheckHockeyAppUpdate:Z

.field private mPerInstanceEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPerVersionEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPreferences:Lcom/vk/analytics/AnalyticsPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/vk/analytics/Analytics;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/analytics/Analytics;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/analytics/Analytics;->mPerVersionEvents:Ljava/util/ArrayList;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/analytics/Analytics;->mPerInstanceEvents:Ljava/util/ArrayList;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/analytics/Analytics;->mAlwaysEvents:Ljava/util/ArrayList;

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/analytics/Analytics;->mIsNeedCheckHockeyAppUpdate:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vk/analytics/Analytics;)Lcom/vk/analytics/Firebase;
    .locals 1
    .param p0, "x0"    # Lcom/vk/analytics/Analytics;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/analytics/Analytics;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Analytics;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vk/analytics/Analytics;->checkEvents()V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/analytics/Analytics;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Analytics;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vk/analytics/Analytics;->initCustomAnalytics()V

    return-void
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/vk/analytics/Analytics;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private checkEvents()V
    .locals 11

    .prologue
    const/4 v7, 0x0

    .line 201
    iget-object v8, p0, Lcom/vk/analytics/Analytics;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/vk/analytics/AnalyticsUtils;->getAppHash(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vk/analytics/Analytics;->mAppHash:Ljava/lang/String;

    .line 203
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    const-string/jumbo v8, "SUCCESS_PLAYER"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    const-string/jumbo v8, "SUCCESS_CAMERA"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    iget-object v8, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    invoke-virtual {v8}, Lcom/vk/analytics/Firebase;->getEvents()Ljava/util/List;

    move-result-object v1

    .line 212
    .local v1, "events":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 213
    .local v6, "versionChange":Z
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 214
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    if-ltz v9, :cond_0

    .line 215
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-virtual {v9, v2}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 216
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mAppHash:Ljava/lang/String;

    invoke-virtual {v5, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 217
    :cond_1
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPerVersionEvents:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 218
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPerVersionEvents:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_2
    const/4 v6, 0x1

    goto :goto_0

    .line 225
    .end local v2    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 228
    const-string/jumbo v8, "ERROR_ENCODER"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    const-string/jumbo v8, "ERROR_PLAYER"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 230
    const-string/jumbo v8, "ERROR_VIDEO_STREAM"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    const-string/jumbo v8, "ERROR_DECODER_VIDEO"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 234
    .restart local v2    # "key":Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    if-ltz v9, :cond_4

    .line 235
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-virtual {v9, v2}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "count":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 237
    .local v4, "n":I
    :goto_2
    if-nez v6, :cond_5

    const/4 v9, 0x4

    if-ge v4, v9, :cond_4

    .line 238
    :cond_5
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPerInstanceEvents:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 239
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPerInstanceEvents:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    :cond_6
    if-eqz v6, :cond_4

    .line 242
    iget-object v9, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v2, v10}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 260
    .end local v0    # "count":Ljava/lang/String;
    .end local v1    # "events":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "n":I
    .end local v6    # "versionChange":Z
    :catch_0
    move-exception v7

    .line 262
    :cond_7
    return-void

    .restart local v0    # "count":Ljava/lang/String;
    .restart local v1    # "events":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v6    # "versionChange":Z
    :cond_8
    move v4, v7

    .line 236
    goto :goto_2

    .line 248
    .end local v0    # "count":Ljava/lang/String;
    .end local v2    # "key":Ljava/lang/String;
    :cond_9
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 251
    const-string/jumbo v7, "ERROR_DECODER_AUDIO"

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_a
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 254
    .restart local v2    # "key":Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v8

    if-ltz v8, :cond_a

    .line 255
    iget-object v8, p0, Lcom/vk/analytics/Analytics;->mAlwaysEvents:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a

    .line 256
    iget-object v8, p0, Lcom/vk/analytics/Analytics;->mAlwaysEvents:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3
.end method

.method public static getInstance()Lcom/vk/analytics/Analytics;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/vk/analytics/Analytics;->sInstance:Lcom/vk/analytics/Analytics;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/vk/analytics/Analytics;

    invoke-direct {v0}, Lcom/vk/analytics/Analytics;-><init>()V

    sput-object v0, Lcom/vk/analytics/Analytics;->sInstance:Lcom/vk/analytics/Analytics;

    .line 57
    :cond_0
    sget-object v0, Lcom/vk/analytics/Analytics;->sInstance:Lcom/vk/analytics/Analytics;

    return-object v0
.end method

.method private initCustomAnalytics()V
    .locals 3

    .prologue
    .line 195
    invoke-static {}, Lcom/vk/analytics/Analytics;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/vk/analytics/Analytics;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/vk/analytics/R$string;->raven_dsn:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mId:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vk/analytics/Analytics$AnalyticsImpl;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    :cond_0
    return-void
.end method

.method public static isEnabled()Z
    .locals 1

    .prologue
    .line 77
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Firebase;->isEnableAnalytics()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static log(Lcom/vk/analytics/AnalyticsEvent;)V
    .locals 2
    .param p0, "event"    # Lcom/vk/analytics/AnalyticsEvent;

    .prologue
    .line 69
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/analytics/Analytics;->logEvent(Lcom/vk/analytics/AnalyticsEvent;Z)V

    .line 70
    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 0
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method private logEvent(Lcom/vk/analytics/AnalyticsEvent;Z)V
    .locals 5
    .param p1, "event"    # Lcom/vk/analytics/AnalyticsEvent;
    .param p2, "error"    # Z

    .prologue
    .line 149
    if-eqz p1, :cond_0

    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    invoke-virtual {v3}, Lcom/vk/analytics/Firebase;->isEnableEvents()Z

    move-result v3

    if-nez v3, :cond_1

    .line 174
    :cond_0
    :goto_0
    return-void

    .line 153
    :cond_1
    invoke-virtual {p1}, Lcom/vk/analytics/AnalyticsEvent;->getName()Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/vk/analytics/AnalyticsEvent;->isReady()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mPerInstanceEvents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mPerInstanceEvents:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 156
    :try_start_0
    invoke-static {p1, p2}, Lcom/vk/analytics/Analytics$AnalyticsImpl;->logEvent(Lcom/vk/analytics/AnalyticsEvent;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 157
    const/4 v2, 0x0

    .line 158
    .local v2, "n":I
    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-virtual {v3, v1}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "count":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 160
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 162
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 163
    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .end local v0    # "count":Ljava/lang/String;
    .end local v2    # "n":I
    :cond_3
    :goto_1
    invoke-virtual {p1}, Lcom/vk/analytics/AnalyticsEvent;->isReady()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mAlwaysEvents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mAlwaysEvents:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 172
    invoke-static {p1, p2}, Lcom/vk/analytics/Analytics$AnalyticsImpl;->logEvent(Lcom/vk/analytics/AnalyticsEvent;Z)Z

    goto :goto_0

    .line 165
    :cond_4
    :try_start_1
    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mPerInstanceEvents:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 167
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private logEventOnce(Lcom/vk/analytics/AnalyticsEvent;Z)V
    .locals 5
    .param p1, "event"    # Lcom/vk/analytics/AnalyticsEvent;
    .param p2, "error"    # Z

    .prologue
    .line 177
    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    invoke-virtual {v2}, Lcom/vk/analytics/Firebase;->isEnableEvents()Z

    move-result v2

    if-nez v2, :cond_1

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 181
    :cond_1
    invoke-virtual {p1}, Lcom/vk/analytics/AnalyticsEvent;->getName()Ljava/lang/String;

    move-result-object v1

    .line 182
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/vk/analytics/AnalyticsEvent;->isReady()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mPerVersionEvents:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mPerVersionEvents:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 184
    :try_start_0
    invoke-static {p1, p2}, Lcom/vk/analytics/Analytics$AnalyticsImpl;->logEvent(Lcom/vk/analytics/AnalyticsEvent;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 185
    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    iget-object v3, p0, Lcom/vk/analytics/Analytics;->mAppHash:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mPerVersionEvents:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/vk/analytics/Analytics;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "logEventOnce: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static logException(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 61
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    .line 62
    return-void
.end method

.method public static logOnce(Lcom/vk/analytics/AnalyticsEvent;)V
    .locals 2
    .param p0, "event"    # Lcom/vk/analytics/AnalyticsEvent;

    .prologue
    .line 73
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/analytics/Analytics;->logEventOnce(Lcom/vk/analytics/AnalyticsEvent;Z)V

    .line 74
    return-void
.end method


# virtual methods
.method public database()Lcom/vk/analytics/Firebase;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    return-object v0
.end method

.method public enableCheckForUpdates(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 137
    iput-boolean p1, p0, Lcom/vk/analytics/Analytics;->mIsNeedCheckHockeyAppUpdate:Z

    .line 138
    return-void
.end method

.method public getProxies()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    invoke-virtual {v0}, Lcom/vk/analytics/Firebase;->getProxies()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public init(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/vk/analytics/Analytics;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "complete"    # Ljava/lang/Runnable;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vk/analytics/Analytics;->mContext:Landroid/content/Context;

    .line 82
    new-instance v0, Lcom/vk/analytics/AnalyticsPreferences;

    invoke-direct {v0, p1}, Lcom/vk/analytics/AnalyticsPreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    .line 83
    new-instance v0, Lcom/vk/analytics/Firebase;

    iget-object v1, p0, Lcom/vk/analytics/Analytics;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-direct {v0, p1, v1}, Lcom/vk/analytics/Firebase;-><init>(Landroid/content/Context;Lcom/vk/analytics/AnalyticsPreferences;)V

    iput-object v0, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    .line 84
    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mDatabase:Lcom/vk/analytics/Firebase;

    new-instance v1, Lcom/vk/analytics/Analytics$1;

    invoke-direct {v1, p0, p2}, Lcom/vk/analytics/Analytics$1;-><init>(Lcom/vk/analytics/Analytics;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/vk/analytics/Firebase;->init(Ljava/lang/Runnable;)V

    .line 96
    return-object p0
.end method

.method public initCrashHandler()V
    .locals 4

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vk/analytics/Analytics;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    new-array v1, v1, [Lio/fabric/sdk/android/Kit;

    const/4 v2, 0x0

    new-instance v3, Lcom/crashlytics/android/Crashlytics;

    invoke-direct {v3}, Lcom/crashlytics/android/Crashlytics;-><init>()V

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/fabric/sdk/android/Fabric;->with(Landroid/content/Context;[Lio/fabric/sdk/android/Kit;)Lio/fabric/sdk/android/Fabric;

    .line 101
    return-void
.end method

.method public registerCrashReporter(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/vk/analytics/Analytics;->mIsNeedCheckHockeyAppUpdate:Z

    if-eqz v0, :cond_0

    .line 142
    const-string/jumbo v0, "9648099e8023ad5cb2ae265b85802bbc"

    invoke-static {p1, v0}, Lnet/hockeyapp/android/UpdateManager;->register(Landroid/app/Activity;Ljava/lang/String;)V

    .line 143
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/analytics/Analytics;->mIsNeedCheckHockeyAppUpdate:Z

    .line 145
    :cond_0
    const-string/jumbo v0, "9648099e8023ad5cb2ae265b85802bbc"

    invoke-static {p1, v0}, Lnet/hockeyapp/android/CrashManager;->register(Landroid/content/Context;Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public setUserData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-static {p1}, Lcom/crashlytics/android/Crashlytics;->setUserIdentifier(Ljava/lang/String;)V

    .line 109
    invoke-static {p2}, Lcom/crashlytics/android/Crashlytics;->setUserName(Ljava/lang/String;)V

    .line 111
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 116
    .local v1, "userId":I
    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/vk/analytics/Analytics;->mId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 117
    iput-object p1, p0, Lcom/vk/analytics/Analytics;->mId:Ljava/lang/String;

    .line 119
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/analytics/Analytics;->database()Lcom/vk/analytics/Firebase;

    move-result-object v0

    .line 120
    .local v0, "db":Lcom/vk/analytics/Firebase;
    if-eqz v0, :cond_0

    .line 121
    const-string/jumbo v2, "config_enable_events"

    new-instance v3, Lcom/vk/analytics/Analytics$2;

    invoke-direct {v3, p0, v0}, Lcom/vk/analytics/Analytics$2;-><init>(Lcom/vk/analytics/Analytics;Lcom/vk/analytics/Firebase;)V

    const/4 v4, 0x1

    invoke-virtual {v0, v2, v3, v4}, Lcom/vk/analytics/Firebase;->subscribe(Ljava/lang/String;Lcom/vk/analytics/Analytics$OnValueEventListener;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 130
    .end local v0    # "db":Lcom/vk/analytics/Firebase;
    .end local v1    # "userId":I
    :catch_0
    move-exception v2

    goto :goto_0
.end method
