.class Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;
.super Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player;
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
        "Ljava/util/List",
        "<",
        "Lcom/vkontakte/android/audio/player/PlayerTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final mListener:Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;)V
    .locals 0
    .param p2, "listener"    # Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;

    .prologue
    .line 964
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;-><init>()V

    .line 965
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->mListener:Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;

    .line 966
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;Lcom/vkontakte/android/audio/player/Player$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;
    .param p3, "x2"    # Lcom/vkontakte/android/audio/player/Player$1;

    .prologue
    .line 961
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;-><init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 961
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 970
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;->loadTracks()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 961
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 975
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;->onPostExecute(Ljava/lang/Object;)V

    .line 977
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/vkontakte/android/audio/player/Player;->access$2202(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;)Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;

    .line 978
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$2300(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/Tracks;->clear()V

    .line 979
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$2300(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/Tracks;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/audio/player/Tracks;->addAll(Ljava/util/Collection;)V

    .line 980
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/audio/player/Prefs;->stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {v3}, Lcom/vk/core/util/Preference$PreferenceString;->has()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 982
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/audio/player/Prefs;->stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {v3}, Lcom/vk/core/util/Preference$PreferenceString;->get()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 983
    .local v1, "json":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    const-string/jumbo v4, "uuid"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/audio/player/Player;->getTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    .line 984
    .local v2, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v2, :cond_2

    .line 985
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "Player"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Restore track state "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 986
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/audio/player/TrackInfo;->setTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 987
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v3

    const/4 v4, 0x0

    const-string/jumbo v5, "duration"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/audio/player/TrackInfo;->setDuration(II)V

    .line 988
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v3

    const/4 v4, 0x0

    const-string/jumbo v5, "position"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/audio/player/TrackInfo;->setPosition(II)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 996
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->mListener:Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;

    if-eqz v3, :cond_1

    .line 997
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Player$LoadTracksTask;->mListener:Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;

    invoke-interface {v3}, Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;->onPlayerLoaded()V

    .line 998
    :cond_1
    return-void

    .line 990
    .restart local v1    # "json":Lorg/json/JSONObject;
    .restart local v2    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_2
    const/4 v3, 0x2

    :try_start_1
    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "Player"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "Restore track state: null"

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 992
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :catch_0
    move-exception v0

    .line 993
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
