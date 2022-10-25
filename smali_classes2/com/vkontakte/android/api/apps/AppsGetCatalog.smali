.class public Lcom/vkontakte/android/api/apps/AppsGetCatalog;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AppsGetCatalog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .locals 2
    .param p1, "filter"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "sectionId"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I
    .param p5, "platform"    # Ljava/lang/String;

    .prologue
    .line 37
    const-string/jumbo v0, "apps.getCatalog"

    const-class v1, Lcom/vkontakte/android/data/ApiApplication;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 38
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    const-string/jumbo v0, "filter"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 42
    :cond_0
    if-lez p2, :cond_1

    .line 43
    const-string/jumbo v0, "section_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 45
    :cond_1
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    if-eqz p5, :cond_2

    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 47
    const-string/jumbo v0, "platform"

    invoke-virtual {p0, v0, p5}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    :goto_0
    const-string/jumbo v0, "return_friends"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    return-void

    .line 50
    :cond_2
    const-string/jumbo v0, "platform"

    const-string/jumbo v1, "android"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 2
    .param p1, "filter"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .param p4, "platform"    # Ljava/lang/String;

    .prologue
    .line 15
    const-string/jumbo v0, "apps.getCatalog"

    const-class v1, Lcom/vkontakte/android/data/ApiApplication;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 17
    if-eqz p1, :cond_1

    const-string/jumbo v0, "html5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 19
    const-string/jumbo v0, "platform"

    const-string/jumbo v1, "html5"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    :goto_0
    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 29
    const-string/jumbo v0, "platform"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 32
    :cond_0
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    const-string/jumbo v0, "return_friends"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    return-void

    .line 22
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 23
    const-string/jumbo v0, "filter"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    :cond_2
    const-string/jumbo v0, "platform"

    const-string/jumbo v1, "android"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method
