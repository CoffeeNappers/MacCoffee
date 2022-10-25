.class public Lcom/vkontakte/android/data/Games;
.super Ljava/lang/Object;
.source "Games.java"


# static fields
.field public static final ACTION_DELETE_REQUEST:Ljava/lang/String; = "com.vkontakte.android.games.DELETE_REQUEST"

.field public static final ACTION_DELETE_REQUEST_ALL:Ljava/lang/String; = "com.vkontakte.android.games.DELETE_REQUEST_ALL"

.field public static final ACTION_RELOAD_INSTALLED:Ljava/lang/String; = "com.vkontakte.android.games.RELOAD_INSTALLED"

.field public static final ACTION_RELOAD_REQUESTS:Ljava/lang/String; = "com.vkontakte.android.games.RELOAD_REQUESTS"

.field private static final KEY_REQUEST:Ljava/lang/String; = "com.vkontakte.android.games.REQUEST_KEY"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decreaseAppsCounter()V
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Games;->decreaseAppsCounterBy(I)V

    .line 262
    return-void
.end method

.method static decreaseAppsCounterBy(I)V
    .locals 1
    .param p0, "num"    # I

    .prologue
    .line 265
    if-gtz p0, :cond_0

    .line 269
    :goto_0
    return-void

    .line 267
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumAppRequests()I

    move-result v0

    sub-int/2addr v0, p0

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->setNumAppRequests(I)V

    .line 268
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    goto :goto_0
.end method

