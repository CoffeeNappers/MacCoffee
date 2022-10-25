.class interface abstract Lcom/vkontakte/android/media/VideoPools$PlayerFactory;
.super Ljava/lang/Object;
.source "VideoPools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/VideoPools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "PlayerFactory"
.end annotation


# virtual methods
.method public abstract attachContext(Landroid/support/v4/util/Pair;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/media/VideoPools$PlayerContext;",
            ")Z"
        }
    .end annotation
.end method

.method public abstract detachContext(Landroid/support/v4/util/Pair;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract getPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "IZZ",
            "Ljava/lang/String;",
            ")",
            "Lcom/vkontakte/android/media/AbsVideoPlayer;"
        }
    .end annotation
.end method

.method public abstract releasePlayer(Landroid/support/v4/util/Pair;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation
.end method
