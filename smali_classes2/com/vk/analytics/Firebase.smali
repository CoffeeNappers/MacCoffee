.class public Lcom/vk/analytics/Firebase;
.super Ljava/lang/Object;
.source "Firebase.java"


# static fields
.field public static final CONFIG_ANALYTICS:Ljava/lang/String; = "config_enable_analytics"

.field public static final CONFIG_EVENTS:Ljava/lang/String; = "config_enable_events"

.field public static final CONFIG_PROXIES:Ljava/lang/String; = "config_enable_proxy"

.field public static final CONFIG_PROXIES_LIST:Ljava/lang/String; = "config_proxies_list"

.field public static final CONFIG_SETTINGS_PROXY_CHECK:Ljava/lang/String; = "config_settings_proxy_check"

.field public static final CONFIG_SETTINGS_PROXY_MENU:Ljava/lang/String; = "config_settings_proxy_menu"

.field public static final CONFIG_SETTINGS_PROXY_SHUFFLE:Ljava/lang/String; = "config_settings_proxy_shuffle"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mDatabase:Lcom/google/firebase/database/FirebaseDatabase;

.field private mIsEnableAnalytics:Z

.field private mIsEnableEvents:Z

.field private mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

.field private mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

.field private mSettings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSettingsValues:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSubscribers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vk/analytics/Analytics$OnValueEventListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/vk/analytics/Firebase;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/analytics/Firebase;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/analytics/AnalyticsPreferences;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "prefs"    # Lcom/vk/analytics/AnalyticsPreferences;

    .prologue
    const/4 v2, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean v2, p0, Lcom/vk/analytics/Firebase;->mIsEnableAnalytics:Z

    .line 36
    iput-boolean v2, p0, Lcom/vk/analytics/Firebase;->mIsEnableEvents:Z

    .line 39
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/vk/analytics/Firebase;->mSubscribers:Ljava/util/HashMap;

    .line 44
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/analytics/Firebase;->mSettings:Ljava/util/ArrayList;

    .line 45
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/vk/analytics/Firebase;->mSettingsValues:Ljava/util/HashMap;

    .line 48
    invoke-static {p1}, Lcom/google/firebase/FirebaseApp;->initializeApp(Landroid/content/Context;)Lcom/google/firebase/FirebaseApp;

    .line 49
    invoke-static {}, Lcom/google/firebase/database/FirebaseDatabase;->getInstance()Lcom/google/firebase/database/FirebaseDatabase;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/analytics/Firebase;->mDatabase:Lcom/google/firebase/database/FirebaseDatabase;

    .line 50
    iput-object p2, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    .line 52
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mSettings:Ljava/util/ArrayList;

    const-string/jumbo v3, "config_settings_proxy_check"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mSettings:Ljava/util/ArrayList;

    const-string/jumbo v3, "config_settings_proxy_menu"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mSettings:Ljava/util/ArrayList;

    const-string/jumbo v3, "config_settings_proxy_shuffle"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 57
    .local v0, "s":Ljava/lang/String;
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-virtual {v3, v0}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "value":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 59
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mSettingsValues:Ljava/util/HashMap;

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 62
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "value":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/vk/analytics/Firebase;)Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;
    .locals 1
    .param p0, "x0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/analytics/Firebase;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/analytics/Firebase;->updateProxies()V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/analytics/Firebase;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/analytics/Firebase;->updateEvents()V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/analytics/Firebase;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/analytics/Firebase;->update()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/analytics/Firebase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Firebase;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/vk/analytics/Firebase;->update(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vk/analytics/Firebase;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/analytics/Firebase;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/analytics/Firebase;->disconnect()V

    return-void
.end method

.method static synthetic access$600()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/vk/analytics/Firebase;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private disconnect()V
    .locals 2

    .prologue
    .line 213
    sget-object v0, Lcom/vk/analytics/Firebase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "disconnect to db"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mDatabase:Lcom/google/firebase/database/FirebaseDatabase;

    invoke-virtual {v0}, Lcom/google/firebase/database/FirebaseDatabase;->goOffline()V

    .line 215
    return-void
