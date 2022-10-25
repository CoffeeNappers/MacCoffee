.class public Lcom/vk/music/model/SearchModel;
.super Ljava/lang/Object;
.source "SearchModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/SearchModel$View;
    }
.end annotation


# instance fields
.field private page:I
    .annotation build Lcom/vk/music/model/SearchModel$View$Page;
    .end annotation
.end field

.field private query:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private state:I
    .annotation build Lcom/vk/music/model/SearchModel$View$State;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;ZZ)V
    .locals 5
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "openResults"    # Z
    .param p3, "openArtistPage"    # Z

    .prologue
    const/4 v4, 0x1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lcom/vk/music/model/SearchSuggestionModelImpl;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "music_search"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/model/SearchSuggestionModelImpl;-><init>(Landroid/content/SharedPreferences;)V

    iput-object v0, p0, Lcom/vk/music/model/SearchModel;->searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;

    .line 47
    if-eqz p1, :cond_1

    .line 48
    invoke-virtual {p0, p1}, Lcom/vk/music/model/SearchModel;->setQuery(Ljava/lang/String;)V

    .line 49
    if-eqz p2, :cond_0

    .line 50
    invoke-virtual {p0, v4}, Lcom/vk/music/model/SearchModel;->setState(I)V

    .line 52
    :cond_0
    if-eqz p3, :cond_1

    .line 53
    invoke-virtual {p0, v4}, Lcom/vk/music/model/SearchModel;->setPage(I)V

    .line 56
    :cond_1
    return-void
.end method

.method private initSearchResults(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/SearchResultModel;->setQuery(Ljava/lang/String;)V

    .line 141
    :goto_0
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v0, :cond_1

    .line 142
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0, p1}, Lcom/vk/music/model/SearchResultModel;->setQuery(Ljava/lang/String;)V

    .line 146
    :goto_1
    return-void

    .line 139
    :cond_0
    new-instance v0, Lcom/vk/music/model/SearchResultModelImpl;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lcom/vk/music/model/SearchResultModelImpl;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    goto :goto_0

    .line 144
    :cond_1
    new-instance v0, Lcom/vk/music/model/SearchResultModelImpl;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v1}, Lcom/vk/music/model/SearchResultModelImpl;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    goto :goto_1
.end method


# virtual methods
.method public clearCallbacks()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchSuggestionModel;->clearCallbacks()V

    .line 104
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->clearCallbacks()V

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v0, :cond_1

    .line 108
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->clearCallbacks()V

    .line 110
    :cond_1
    return-void
.end method

.method public getPage()I
    .locals 1
    .annotation build Lcom/vk/music/model/SearchModel$View$Page;
    .end annotation

    .prologue
    .line 159
    iget v0, p0, Lcom/vk/music/model/SearchModel;->page:I

    return v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getSearchResultByArtistModel()Lcom/vk/music/model/SearchResultModel;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    return-object v0
.end method

.method public getSearchResultByTitleModel()Lcom/vk/music/model/SearchResultModel;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    return-object v0
.end method

.method public getSearchSuggestionModel()Lcom/vk/music/model/SearchSuggestionModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;

    return-object v0
.end method

.method public getState()I
    .locals 1
    .annotation build Lcom/vk/music/model/SearchModel$View$State;
    .end annotation

    .prologue
    .line 150
    iget v0, p0, Lcom/vk/music/model/SearchModel;->state:I

    return v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchSuggestionModel;->release()V

    .line 115
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->release()V

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v0, :cond_1

    .line 119
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v0}, Lcom/vk/music/model/SearchResultModel;->release()V

    .line 121
    :cond_1
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 60
    const-string/jumbo v1, "query"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    .line 62
    const-string/jumbo v1, "state"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/model/SearchModel;->state:I

    .line 64
    const-string/jumbo v1, "page"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/model/SearchModel;->page:I

    .line 65
    const-string/jumbo v1, "suggestion"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 66
    .local v0, "b":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 67
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v1, v0}, Lcom/vk/music/model/SearchSuggestionModel;->restore(Landroid/os/Bundle;)V

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 71
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/vk/music/model/SearchModel;->initSearchResults(Ljava/lang/String;)V

    .line 72
    const-string/jumbo v1, "resultByTitle"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 73
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v1, :cond_1

    .line 74
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1, v0}, Lcom/vk/music/model/SearchResultModel;->restore(Landroid/os/Bundle;)V

    .line 76
    :cond_1
    const-string/jumbo v1, "resultByArtist"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 77
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v1, :cond_2

    .line 78
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v1, v0}, Lcom/vk/music/model/SearchResultModel;->restore(Landroid/os/Bundle;)V

    .line 81
    :cond_2
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 86
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 87
    .local v0, "outState":Landroid/os/Bundle;
    const-string/jumbo v1, "query"

    iget-object v2, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    const-string/jumbo v1, "state"

    iget v2, p0, Lcom/vk/music/model/SearchModel;->state:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 89
    const-string/jumbo v1, "page"

    iget v2, p0, Lcom/vk/music/model/SearchModel;->page:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 90
    const-string/jumbo v1, "suggestion"

    iget-object v2, p0, Lcom/vk/music/model/SearchModel;->searchSuggestionModel:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v2}, Lcom/vk/music/model/SearchSuggestionModel;->save()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 91
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v1, :cond_0

    .line 92
    const-string/jumbo v1, "query"

    iget-object v2, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v2}, Lcom/vk/music/model/SearchResultModel;->getQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const-string/jumbo v1, "resultByTitle"

    iget-object v2, p0, Lcom/vk/music/model/SearchModel;->searchResultByTitleModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v2}, Lcom/vk/music/model/SearchResultModel;->save()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 95
    :cond_0
    iget-object v1, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    if-eqz v1, :cond_1

    .line 96
    const-string/jumbo v1, "resultByArtist"

    iget-object v2, p0, Lcom/vk/music/model/SearchModel;->searchResultByArtistModel:Lcom/vk/music/model/SearchResultModel;

    invoke-interface {v2}, Lcom/vk/music/model/SearchResultModel;->save()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 98
    :cond_1
    return-object v0
.end method

.method public setPage(I)V
    .locals 0
    .param p1, "page"    # I
        .annotation build Lcom/vk/music/model/SearchModel$View$Page;
        .end annotation
    .end param

    .prologue
    .line 163
    iput p1, p0, Lcom/vk/music/model/SearchModel;->page:I

    .line 164
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 130
    iput-object p1, p0, Lcom/vk/music/model/SearchModel;->query:Ljava/lang/String;

    .line 131
    invoke-direct {p0, p1}, Lcom/vk/music/model/SearchModel;->initSearchResults(Ljava/lang/String;)V

    .line 133
    :cond_0
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I
        .annotation build Lcom/vk/music/model/SearchModel$View$State;
        .end annotation
    .end param

    .prologue
    .line 154
    iput p1, p0, Lcom/vk/music/model/SearchModel;->state:I

    .line 155
    return-void
.end method
