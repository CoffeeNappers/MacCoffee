.class public Lcom/vk/webapp/ReportAppInputData;
.super Ljava/lang/Object;
.source "ReportAppInputData.java"


# static fields
.field private static final ACCESS_TOKEN_KEY:Ljava/lang/String; = "access_token"

.field private static final AD_DATA_KEY:Ljava/lang/String; = "ad_data"

.field private static final APP_ID_KEY:Ljava/lang/String; = "app_id"

.field private static final ITEM_ID_KEY:Ljava/lang/String; = "item_id"

.field private static final OWNER_ID_KEY:Ljava/lang/String; = "owner_id"

.field private static final PAGE_KEY:Ljava/lang/String; = "page"

.field private static final PAGE_VALUE:Ljava/lang/String; = "reports"

.field private static final REF_KEY:Ljava/lang/String; = "ref"

.field public static final REPORT_TYPE_AD:Ljava/lang/String; = "ad"

.field public static final REPORT_TYPE_APP:Ljava/lang/String; = "app"

.field private static final REPORT_TYPE_KEY:Ljava/lang/String; = "report_type"

.field public static final REPORT_TYPE_MARKET:Ljava/lang/String; = "market"

.field public static final REPORT_TYPE_MARKET_COMMENT:Ljava/lang/String; = "market_comment"

.field public static final REPORT_TYPE_PHOTO:Ljava/lang/String; = "photo"

.field public static final REPORT_TYPE_PHOTO_COMMENT:Ljava/lang/String; = "photo_comment"

.field public static final REPORT_TYPE_VIDEO:Ljava/lang/String; = "video"

.field public static final REPORT_TYPE_VIDEO_COMMENT:Ljava/lang/String; = "video_comment"

.field public static final REPORT_TYPE_WALL:Ljava/lang/String; = "wall"

.field public static final REPORT_TYPE_WALL_COMMENT:Ljava/lang/String; = "wall_comment"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSPAUriForAd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "adData"    # Ljava/lang/String;
    .param p1, "ref"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-static {}, Lcom/vk/webapp/ReportAppInputData;->getUriBuilder()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "report_type"

    const-string/jumbo v3, "ad"

    .line 51
    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "ad_data"

    .line 52
    invoke-virtual {v1, v2, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 54
    .local v0, "b":Landroid/net/Uri$Builder;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 55
    const-string/jumbo v1, "ref"

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 58
    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getSPAUriForApp(II)Ljava/lang/String;
    .locals 3
    .param p0, "ownerId"    # I
    .param p1, "appId"    # I

    .prologue
    .line 62
    invoke-static {}, Lcom/vk/webapp/ReportAppInputData;->getUriBuilder()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "report_type"

    const-string/jumbo v2, "app"

    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    .line 64
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "app_id"

    .line 65
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSPAUriForMainContentTypes(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "reportType"    # Ljava/lang/String;
    .param p1, "ownerId"    # I
    .param p2, "itemId"    # I
    .param p3, "ref"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-static {}, Lcom/vk/webapp/ReportAppInputData;->getUriBuilder()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "report_type"

    .line 42
    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    .line 43
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "item_id"

    .line 44
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "ref"

    .line 45
    invoke-virtual {v0, v1, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 46
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUriBuilder()Landroid/net/Uri$Builder;
    .locals 3

    .prologue
    .line 70
    invoke-static {}, Lcom/vk/webapp/VKUIWebContainerFragment;->getSPAUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 71
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "page"

    const-string/jumbo v2, "reports"

    .line 72
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "access_token"

    .line 73
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    return-object v0
.end method
