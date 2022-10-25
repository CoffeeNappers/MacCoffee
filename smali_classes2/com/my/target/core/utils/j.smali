.class public final Lcom/my/target/core/utils/j;
.super Ljava/lang/Object;
.source "NavigationHelper.java"

# interfaces
.implements Lcom/my/target/core/async/commands/b$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/my/target/core/async/commands/b$a",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/my/target/core/async/commands/b",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/my/target/core/models/banners/d;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/utils/j;->a:Ljava/util/Map;

    .line 38
    return-void
.end method

.method private a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;)V
    .locals 5

    .prologue
    const/high16 v4, 0x10000000

    .line 136
    iget-object v0, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2282
    :cond_0
    :goto_0
    return-void

    .line 137
    :cond_1
    invoke-static {p2}, Lcom/my/target/core/utils/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 139
    const/4 v0, 0x0

    .line 140
    invoke-static {p2}, Lcom/my/target/core/utils/m;->b(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 144
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 145
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v2, v2, Landroid/app/Activity;

    if-nez v2, :cond_2

    .line 147
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 150
    :cond_2
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 151
    const/4 v0, 0x1

    .line 160
    :goto_1
    if-nez v0, :cond_0

    .line 2205
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 2206
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->isOpenInBrowser()Z

    move-result v0

    .line 2207
    if-eqz v0, :cond_6

    .line 2209
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2210
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-nez v1, :cond_4

    .line 2212
    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2214
    :cond_4
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 157
    :cond_5
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getUsePlayStoreAction()Z

    move-result v0

    invoke-direct {p0, v0, p2}, Lcom/my/target/core/utils/j;->a(ZLjava/lang/String;)Z

    move-result v0

    goto :goto_1

    .line 2217
    :cond_6
    const/16 v0, 0x12

    invoke-static {v0}, Lcom/my/target/core/utils/l;->c(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 2265
    iget-object v0, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 2268
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2269
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 2270
    const-string/jumbo v2, "android.support.customtabs.extra.SESSION"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 2271
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v2, v2, Landroid/app/Activity;

    if-nez v2, :cond_7

    .line 2273
    const-string/jumbo v2, "Starting chrome tab from outside activity Context, creating new task"

    invoke-static {v2}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 2274
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2276
    :cond_7
    const-string/jumbo v2, "com.android.chrome"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2277
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 2278
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 2281
    :catch_0
    move-exception v0

    invoke-direct {p0, p2}, Lcom/my/target/core/utils/j;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2222
    :cond_8
    invoke-direct {p0, p2}, Lcom/my/target/core/utils/j;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 154
    :catch_1
    move-exception v1

    goto/16 :goto_1
.end method

.method private a(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 251
    iget-object v0, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 260
    :goto_0
    return-void

    .line 252
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    const-class v2, Lcom/my/target/ads/MyTargetActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 253
    const-string/jumbo v1, "com.my.target.actions.webview"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 254
    const-string/jumbo v1, "com.my.target.extras.web_vew_url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-nez v1, :cond_1

    .line 257
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 259
    :cond_1
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private a(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 68
    .line 69
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-nez v1, :cond_0

    move v0, v2

    .line 102
    :goto_0
    return v0

    .line 70
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 74
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 75
    iget-object v3, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v3, v3, Landroid/app/Activity;

    if-nez v3, :cond_1

    .line 77
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 79
    :cond_1
    invoke-virtual {v1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    iget-object v3, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v0

    .line 87
    :goto_1
    if-nez p1, :cond_3

    move v0, v2

    goto :goto_0

    :catch_0
    move-exception v1

    :cond_2
    move v1, v2

    goto :goto_1

    .line 88
    :cond_3
    if-nez v1, :cond_5

    .line 92
    :try_start_1
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v2, v2, Landroid/app/Activity;

    if-nez v2, :cond_4

    .line 94
    const/high16 v2, 0x10000000

    invoke-virtual {p1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 96
    :cond_4
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    :cond_5
    move v0, v1

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 113
    .line 114
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-nez v1, :cond_1

    .line 131
    :cond_0
    :goto_0
    return v0

    .line 115
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 119
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 120
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v2, v2, Landroid/app/Activity;

    if-nez v2, :cond_2

    .line 122
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 124
    :cond_2
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 125
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private a(ZLjava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 171
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-nez v1, :cond_0

    .line 200
    :goto_0
    return v0

    .line 174
    :cond_0
    if-eqz p1, :cond_3

    .line 176
    :try_start_0
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string/jumbo v2, "com.android.vending"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 177
    new-instance v2, Landroid/content/ComponentName;

    const-string/jumbo v3, "com.android.vending"

    const-string/jumbo v4, "com.google.android.finsky.activities.LaunchUrlHandlerActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 179
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v2, v2, Landroid/app/Activity;

    if-nez v2, :cond_1

    .line 181
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 183
    :cond_1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 192
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 194
    const/4 v0, 0x1

    goto :goto_0

    .line 187
    :cond_3
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 188
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    instance-of v2, v2, Landroid/app/Activity;

    if-nez v2, :cond_2

    .line 190
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 197
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public final a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 42
    iput-object p2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    .line 44
    iget-object v0, p0, Lcom/my/target/core/utils/j;->a:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    :cond_0
    :goto_0
    return-void

    .line 45
    :cond_1
    const/4 v0, 0x1

    .line 47
    const-string/jumbo v1, "store"

    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getNavigationType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 49
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getBundleId()Ljava/lang/String;

    move-result-object v1

    .line 1107
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-nez v2, :cond_2

    const/4 v1, 0x0

    .line 50
    :goto_1
    if-eqz v1, :cond_4

    .line 52
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getBundleId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getDeepLink()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/my/target/core/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 54
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getStats()Ljava/util/ArrayList;

    move-result-object v0

    const-string/jumbo v1, "deeplinkClick"

    invoke-static {v0, v1, p2}, Lcom/my/target/core/async/a;->a(Ljava/util/List;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .line 1108
    :cond_2
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    goto :goto_1

    .line 57
    :cond_3
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getBundleId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getUrlScheme()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/my/target/core/utils/j;->a(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 59
    const/4 v0, 0x0

    .line 1229
    :cond_4
    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 1230
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getTrackingLink()Ljava/lang/String;

    move-result-object v1

    .line 1231
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1232
    if-eqz v0, :cond_5

    invoke-static {v1}, Lcom/my/target/core/utils/m;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1234
    invoke-direct {p0, p1, v1}, Lcom/my/target/core/utils/j;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;)V

    .line 1246
    :goto_2
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getStats()Ljava/util/ArrayList;

    move-result-object v0

    const-string/jumbo v1, "click"

    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/my/target/core/async/a;->a(Ljava/util/List;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .line 1237
    :cond_5
    iget-object v2, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/my/target/core/factories/b;->a(Ljava/lang/String;Landroid/content/Context;)Lcom/my/target/core/async/commands/b;

    move-result-object v1

    .line 1239
    if-eqz v0, :cond_6

    .line 1241
    invoke-interface {v1, p0}, Lcom/my/target/core/async/commands/b;->a(Lcom/my/target/core/async/commands/b$a;)V

    .line 1242
    iget-object v0, p0, Lcom/my/target/core/utils/j;->a:Ljava/util/Map;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1244
    :cond_6
    invoke-interface {v1}, Lcom/my/target/core/async/commands/b;->b()V

    goto :goto_2
.end method

.method public final synthetic onExecute(Lcom/my/target/core/async/commands/b;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 29
    check-cast p2, Ljava/lang/String;

    .line 2288
    iget-object v0, p0, Lcom/my/target/core/utils/j;->a:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/d;

    .line 2289
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/my/target/core/utils/j;->b:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 2291
    invoke-direct {p0, v0, p2}, Lcom/my/target/core/utils/j;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;)V

    .line 2293
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/utils/j;->a:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2295
    iget-object v0, p0, Lcom/my/target/core/utils/j;->a:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    :cond_1
    return-void
.end method
