.class public final Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
.super Landroid/support/v4/app/Fragment;
.source "MusicSearchResultsLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;,
        Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;
    }
.end annotation


# static fields
.field private static final KEY_CAN_LOAD_MORE:Ljava/lang/String; = "MusicSearchResultsLoader.key.canLoadMore"

.field private static final KEY_OFFSET:Ljava/lang/String; = "MusicSearchResultsLoader.key.offset"

.field private static final KEY_QUERY:Ljava/lang/String; = "MusicSearchResultsLoader.key.query"

.field private static final KEY_REASON:Ljava/lang/String; = "MusicSearchResultsLoader.key.reason"

.field private static final KEY_SEARCH_RESULT:Ljava/lang/String; = "MusicSearchResultsLoader.key.musicSearchResult"

.field private static final LOAD_PORTION:I = 0x64


# instance fields
.field callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;",
            ">;"
        }
    .end annotation
.end field

.field canLoadMore:Z

.field private loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field musicSearchResult:Lcom/vk/music/dto/MusicSearchResult;

.field offset:I

.field private query:Ljava/lang/String;

.field reason:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;
    .param p1, "x1"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->notifyCallbacks(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V

    return-void
.end method

.method private load(II)V
    .locals 3
    .param p1, "audioOffset"    # I
    .param p2, "audioCount"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 172
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->query:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 128
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "MusicSearchResultsLoader: query is not initialized"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 132
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioSearch;

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->query:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/api/audio/AudioSearch;-><init>(Ljava/lang/String;ZII)V

    new-instance v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;-><init>(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;II)V

    .line 133
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 171
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private notifyCallbacks(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V
    .locals 3
    .param p1    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification",
            "<",
            "Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 182
    .local p1, "notification":Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;, "Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification<Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;>;"
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 183
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;

    .line 184
    .local v0, "callback":Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;
    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 187
    .end local v0    # "callback":Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;
    :cond_0
    return-void
.end method


# virtual methods
.method public canLoadMore()Z
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    return v0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 179
    :cond_0
    return-void
.end method

.method public getMusicSearchResult()Lcom/vk/music/dto/MusicSearchResult;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->musicSearchResult:Lcom/vk/music/dto/MusicSearchResult;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public load()V
    .locals 2

    .prologue
    .line 111
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load(II)V

    .line 112
    return-void

    .line 111
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method

.method public loadMore()V
    .locals 2

    .prologue
    .line 119
    iget v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load(II)V

    .line 120
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->setRetainInstance(Z)V

    .line 67
    if-eqz p1, :cond_0

    .line 68
    const-string/jumbo v0, "MusicSearchResultsLoader.key.query"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->query:Ljava/lang/String;

    .line 69
    const-string/jumbo v0, "MusicSearchResultsLoader.key.offset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    .line 70
    const-string/jumbo v0, "MusicSearchResultsLoader.key.canLoadMore"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    .line 71
    const-string/jumbo v0, "MusicSearchResultsLoader.key.musicSearchResult"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/MusicSearchResult;

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->musicSearchResult:Lcom/vk/music/dto/MusicSearchResult;

    .line 72
    const-string/jumbo v0, "MusicSearchResultsLoader.key.reason"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    .line 74
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 78
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 79
    invoke-virtual {p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->cancel()V

    .line 80
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 56
    const-string/jumbo v0, "MusicSearchResultsLoader.key.query"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->query:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string/jumbo v0, "MusicSearchResultsLoader.key.offset"

    iget v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 58
    const-string/jumbo v0, "MusicSearchResultsLoader.key.canLoadMore"

    iget-boolean v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 59
    const-string/jumbo v0, "MusicSearchResultsLoader.key.musicSearchResult"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->musicSearchResult:Lcom/vk/music/dto/MusicSearchResult;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 60
    const-string/jumbo v0, "MusicSearchResultsLoader.key.reason"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->query:Ljava/lang/String;

    .line 84
    invoke-virtual {p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->cancel()V

    .line 85
    return-void
.end method

.method public subscribe(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    return-void
.end method

.method public unsubscribe(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 98
    :cond_0
    return-void
.end method
