.class public interface abstract Lcom/vk/music/attach/controller/Controller$HostController;
.super Ljava/lang/Object;
.source "Controller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/controller/Controller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "HostController"
.end annotation


# virtual methods
.method public abstract addLoader(Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
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
.end method

.method public abstract close()V
.end method

.method public abstract destroyLoader(Ljava/lang/Class;)V
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getAttachedTracks()Ljava/util/Collection;
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
.end method

.method public abstract getLeftButton()Landroid/widget/ImageView;
.end method

.method public abstract getMusicLoader()Lcom/vk/music/attach/loader/MusicLoader;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlaylistsLoader()Lcom/vk/music/attach/loader/PlaylistsLoader;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getRightButton()Landroid/widget/ImageView;
.end method

.method public abstract getSearchView()Landroid/widget/EditText;
.end method

.method public abstract getSharedState(Ljava/lang/Class;)Landroid/os/Bundle;
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
.end method

.method public abstract getTitleView()Landroid/widget/TextView;
.end method

.method public abstract isAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract moveBack()V
.end method

.method public abstract moveNext(Lcom/vk/music/attach/controller/Controller;Ljava/lang/Class;Landroid/os/Bundle;)V
    .param p1    # Lcom/vk/music/attach/controller/Controller;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
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
.end method

.method public abstract putSharedState(Ljava/lang/Class;Landroid/os/Bundle;)V
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
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
.end method

.method public abstract removeSharedState(Ljava/lang/Class;)V
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
.end method

.method public abstract restoreRecyclerState(Landroid/util/SparseArray;)V
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
.end method

.method public abstract saveRecyclerState(Landroid/util/SparseArray;)V
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
.end method

.method public abstract setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .param p1    # Landroid/support/v7/widget/RecyclerView$Adapter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setOnLastReachedListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V
    .param p1    # Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V
    .param p1    # Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract setRefreshing(Z)V
.end method

.method public abstract startVoiceSearch()V
.end method

.method public abstract supportsVoiceSearch()Z
.end method

.method public abstract tryToggleAttached(Lcom/vkontakte/android/audio/MusicTrack;)Z
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
