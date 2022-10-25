.class public abstract Lcom/vkontakte/android/api/apps/CatalogLoader;
.super Ljava/lang/Object;
.source "CatalogLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final DEFAULT_COUNT:I = 0xa


# instance fields
.field private final applications:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation
.end field

.field private bypassHtmlGames:Z

.field private volatile canLoadMore:Z

.field private final catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final count:I

.field private volatile currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private volatile isLoading:Z


# direct methods
.method protected constructor <init>(ILjava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo$FilterType;)V
    .locals 2
    .param p1, "titleRes"    # I
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "filterType"    # Lcom/vkontakte/android/data/CatalogInfo$FilterType;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;",
            "Lcom/vkontakte/android/data/CatalogInfo$FilterType;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "application":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    .line 19
    iput-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->isLoading:Z

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    .line 29
    iput-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->bypassHtmlGames:Z

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 34
    new-instance v0, Lcom/vkontakte/android/data/CatalogInfo;

    invoke-direct {v0, p1, p3}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 35
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->count:I

    .line 36
    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/apps/CatalogLoader;->processApps(Ljava/util/ArrayList;)V

    .line 37
    return-void

    .line 35
    :cond_0
    const/16 v0, 0xa

    goto :goto_0
.end method

.method protected constructor <init>(ILjava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo$FilterType;Ljava/lang/String;)V
    .locals 1
    .param p1, "titleRes"    # I
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "filterType"    # Lcom/vkontakte/android/data/CatalogInfo$FilterType;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "platform"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;",
            "Lcom/vkontakte/android/data/CatalogInfo$FilterType;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "application":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/api/apps/CatalogLoader;-><init>(ILjava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iput-object p4, v0, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    .line 43
    return-void
.end method

.method protected constructor <init>(Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Z)V
    .locals 2
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "catalogInfo"    # Lcom/vkontakte/android/data/CatalogInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "bypassHtmlGames"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;",
            "Lcom/vkontakte/android/data/CatalogInfo;",
            "Z)V"
        }
    .end annotation

    .prologue
    .local p1, "application":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    .line 19
    iput-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->isLoading:Z

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    .line 29
    iput-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->bypassHtmlGames:Z

    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 47
    iput-object p2, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 48
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->count:I

    .line 49
    iput-boolean p3, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->bypassHtmlGames:Z

    .line 50
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/apps/CatalogLoader;->processApps(Ljava/util/ArrayList;)V

    .line 51
    return-void

    .line 48
    :cond_0
    const/16 v0, 0xa

    goto :goto_0
.end method

.method private processApps(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "application":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 80
    .local v0, "apiApplication":Lcom/vkontakte/android/data/ApiApplication;
    iget-object v2, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iput-object v2, v0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 81
    iget-object v2, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget-object v2, v2, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    sget-object v3, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    if-ne v2, v3, :cond_0

    .line 82
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    goto :goto_0

    .line 85
    .end local v0    # "apiApplication":Lcom/vkontakte/android/data/ApiApplication;
    :cond_1
    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v0, 0x0

    .line 108
    iput-boolean v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->isLoading:Z

    .line 109
    iput-boolean v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    iget-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/CatalogLoader;->onLoadedNextPage(Ljava/util/ArrayList;Z)V

    .line 111
    return-void
.end method

.method public forceLoadNextPage()Z
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 61
    iget-boolean v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->isLoading:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    if-eqz v0, :cond_1

    .line 62
    iput-boolean v6, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->isLoading:Z

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/CatalogInfo;->hasGenreId()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetCatalog;

    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/CatalogInfo;->getServerKey()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget v2, v2, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    iget-object v3, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget v4, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->count:I

    iget-object v5, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget-object v5, v5, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    .line 65
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 66
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    :goto_0
    move v0, v6

    .line 74
    :goto_1
    return v0

    .line 68
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetCatalog;

    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/CatalogInfo;->getServerKey()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget v3, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->count:I

    iget-object v4, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget-object v4, v4, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 69
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 70
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 74
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public abstract onLoadedNextPage(Ljava/util/ArrayList;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;Z)V"
        }
    .end annotation
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/data/ApiApplication;>;"
    const/4 v1, 0x0

    .line 93
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/apps/CatalogLoader;->processApps(Ljava/util/ArrayList;)V

    .line 95
    iput-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->isLoading:Z

    .line 96
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v2

    iget v3, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->count:I

    if-lt v2, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 98
    iget-boolean v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->bypassHtmlGames:Z

    if-eqz v1, :cond_1

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v1, v1, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v1, :cond_1

    .line 97
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 101
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 103
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    iget-boolean v2, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->canLoadMore:Z

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/apps/CatalogLoader;->onLoadedNextPage(Ljava/util/ArrayList;Z)V

    .line 104
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 14
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/apps/CatalogLoader;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method

.method public updateApiApplication(Lcom/vkontakte/android/data/ApiApplication;)V
    .locals 2
    .param p1, "apiApplication"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 54
    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 55
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/api/apps/CatalogLoader;->applications:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 58
    :cond_0
    return-void
.end method
