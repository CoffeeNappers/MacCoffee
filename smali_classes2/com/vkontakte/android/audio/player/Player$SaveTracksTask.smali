.class Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;
.super Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player;
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
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0

    .prologue
    .line 1001
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/Player$1;

    .prologue
    .line 1001
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;-><init>(Lcom/vkontakte/android/audio/player/Player;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1001
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 10
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 1004
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1005
    .local v0, "database":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1007
    :try_start_0
    iget-object v6, p0, Lcom/vkontakte/android/audio/player/Player$SaveTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v6}, Lcom/vkontakte/android/audio/player/Player;->access$2300(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/audio/player/Tracks;->asList()Ljava/util/List;

    move-result-object v5

    .line 1008
    .local v5, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 1009
    .local v3, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 1010
    .local v4, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1024
    .end local v3    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .end local v4    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v5    # "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    :catch_0
    move-exception v1

    .line 1025
    .local v1, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    :try_start_1
    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1027
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1029
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    const/4 v6, 0x0

    return-object v6

    .line 1012
    .restart local v3    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .restart local v5    # "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    :cond_0
    :try_start_2
    sget-object v6, Lcom/vkontakte/android/audio/player/PlayerTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;

    invoke-virtual {v6}, Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;->getAll()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 1013
    .restart local v4    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1014
    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/PlayerTrack;->remove()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 1027
    .end local v3    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .end local v4    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v5    # "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    :catchall_0
    move-exception v6

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v6

    .line 1017
    .restart local v3    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .restart local v5    # "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    :cond_2
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    :try_start_3
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_3

    .line 1018
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 1019
    .restart local v4    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iput v2, v4, Lcom/vkontakte/android/audio/player/PlayerTrack;->position:I

    .line 1020
    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/PlayerTrack;->save()Z

    .line 1017
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1023
    .end local v4    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1027
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1
.end method