.end method

.method private update()V
    .locals 4

    .prologue
    .line 203
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 204
    .local v0, "s":Ljava/lang/String;
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    invoke-virtual {v3, v0}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "value":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 206
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-virtual {v3, v0, v1}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mSettingsValues:Ljava/util/HashMap;

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 210
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "value":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private update(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    invoke-virtual {v1, p1, p2}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mSubscribers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/analytics/Analytics$OnValueEventListener;

    .line 177
    .local v0, "l":Lcom/vk/analytics/Analytics$OnValueEventListener;
    if-eqz v0, :cond_0

    .line 178
    invoke-interface {v0, p2}, Lcom/vk/analytics/Analytics$OnValueEventListener;->onDataChange(Ljava/lang/String;)V

    .line 180
    :cond_0
    return-void
.end method

.method private updateDatabase(Ljava/lang/String;)V
    .locals 4
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 148
    :try_start_0
    sget-object v2, Lcom/vk/analytics/Firebase;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "connect to db"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mDatabase:Lcom/google/firebase/database/FirebaseDatabase;

    invoke-virtual {v2, p1}, Lcom/google/firebase/database/FirebaseDatabase;->getReference(Ljava/lang/String;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v1

    .line 150
    .local v1, "reference":Lcom/google/firebase/database/DatabaseReference;
    if-nez v1, :cond_0

    .line 171
    .end local v1    # "reference":Lcom/google/firebase/database/DatabaseReference;
    :goto_0
    return-void

    .line 154
    .restart local v1    # "reference":Lcom/google/firebase/database/DatabaseReference;
    :cond_0
    new-instance v0, Lcom/vk/analytics/Firebase$2;

    invoke-direct {v0, p0, p1}, Lcom/vk/analytics/Firebase$2;-><init>(Lcom/vk/analytics/Firebase;Ljava/lang/String;)V

    .line 168
    .local v0, "listener":Lcom/google/firebase/database/ValueEventListener;
    invoke-virtual {v1, v0}, Lcom/google/firebase/database/DatabaseReference;->addValueEventListener(Lcom/google/firebase/database/ValueEventListener;)Lcom/google/firebase/database/ValueEventListener;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 169
    .end local v0    # "listener":Lcom/google/firebase/database/ValueEventListener;
    .end local v1    # "reference":Lcom/google/firebase/database/DatabaseReference;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private updateEvents()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 192
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    const-string/jumbo v2, "config_enable_analytics"

    invoke-virtual {v1, v2}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    iput-boolean v3, p0, Lcom/vk/analytics/Firebase;->mIsEnableAnalytics:Z

    .line 194
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    const-string/jumbo v2, "config_enable_events"

    invoke-virtual {v1, v2}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 195
    .local v0, "events":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 196
    iput-boolean v3, p0, Lcom/vk/analytics/Firebase;->mIsEnableEvents:Z

    .line 197
    const-string/jumbo v1, "config_enable_events"

    invoke-direct {p0, v1, v0}, Lcom/vk/analytics/Firebase;->update(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .end local v0    # "events":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private updateProxies()V
    .locals 4

    .prologue
    .line 183
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    const-string/jumbo v3, "config_enable_proxy"

    invoke-virtual {v2, v3}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 184
    .local v0, "enable":Z
    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const-string/jumbo v3, "config_enable_proxy"

    invoke-virtual {v2, v3, v0}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Z)V

    .line 186
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const-string/jumbo v3, "config_proxies_list"

    invoke-virtual {v2, v3}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "value":Ljava/lang/String;
    :goto_0
    const-string/jumbo v2, "config_proxies_list"

    invoke-direct {p0, v2, v1}, Lcom/vk/analytics/Firebase;->update(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    return-void

    .line 186
    .end local v1    # "value":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, ""

    goto :goto_0
.end method


# virtual methods
.method public clearProxies()V
    .locals 3

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const-string/jumbo v1, "config_proxies_list"

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/vk/analytics/AnalyticsPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method public getEvents()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const-string/jumbo v2, "config_enable_events"

    invoke-virtual {v1, v2}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "events":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 137
    const-string/jumbo v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 139
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method public getProxies()Ljava/lang/String;
    .locals 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const-string/jumbo v1, "config_proxies_list"

    invoke-virtual {v0, v1}, Lcom/vk/analytics/AnalyticsPreferences;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSettings()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mSettingsValues:Ljava/util/HashMap;

    return-object v0
.end method

.method public init(Ljava/lang/Runnable;)V
    .locals 5
    .param p1, "complete"    # Ljava/lang/Runnable;

    .prologue
    .line 65
    invoke-static {}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getInstance()Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    .line 66
    new-instance v3, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings$Builder;

    invoke-direct {v3}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings$Builder;-><init>()V

    const/4 v4, 0x0

    .line 67
    invoke-virtual {v3, v4}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings$Builder;->setDeveloperModeEnabled(Z)Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings$Builder;->build()Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings;

    move-result-object v2

    .line 68
    .local v2, "configSettings":Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings;
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    invoke-virtual {v3, v2}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->setConfigSettings(Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings;)V

    .line 70
    const-wide/16 v0, 0x384

    .line 71
    .local v0, "cacheExpirationSec":J
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    invoke-virtual {v3}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->getInfo()Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigInfo;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigInfo;->getConfigSettings()Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigSettings;->isDeveloperModeEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 72
    const-wide/16 v0, 0x0

    .line 75
    :cond_0
    iget-object v3, p0, Lcom/vk/analytics/Firebase;->mRemoteConfig:Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;

    invoke-virtual {v3, v0, v1}, Lcom/google/firebase/remoteconfig/FirebaseRemoteConfig;->fetch(J)Lcom/google/android/gms/tasks/Task;

    move-result-object v3

    new-instance v4, Lcom/vk/analytics/Firebase$1;

    invoke-direct {v4, p0, p1}, Lcom/vk/analytics/Firebase$1;-><init>(Lcom/vk/analytics/Firebase;Ljava/lang/Runnable;)V

    invoke-virtual {v3, v4}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 89
    return-void
.end method

.method public isEnableAnalytics()Z
    .locals 1

    .prologue
    .line 123
    iget-boolean v0, p0, Lcom/vk/analytics/Firebase;->mIsEnableAnalytics:Z

    return v0
.end method

.method public isEnableEvents()Z
    .locals 1

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/vk/analytics/Firebase;->mIsEnableEvents:Z

    return v0
.end method

.method public isEnableProxies()Z
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mPreferences:Lcom/vk/analytics/AnalyticsPreferences;

    const-string/jumbo v1, "config_enable_proxy"

    invoke-virtual {v0, v1}, Lcom/vk/analytics/AnalyticsPreferences;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public subscribe(Ljava/lang/String;Lcom/vk/analytics/Analytics$OnValueEventListener;)Z
    .locals 2
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/vk/analytics/Analytics$OnValueEventListener;

    .prologue
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p0, p1, p2, v0}, Lcom/vk/analytics/Firebase;->subscribe(Ljava/lang/String;Lcom/vk/analytics/Analytics$OnValueEventListener;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    invoke-direct {p0, p1}, Lcom/vk/analytics/Firebase;->updateDatabase(Ljava/lang/String;)V

    .line 94
    const/4 v0, 0x1

    .line 96
    :cond_0
    return v0
.end method

.method public subscribe(Ljava/lang/String;Lcom/vk/analytics/Analytics$OnValueEventListener;Z)Z
    .locals 2
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/vk/analytics/Analytics$OnValueEventListener;
    .param p3, "configOnly"    # Z

    .prologue
    .line 100
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mSubscribers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/analytics/Analytics$OnValueEventListener;

    .line 101
    .local v0, "l":Lcom/vk/analytics/Analytics$OnValueEventListener;
    if-eqz v0, :cond_0

    if-eq v0, p2, :cond_1

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/vk/analytics/Firebase;->mSubscribers:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    const/4 v1, 0x1

    .line 105
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mSubscribers:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vk/analytics/Firebase;->mSubscribers:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :cond_0
    return-void
.end method