.method public static deleteRequest(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Lcom/vkontakte/android/data/GameRequest;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 89
    if-eqz p1, :cond_0

    .line 90
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.games.DELETE_REQUEST"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 91
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.vkontakte.android.games.REQUEST_KEY"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 92
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcastSync(Landroid/content/Intent;)V

    .line 94
    iget-object v1, p1, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    if-eqz v1, :cond_0

    .line 95
    new-instance v1, Lcom/vkontakte/android/api/apps/AppsDeleteRequest;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/apps/AppsDeleteRequest;-><init>([I)V

    new-instance v2, Lcom/vkontakte/android/data/Games$1;

    invoke-direct {v2}, Lcom/vkontakte/android/data/Games$1;-><init>()V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/apps/AppsDeleteRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 100
    invoke-virtual {v1, v3, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 103
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public static deleteRequestAll(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Lcom/vkontakte/android/data/GameRequest;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 108
    if-eqz p1, :cond_0

    .line 109
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.games.DELETE_REQUEST_ALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 110
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.vkontakte.android.games.REQUEST_KEY"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 111
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcastSync(Landroid/content/Intent;)V

    .line 114
    iget-object v1, p1, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    if-eqz v1, :cond_0

    .line 115
    new-instance v1, Lcom/vkontakte/android/api/apps/AppsDeleteRequest;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/apps/AppsDeleteRequest;-><init>([I)V

    new-instance v2, Lcom/vkontakte/android/data/Games$2;

    invoke-direct {v2}, Lcom/vkontakte/android/data/Games$2;-><init>()V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/apps/AppsDeleteRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 120
    invoke-virtual {v1, v3, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 123
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public static fadeDrawables(Ljava/util/ArrayList;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 277
    .local p0, "drawablesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;>;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 279
    .local v4, "drawables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;>;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 280
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/ref/WeakReference;

    .line 281
    .local v6, "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;>;"
    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 282
    .local v3, "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    if-nez v3, :cond_0

    .line 283
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 285
    :cond_0
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 288
    .end local v3    # "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    .end local v6    # "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;>;"
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 289
    .local v2, "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 290
    .restart local v3    # "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    const-string/jumbo v8, "currentColor"

    const/4 v9, 0x2

    new-array v9, v9, [I

    const/4 v10, 0x0

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;->getCurrentColor()I

    move-result v11

    aput v11, v9, v10

    const/4 v10, 0x1

    const/4 v11, -0x1

    aput v11, v9, v10

    invoke-static {v3, v8, v9}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 291
    .local v0, "animator":Landroid/animation/ValueAnimator;
    new-instance v8, Landroid/animation/ArgbEvaluator;

    invoke-direct {v8}, Landroid/animation/ArgbEvaluator;-><init>()V

    invoke-virtual {v0, v8}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 292
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 294
    .end local v0    # "animator":Landroid/animation/ValueAnimator;
    .end local v3    # "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    :cond_2
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 295
    .local v1, "animatorSet":Landroid/animation/AnimatorSet;
    const-wide/16 v8, 0x190

    invoke-virtual {v1, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 296
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 297
    new-instance v7, Lcom/vkontakte/android/data/Games$4;

    invoke-direct {v7, v4}, Lcom/vkontakte/android/data/Games$4;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v1, v7}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 312
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 313
    return-void
.end method

.method public static getRequestFromIntent(Landroid/content/Intent;)Lcom/vkontakte/android/data/GameRequest;
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 126
    const-string/jumbo v0, "com.vkontakte.android.games.REQUEST_KEY"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    return-object v0
.end method

.method public static isAppInstalledOnDevice(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 4
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 205
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v2, p0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 207
    :cond_0
    :goto_0
    return v1

    .line 206
    :catch_0
    move-exception v0

    .line 207
    .local v0, "x":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method

.method public static markRequestsAsRead(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "requests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    const/4 v7, 0x0

    .line 60
    if-eqz p1, :cond_4

    .line 61
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v3, "requestIdsToBeMarkedAsRead":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 63
    .local v1, "markedReadRequestsCount":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/GameRequest;

    .line 64
    .local v2, "request":Lcom/vkontakte/android/data/GameRequest;
    iget-boolean v5, v2, Lcom/vkontakte/android/data/GameRequest;->unread:Z

    if-eqz v5, :cond_0

    iget-object v5, v2, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    if-eqz v5, :cond_0

    .line 68
    iget v5, v2, Lcom/vkontakte/android/data/GameRequest;->type:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_1

    .line 69
    add-int/lit8 v1, v1, 0x1

    .line 72
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v5, v2, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    array-length v5, v5

    if-ge v0, v5, :cond_0

    .line 73
    iget-object v5, v2, Lcom/vkontakte/android/data/GameRequest;->fromIds:[I

    aget v5, v5, v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 78
    .end local v0    # "i":I
    .end local v2    # "request":Lcom/vkontakte/android/data/GameRequest;
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 79
    new-instance v4, Lcom/vkontakte/android/api/apps/AppsMarkRequestAsRead;

    invoke-direct {v4, v3}, Lcom/vkontakte/android/api/apps/AppsMarkRequestAsRead;-><init>(Ljava/util/List;)V

    invoke-virtual {v4, v7, v7}, Lcom/vkontakte/android/api/apps/AppsMarkRequestAsRead;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    :cond_3
    invoke-static {v1}, Lcom/vkontakte/android/data/Games;->decreaseAppsCounterBy(I)V

    .line 85
    .end local v1    # "markedReadRequestsCount":I
    .end local v3    # "requestIdsToBeMarkedAsRead":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_4
    return-void
.end method

.method static nullAppsCounter()V
    .locals 1

    .prologue
    .line 272
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->setNumAppRequests(I)V

    .line 273
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    .line 274
    return-void
.end method

.method public static open(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "app"    # Lcom/vkontakte/android/data/ApiApplication;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "act"    # Landroid/app/Activity;
    .param p3, "vs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "cs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v0, :cond_0

    .line 131
    invoke-static {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/data/Games;->openHtml5Game(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    :goto_0
    return-void

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->packageName:Ljava/lang/String;

    iget v3, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/data/Games;->openInstallableGame(Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static openHtml5Game(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "link"    # Ljava/lang/String;
    .param p3, "copyLink"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "screenTitle"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "appId"    # I
    .param p6, "orientation"    # I
    .param p7, "vs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p8, "cs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 180
    const-string/jumbo v2, "games_action"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "visit_source"

    .line 181
    invoke-virtual {v2, v3, p7}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "click_source"

    .line 182
    invoke-virtual {v2, v3, p8}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "action_type"

    const-string/jumbo v4, "html5_game_launch"

    .line 183
    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    const-string/jumbo v3, "game_id"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 184
    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    const-string/jumbo v4, "request_name"

    if-eqz p1, :cond_1

    const-string/jumbo v2, "name"

    .line 185
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "name"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    .line 186
    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 189
    if-eqz p1, :cond_0

    const-string/jumbo v2, "key"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 190
    const-string/jumbo v2, "key"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "requestKey":Ljava/lang/String;
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 192
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string/jumbo v3, "request_key"

    invoke-virtual {v2, v3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 195
    .end local v0    # "requestKey":Ljava/lang/String;
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_0
    new-instance v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;

    const/4 v3, 0x0

    invoke-direct {v2, p2, v3, p5}, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;-><init>(Ljava/lang/String;II)V

    .line 196
    invoke-virtual {v2, p4}, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->setScreenTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;

    move-result-object v2

    .line 197
    invoke-virtual {v2, p3}, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->setUrlToCopy(Ljava/lang/String;)Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;

    move-result-object v2

    .line 198
    invoke-virtual {v2, p6}, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->setOrienation(I)Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;

    move-result-object v2

    .line 199
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;->go(Landroid/content/Context;)Z

    .line 200
    return-void

    .line 185
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static openHtml5Game(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "app"    # Lcom/vkontakte/android/data/ApiApplication;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "vs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "cs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 140
    iget-boolean v0, p0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-nez v0, :cond_0

    .line 175
    :goto_0
    return-void

    .line 144
    :cond_0
    new-instance v7, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v0, "apps.getEmbeddedUrl"

    invoke-direct {v7, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    new-instance v0, Lcom/vkontakte/android/data/Games$3;

    move-object v1, p2

    move-object v2, p1

    move-object v3, p0

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/data/Games$3;-><init>(Landroid/content/Context;Landroid/os/Bundle;Lcom/vkontakte/android/data/ApiApplication;Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    invoke-virtual {v7, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "app_id"

    iget v2, p0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    .line 171
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v6

    .line 173
    .local v6, "request":Lcom/vkontakte/android/api/VKAPIRequest;
    invoke-virtual {v6, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 174
    invoke-virtual {v6}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public static openInstallableGame(Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;ILjava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p0, "pkg"    # Ljava/lang/String;
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "act"    # Landroid/app/Activity;
    .param p3, "id"    # I
    .param p4, "vs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "cs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 213
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_1

    .line 214
    :cond_0
    const-string/jumbo v8, "No platform_id, can\'t start app!"

    const/4 v9, 0x0

    invoke-static {p2, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 258
    :goto_0
    return-void

    .line 218
    :cond_1
    :try_start_0
    invoke-virtual {p2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 219
    .local v5, "mgr":Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    .line 221
    .local v3, "info":Landroid/content/pm/PackageInfo;
    const/16 v8, 0x80

    :try_start_1
    invoke-virtual {v5, p0, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 225
    :goto_1
    if-eqz v3, :cond_4

    .line 226
    :try_start_2
    invoke-virtual {v5, p0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 227
    .local v4, "launcherIntent":Landroid/content/Intent;
    if-nez v4, :cond_2

    .line 228
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Package "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " has no launchable activities"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {p2, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 254
    .end local v3    # "info":Landroid/content/pm/PackageInfo;
    .end local v4    # "launcherIntent":Landroid/content/Intent;
    .end local v5    # "mgr":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v7

    .line 255
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v8, "vk"

    invoke-static {v8, v7}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 256
    const v8, 0x7f0801f9

    const/4 v9, 0x0

    invoke-static {p2, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 231
    .end local v7    # "x":Ljava/lang/Exception;
    .restart local v3    # "info":Landroid/content/pm/PackageInfo;
    .restart local v4    # "launcherIntent":Landroid/content/Intent;
    .restart local v5    # "mgr":Landroid/content/pm/PackageManager;
    :cond_2
    if-eqz p1, :cond_3

    .line 232
    :try_start_3
    invoke-virtual {v4, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 234
    :cond_3
    const-string/jumbo v8, "auth_user_id"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 235
    invoke-virtual {p2, v4}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 236
    const-string/jumbo v1, "game_launch"

    .line 247
    .end local v4    # "launcherIntent":Landroid/content/Intent;
    .local v1, "action":Ljava/lang/String;
    :goto_2
    const-string/jumbo v8, "games_action"

    invoke-static {v8}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v8

    const-string/jumbo v9, "visit_source"

    .line 248
    move-object/from16 v0, p4

    invoke-virtual {v8, v9, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v8

    const-string/jumbo v9, "click_source"

    .line 249
    move-object/from16 v0, p5

    invoke-virtual {v8, v9, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v8

    const-string/jumbo v9, "action_type"

    .line 250
    invoke-virtual {v8, v9, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v8

    const-string/jumbo v9, "game_id"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 251
    invoke-virtual {v8, v9, v10}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v9

    const-string/jumbo v10, "request_name"

    if-eqz p1, :cond_5

    const-string/jumbo v8, "name"

    .line 252
    invoke-virtual {p1, v8}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    const-string/jumbo v8, "name"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :goto_3
    invoke-virtual {v9, v10, v8}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v8

    .line 253
    invoke-virtual {v8}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->sendNow()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto/16 :goto_0

    .line 238
    .end local v1    # "action":Ljava/lang/String;
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "utm_source=vk&utm_campaign="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p5

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 239
    .local v6, "utm":Ljava/lang/String;
    invoke-static {v6}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v6

    .line 241
    :try_start_4
    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v9, "android.intent.action.VIEW"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "market://details?id="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "&referrer="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p2, v8}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_4
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 245
    :goto_4
    :try_start_5
    const-string/jumbo v1, "game_install"

    .restart local v1    # "action":Ljava/lang/String;
    goto/16 :goto_2

    .line 242
    .end local v1    # "action":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 243
    .local v2, "anfe":Landroid/content/ActivityNotFoundException;
    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v9, "android.intent.action.VIEW"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "http://play.google.com/store/apps/details?id="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "&referrer="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p2, v8}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_4

    .line 252
    .end local v2    # "anfe":Landroid/content/ActivityNotFoundException;
    .end local v6    # "utm":Ljava/lang/String;
    .restart local v1    # "action":Ljava/lang/String;
    :cond_5
    const/4 v8, 0x0

    goto/16 :goto_3

    .line 222
    .end local v1    # "action":Ljava/lang/String;
    :catch_2
    move-exception v8

    goto/16 :goto_1
.end method
