.class Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;
.super Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.source "SavedTracks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/SavedTracks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveTracksTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/utils/AsyncTaskCompat",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mTracks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTrack;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/SavedTracks;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/SavedTracks;)V
    .locals 2

    .prologue
    .line 479
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;-><init>()V

    .line 480
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$900(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->mTracks:Ljava/util/List;

    .line 481
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 476
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 11
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v10, 0x0

    .line 485
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 486
    .local v0, "database":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 488
    :try_start_0
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 489
    .local v4, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->mTracks:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 490
    .local v5, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/SavedTrack;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 510
    .end local v4    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .end local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :catchall_0
    move-exception v6

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v6

    .line 492
    .restart local v4    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    :cond_0
    :try_start_1
    sget-object v6, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-virtual {v6}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->getAll()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 493
    .restart local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/SavedTrack;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 494
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/SavedTrack;->remove()Z

    .line 495
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->isCancelled()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-eqz v7, :cond_1

    .line 510
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 521
    .end local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_2
    :goto_1
    return-object v10

    .line 500
    :cond_3
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    :try_start_2
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->mTracks:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_5

    .line 501
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->mTracks:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 502
    .restart local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    iput v3, v5, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    .line 503
    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/SavedTrack;->save()Z

    .line 504
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->isCancelled()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v6

    if-eqz v6, :cond_4

    .line 510
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1

    .line 500
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 508
    .end local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_5
    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 510
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 513
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v6}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$1200(Lcom/vkontakte/android/audio/player/SavedTracks;)Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$1300(Landroid/content/Context;)Ljava/util/HashSet;

    move-result-object v2

    .line 514
    .local v2, "files":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/io/File;>;"
    sget-object v6, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-virtual {v6}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->getAll()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 515
    .restart local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    iget-object v7, v5, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-virtual {v2, v7}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_3

    .line 516
    .end local v5    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_6
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 518
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_4
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 476
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .param p1, "aVoid"    # Ljava/lang/Void;

    .prologue
    .line 526
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onPostExecute(Ljava/lang/Object;)V

    .line 528
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$1402(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;)Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    .line 529
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->this$0:Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->access$1500(Lcom/vkontakte/android/audio/player/SavedTracks;)V

    .line 530
    return-void
.end method
