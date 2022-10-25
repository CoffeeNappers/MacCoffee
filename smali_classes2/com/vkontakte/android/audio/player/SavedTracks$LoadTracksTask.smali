.class Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;
.super Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.source "SavedTracks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/SavedTracks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadTracksTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final mListener:Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/SavedTracks;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;Landroid/content/Context;)V
    .locals 0
    .param p2, "listener"    # Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 426
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;-><init>()V

    .line 427
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->mListener:Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;

    .line 428
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->context:Landroid/content/Context;

    .line 429
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;Landroid/content/Context;Lcom/vkontakte/android/audio/player/SavedTracks$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;
    .param p3, "x2"    # Landroid/content/Context;
    .param p4, "x3"    # Lcom/vkontakte/android/audio/player/SavedTracks$1;

    .prologue
    .line 422
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;-><init>(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;
    .locals 8
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v6, 0x1

    .line 434
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->importOldFiles()V

    .line 436
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 437
    .local v2, "lostSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 438
    .local v0, "checkedFiles":Ljava/util/Map;, "Ljava/util/Map<Ljava/io/File;Ljava/lang/Boolean;>;"
    sget-object v5, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->loadTracks()Ljava/util/ArrayList;

    move-result-object v4

    .line 439
    .local v4, "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 440
    .local v3, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    iget-object v5, v3, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 441
    .local v1, "lost":Ljava/lang/Boolean;
    if-nez v1, :cond_2

    .line 442
    iget-object v5, v3, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_3

    move v5, v6

    :goto_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 443
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 444
    iget-object v5, v3, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 445
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 447
    :cond_1
    iget-object v5, v3, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 450
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 442
    :cond_3
    const/4 v5, 0x0

    goto :goto_1

    .line 453
    .end local v1    # "lost":Ljava/lang/Boolean;
    .end local v3    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_4
    new-instance v5, Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;

    invoke-direct {v5, v4, v2}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;-><init>(Ljava/util/ArrayList;Ljava/util/Set;)V

    return-object v5
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 422
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;

    .prologue
    .line 458
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onPostExecute(Ljava/lang/Object;)V

    .line 460
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$802(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;)Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    .line 462
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$900(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 463
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$900(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;->midsList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 465
    iget-object v1, p1, Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;->midsList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 466
    .local v0, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$1000(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 469
    .end local v0    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$1100(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;->lostMidsSet:Ljava/util/Set;

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 471
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->mListener:Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;

    if-eqz v1, :cond_1

    .line 472
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->mListener:Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;

    invoke-interface {v1}, Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;->onSavedTracksLoaded()V

    .line 473
    :cond_1
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 422
    check-cast p1, Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->onPostExecute(Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;)V

    return-void
.end method
