.class public final Lcom/vk/music/attach/AttachMusicActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "AttachMusicActivity.java"

# interfaces
.implements Lcom/vk/music/attach/controller/Controller$HostController;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final ATTACH_LIMIT:I = 0x64

.field private static final KEY_ATTACHED_TRACKS:Ljava/lang/String; = "AttachMusicActivity.key.attachedTracks"

.field private static final REQUEST_CODE_VOICE_SEARCH:I = 0xa


# instance fields
.field attachButtonCounterView:Landroid/widget/TextView;

.field attachedTracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field leftButton:Landroid/widget/ImageView;

.field loadersCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field musicLoader:Lcom/vk/music/attach/loader/MusicLoader;

.field playlistMusicLoader:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

.field playlistsLoader:Lcom/vk/music/attach/loader/PlaylistsLoader;

.field recyclerView:Landroid/support/v7/widget/RecyclerView;

.field refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field rightButton:Landroid/widget/ImageView;

.field scrollListener:Lcom/vk/music/view/LastReachedScrollListener;

.field searchView:Landroid/widget/EditText;

.field sharedStates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field titleView:Landroid/widget/TextView;

.field toolbarView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method

.method private static createTag(I)Ljava/lang/String;
    .locals 2
    .param p0, "entryIndex"    # I

    .prologue
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".tag"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static createTag(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .param p0, "fragmentClass"    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".tag"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private findLoader(Ljava/lang/Class;)Landroid/support/v4/app/Fragment;
    .locals 3
    .param p1, "loaderClass"    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 241
    const/4 v0, 0x0

    .line 242
    .local v0, "loader":Landroid/support/v4/app/Fragment;
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 243
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "loader":Landroid/support/v4/app/Fragment;
    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 245
    .restart local v0    # "loader":Landroid/support/v4/app/Fragment;
    :cond_0
    if-nez v0, :cond_1

    .line 246
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-static {p1}, Lcom/vk/music/attach/AttachMusicActivity;->createTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 250
    if-nez v0, :cond_2

    .line 251
    const/4 v1, 0x0

    .line 257
    :goto_0
    return-object v1

    :cond_1
    move-object v1, v0

    .line 248
    goto :goto_0

    .line 253
    :cond_2
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    if-nez v1, :cond_3

    .line 254
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    .line 256
    :cond_3
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 257
    goto :goto_0
.end method

.method private getCurrentController()Lcom/vk/music/attach/controller/Controller;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 403
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    invoke-static {v1}, Lcom/vk/music/attach/AttachMusicActivity;->createTag(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/controller/Controller;

    return-object v0
.end method

.method private moveNext(Lcom/vk/music/attach/controller/Controller;Ljava/lang/Class;Landroid/os/Bundle;Z)V
    .locals 5
    .param p1, "from"    # Lcom/vk/music/attach/controller/Controller;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "addToBackStack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/controller/Controller;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/controller/Controller;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 292
    .local p2, "toClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/controller/Controller;>;"
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 293
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_2

    .line 294
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    .line 295
    .local v2, "transaction":Landroid/support/v4/app/FragmentTransaction;
    if-eqz p1, :cond_0

    .line 296
    invoke-virtual {v2, p1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 298
    :cond_0
    if-eqz p4, :cond_3

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    :goto_0
    invoke-static {v3}, Lcom/vk/music/attach/AttachMusicActivity;->createTag(I)Ljava/lang/String;

    move-result-object v1

    .line 299
    .local v1, "toTag":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, p3}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 300
    if-eqz p1, :cond_1

    if-eqz p4, :cond_1

    .line 301
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/vk/music/attach/controller/Controller;->getTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 303
    :cond_1
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 305
    .end local v1    # "toTag":Ljava/lang/String;
    .end local v2    # "transaction":Landroid/support/v4/app/FragmentTransaction;
    :cond_2
    return-void

    .line 298
    .restart local v2    # "transaction":Landroid/support/v4/app/FragmentTransaction;
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private updateCounter()V
    .locals 3

    .prologue
    .line 163
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachButtonCounterView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 164
    return-void

    .line 163
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method


# virtual methods
.method public addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 3
    .param p1, "loaderClass"    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/support/v4/app/Fragment;",
            ">(",
            "Ljava/lang/Class;",
            "Landroid/os/Bundle;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 206
    invoke-direct {p0, p1}, Lcom/vk/music/attach/AttachMusicActivity;->findLoader(Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 207
    .local v0, "loader":Landroid/support/v4/app/Fragment;
    if-nez v0, :cond_1

    .line 208
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, p2}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 209
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 210
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    .line 212
    :cond_0
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 214
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 215
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 216
    invoke-static {p1}, Lcom/vk/music/attach/AttachMusicActivity;->createTag(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 217
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 220
    :cond_1
    return-object v0
.end method

.method public close()V
    .locals 0

    .prologue
    .line 314
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->finish()V

    .line 315
    return-void
.end method

.method public destroyLoader(Ljava/lang/Class;)V
    .locals 2
    .param p1, "loaderClass"    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lcom/vk/music/attach/AttachMusicActivity;->findLoader(Ljava/lang/Class;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 226
    .local v0, "loader":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_1

    .line 227
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 228
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->loadersCache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 231
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 232
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 233
    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 234
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 237
    :cond_1
    return-void
.end method

.method public getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method public getAttachedTracks()Ljava/util/Collection;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLeftButton()Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->leftButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->musicLoader:Lcom/vk/music/attach/loader/MusicLoader;

    if-nez v0, :cond_0

    .line 180
    const-class v0, Lcom/vk/music/attach/loader/MusicLoader;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/MusicLoader;

    iput-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->musicLoader:Lcom/vk/music/attach/loader/MusicLoader;

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->musicLoader:Lcom/vk/music/attach/loader/MusicLoader;

    return-object v0
.end method

.method public getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->playlistMusicLoader:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    if-nez v0, :cond_0

    .line 198
    const-class v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    iput-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->playlistMusicLoader:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    .line 200
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->playlistMusicLoader:Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    return-object v0
.end method

.method public getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->playlistsLoader:Lcom/vk/music/attach/loader/PlaylistsLoader;

    if-nez v0, :cond_0

    .line 189
    const-class v0, Lcom/vk/music/attach/loader/PlaylistsLoader;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/attach/loader/PlaylistsLoader;

    iput-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->playlistsLoader:Lcom/vk/music/attach/loader/PlaylistsLoader;

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->playlistsLoader:Lcom/vk/music/attach/loader/PlaylistsLoader;

    return-object v0
.end method

.method public getRightButton()Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->rightButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getSearchView()Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->searchView:Landroid/widget/EditText;

    return-object v0
.end method

.method public getSharedState(Ljava/lang/Class;)Landroid/os/Bundle;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/sharedstate/SharedState;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 279
    .local p1, "sharedStateClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/sharedstate/SharedState;>;"
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTitleView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->titleView:Landroid/widget/TextView;

    return-object v0
.end method

.method public isAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 1
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public moveBack()V
    .locals 1

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->popBackStackImmediate()Z

    .line 310
    return-void
.end method

.method public moveNext(Lcom/vk/music/attach/controller/Controller;Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "from"    # Lcom/vk/music/attach/controller/Controller;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/controller/Controller;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/controller/Controller;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 284
    .local p2, "toClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/controller/Controller;>;"
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 289
    :goto_0
    return-void

    .line 288
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vk/music/attach/AttachMusicActivity;->moveNext(Lcom/vk/music/attach/controller/Controller;Ljava/lang/Class;Landroid/os/Bundle;Z)V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 379
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/VKActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 380
    const/4 v1, -0x1

    if-eq p2, v1, :cond_1

    .line 392
    :cond_0
    :goto_0
    return-void

    .line 384
    :cond_1
    const/16 v1, 0xa

    if-ne p1, v1, :cond_0

    .line 385
    if-eqz p3, :cond_0

    .line 389
    const-string/jumbo v1, "query"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 390
    .local v0, "query":Ljava/lang/String;
    invoke-direct {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getCurrentController()Lcom/vk/music/attach/controller/Controller;

    move-result-object v1

    if-eqz v0, :cond_2

    .end local v0    # "query":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1, v0}, Lcom/vk/music/attach/controller/Controller;->onVoiceSearchResult(Ljava/lang/String;)V

    goto :goto_0

    .restart local v0    # "query":Ljava/lang/String;
    :cond_2
    const-string/jumbo v0, ""

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 396
    invoke-direct {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getCurrentController()Lcom/vk/music/attach/controller/Controller;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/controller/Controller;->onBackClicked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 397
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    .line 399
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 334
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f1003ef

    if-ne v0, v1, :cond_0

    .line 335
    const/4 v0, -0x1

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v2, "result"

    iget-object v3, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->setResult(ILandroid/content/Intent;)V

    .line 336
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->finish()V

    .line 338
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 348
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 349
    const v1, 0x7f030152

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->setContentView(I)V

    .line 351
    const v1, 0x7f1003e8

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->toolbarView:Landroid/view/View;

    .line 352
    const v1, 0x7f1003eb

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->titleView:Landroid/widget/TextView;

    .line 353
    const v1, 0x7f1003ec

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->searchView:Landroid/widget/EditText;

    .line 354
    const v1, 0x7f1003e9

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->leftButton:Landroid/widget/ImageView;

    .line 355
    const v1, 0x7f1003ea

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->rightButton:Landroid/widget/ImageView;

    .line 357
    const v1, 0x7f1003ed

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 358
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-array v2, v5, [I

    const v3, 0x7f0f0018

    aput v3, v2, v4

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 359
    const v1, 0x7f1003ee

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 360
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 361
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 362
    .local v0, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 363
    new-instance v1, Lcom/vk/music/view/LastReachedScrollListener;

    invoke-direct {v1, v0}, Lcom/vk/music/view/LastReachedScrollListener;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->scrollListener:Lcom/vk/music/view/LastReachedScrollListener;

    .line 364
    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/vk/music/attach/AttachMusicActivity;->scrollListener:Lcom/vk/music/view/LastReachedScrollListener;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 366
    const v1, 0x7f1003ef

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 367
    const v1, 0x7f1003f1

    invoke-virtual {p0, v1}, Lcom/vk/music/attach/AttachMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachButtonCounterView:Landroid/widget/TextView;

    .line 369
    if-nez p1, :cond_0

    .line 370
    const-class v1, Lcom/vk/music/attach/controller/MyMusicController;

    invoke-direct {p0, v6, v1, v6, v4}, Lcom/vk/music/attach/AttachMusicActivity;->moveNext(Lcom/vk/music/attach/controller/Controller;Ljava/lang/Class;Landroid/os/Bundle;Z)V

    .line 375
    :goto_0
    return-void

    .line 372
    :cond_0
    const-string/jumbo v1, "AttachMusicActivity.key.attachedTracks"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    .line 373
    invoke-direct {p0}, Lcom/vk/music/attach/AttachMusicActivity;->updateCounter()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 342
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 343
    const-string/jumbo v0, "AttachMusicActivity.key.attachedTracks"

    iget-object v1, p0, Lcom/vk/music/attach/AttachMusicActivity;->attachedTracks:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 344
    return-void
.end method

.method public putSharedState(Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "bundle"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/sharedstate/SharedState;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 263
    .local p1, "sharedStateClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/sharedstate/SharedState;>;"
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 264
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    .line 266
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    return-void
.end method

.method public removeSharedState(Ljava/lang/Class;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/sharedstate/SharedState;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 271
    .local p1, "sharedStateClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/sharedstate/SharedState;>;"
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->sharedStates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    :cond_0
    return-void
.end method

.method public restoreRecyclerState(Landroid/util/SparseArray;)V
    .locals 1
    .param p1    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "savedState":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 124
    return-void
.end method

.method public saveRecyclerState(Landroid/util/SparseArray;)V
    .locals 1
    .param p1    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, "outState":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 119
    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 1
    .param p1, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 109
    return-void
.end method

.method public setOnLastReachedListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->scrollListener:Lcom/vk/music/view/LastReachedScrollListener;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/LastReachedScrollListener;->setListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 134
    return-void
.end method

.method public setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 128
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 129
    return-void
.end method

.method public setRefreshing(Z)V
    .locals 1
    .param p1, "refreshing"    # Z

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vk/music/attach/AttachMusicActivity;->refreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 114
    return-void
.end method

.method public startVoiceSearch()V
    .locals 4

    .prologue
    const/16 v3, 0xa

    .line 324
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "android.speech.extra.LANGUAGE_MODEL"

    const-string/jumbo v2, "free_form"

    .line 326
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.speech.extra.MAX_RESULTS"

    .line 327
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    .line 324
    invoke-virtual {p0, v0, v3}, Lcom/vk/music/attach/AttachMusicActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 330
    return-void
.end method

.method public supportsVoiceSearch()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 319
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public tryToggleAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .locals 7
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/16 v6, 0x64

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 138
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getAttachedTracks()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 140
    .local v1, "isTrackToBeRemoved":Z
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getAttachedTracks()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v5

    if-eqz v1, :cond_0

    const/4 v4, -0x1

    :goto_0
    add-int v0, v5, v4

    .line 142
    .local v0, "attachedTracksSizeAfterToggle":I
    if-le v0, v6, :cond_1

    .line 143
    const v4, 0x7f080404

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v2

    invoke-virtual {p0, v4, v3}, Lcom/vk/music/attach/AttachMusicActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 154
    :goto_1
    return v2

    .end local v0    # "attachedTracksSizeAfterToggle":I
    :cond_0
    move v4, v3

    .line 140
    goto :goto_0

    .line 147
    .restart local v0    # "attachedTracksSizeAfterToggle":I
    :cond_1
    if-eqz v1, :cond_2

    .line 148
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getAttachedTracks()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 153
    :goto_2
    invoke-direct {p0}, Lcom/vk/music/attach/AttachMusicActivity;->updateCounter()V

    move v2, v3

    .line 154
    goto :goto_1

    .line 150
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/AttachMusicActivity;->getAttachedTracks()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method
