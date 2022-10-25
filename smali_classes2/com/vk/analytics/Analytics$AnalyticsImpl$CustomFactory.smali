.class Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;
.super Lio/sentry/DefaultSentryClientFactory;
.source "Analytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/Analytics$AnalyticsImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomFactory"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mUserInterface:Lio/sentry/event/interfaces/UserInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 306
    invoke-direct {p0}, Lio/sentry/DefaultSentryClientFactory;-><init>()V

    .line 307
    iput-object p1, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;->mContext:Landroid/content/Context;

    .line 309
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "androidId":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 311
    new-instance v1, Lio/sentry/event/interfaces/UserInterface;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "android:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p2, v4, v4}, Lio/sentry/event/interfaces/UserInterface;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;->mUserInterface:Lio/sentry/event/interfaces/UserInterface;

    .line 314
    :cond_0
    return-void
.end method


# virtual methods
.method public createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;
    .locals 4
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 318
    invoke-super {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;

    move-result-object v0

    .line 319
    .local v0, "sentryClient":Lio/sentry/SentryClient;
    new-instance v1, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;

    iget-object v2, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;->mUserInterface:Lio/sentry/event/interfaces/UserInterface;

    invoke-direct {v1, v2, v3}, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;-><init>(Landroid/content/Context;Lio/sentry/event/interfaces/UserInterface;)V

    invoke-virtual {v0, v1}, Lio/sentry/SentryClient;->addBuilderHelper(Lio/sentry/event/helper/EventBuilderHelper;)V

    .line 320
    return-object v0
.end method
