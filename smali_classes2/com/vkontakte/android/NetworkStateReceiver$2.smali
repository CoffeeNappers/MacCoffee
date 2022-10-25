.class final Lcom/vkontakte/android/NetworkStateReceiver$2;
.super Ljava/lang/Object;
.source "NetworkStateReceiver.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/NetworkStateReceiver;->updateUserInfo(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/execute/GetWallInfo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 194
    iput-object p1, p0, Lcom/vkontakte/android/NetworkStateReceiver$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 228
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->access$100()[I

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->access$200()I

    move-result v2

    rsub-int/lit8 v2, v2, 0x5

    aget v1, v1, v2

    int-to-long v2, v1

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->access$210()I

    .line 233
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->access$200()I

    move-result v1

    if-lez v1, :cond_0

    .line 234
    iget-object v1, p0, Lcom/vkontakte/android/NetworkStateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/vkontakte/android/NetworkStateReceiver;->access$300(Landroid/content/Context;)V

    .line 238
    :goto_1
    return-void

    .line 229
    :catch_0
    move-exception v0

    .line 230
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 236
    .end local v0    # "x":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x5

    invoke-static {v1}, Lcom/vkontakte/android/NetworkStateReceiver;->access$202(I)I

    goto :goto_1
.end method

.method public success(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V
    .locals 11
    .param p1, "r"    # Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    .prologue
    const/4 v6, 0x2

    const/4 v10, 0x0

    const/4 v7, 0x1

    .line 197
    sput-boolean v7, Lcom/vkontakte/android/NetworkStateReceiver;->userInfoUpdated:Z

    .line 198
    iget-object v8, p0, Lcom/vkontakte/android/NetworkStateReceiver$2;->val$context:Landroid/content/Context;

    const/4 v9, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 199
    .local v4, "prefs":Landroid/content/SharedPreferences;
    const/4 v5, 0x0

    .line 200
    .local v5, "timeDiff":I
    iget v8, p1, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->time:I

    invoke-static {v8}, Lcom/vkontakte/android/TimeUtils;->setServerTime(I)V

    .line 202
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "time_diff"

    invoke-interface {v8, v9, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 204
    invoke-static {p1}, Lcom/vkontakte/android/auth/VKAccountManager;->updateCurrent(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V

    .line 206
    invoke-static {}, Lcom/my/tracker/MyTracker;->getTrackerParams()Lcom/my/tracker/MyTrackerParams;

    move-result-object v1

    .line 207
    .local v1, "customParams":Lcom/my/tracker/MyTrackerParams;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 208
    .local v0, "currentAccount":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/my/tracker/MyTrackerParams;->setVKId(Ljava/lang/String;)V

    .line 209
    iget-object v8, p1, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->bdate:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 210
    iget-object v8, p1, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->bdate:Ljava/lang/String;

    const-string/jumbo v9, "\\."

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 211
    .local v3, "parts":[Ljava/lang/String;
    array-length v8, v3

    const/4 v9, 0x3

    if-ne v8, v9, :cond_0

    .line 212
    aget-object v8, v3, v10

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    aget-object v9, v3, v7

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    aget-object v10, v3, v6

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-static {v8, v9, v10}, Lcom/vkontakte/android/TimeUtils;->getAge(III)I

    move-result v8

    invoke-virtual {v1, v8}, Lcom/my/tracker/MyTrackerParams;->setAge(I)V

    .line 215
    .end local v3    # "parts":[Ljava/lang/String;
    :cond_0
    iget-object v8, p1, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->isFemale()Z

    move-result v8

    if-eqz v8, :cond_1

    :goto_0
    invoke-virtual {v1, v6}, Lcom/my/tracker/MyTrackerParams;->setGender(I)V

    .line 216
    iget-object v6, p0, Lcom/vkontakte/android/NetworkStateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 217
    .local v2, "defPrefs":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "mytrackerLocationCrapEnabled"

    invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-static {v6}, Lcom/vkontakte/android/VKApplication;->setMyTrackLocationEnable(Z)V

    .line 219
    iget-object v6, p0, Lcom/vkontakte/android/NetworkStateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v6}, Lcom/vkontakte/android/NetworkStateReceiver;->access$000(Landroid/content/Context;)V

    .line 220
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->sendVideoViewedSegments()V

    .line 221
    iget-object v6, p0, Lcom/vkontakte/android/NetworkStateReceiver$2;->val$context:Landroid/content/Context;

    invoke-static {v6}, Lcom/vkontakte/android/data/Analytics;->sendDailyStatistic(Landroid/content/Context;)V

    .line 222
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/data/BenchmarkTracker;->updateProfileConfig(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 223
    return-void

    .end local v2    # "defPrefs":Landroid/content/SharedPreferences;
    :cond_1
    move v6, v7

    .line 215
    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 194
    check-cast p1, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NetworkStateReceiver$2;->success(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V

    return-void
.end method
