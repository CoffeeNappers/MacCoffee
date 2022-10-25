.class public Lcom/my/tracker/campaign/CampaignService;
.super Landroid/app/IntentService;
.source "CampaignService.java"


# static fields
.field private static volatile a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    const-string/jumbo v0, "MyTrackerCampaignService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 34
    sput-object p0, Lcom/my/tracker/campaign/CampaignService;->a:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .prologue
    .line 58
    const-string/jumbo v0, "CampaignService created"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 59
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 60
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 65
    const-string/jumbo v0, "CampaignService destroyed"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 66
    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    .line 67
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 4

    .prologue
    .line 72
    if-eqz p1, :cond_1

    const-string/jumbo v0, "referrer"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    const-string/jumbo v0, "referrer"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 75
    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    .line 78
    :cond_0
    :try_start_0
    sget-object v1, Lcom/my/tracker/campaign/CampaignService;->a:Ljava/lang/String;

    .line 1061
    invoke-static {}, Lcom/my/tracker/net/a;->a()Ljava/lang/String;

    move-result-object v2

    .line 1062
    new-instance v3, Lcom/my/tracker/async/commands/l;

    invoke-direct {v3, v2, v0, v1, p0}, Lcom/my/tracker/async/commands/l;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 78
    invoke-interface {v3}, Lcom/my/tracker/async/commands/d;->b()Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :cond_1
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Error executing track referrer: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
