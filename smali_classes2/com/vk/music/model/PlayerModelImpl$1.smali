.class Lcom/vk/music/model/PlayerModelImpl$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PlayerModelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/PlayerModelImpl;->loadAndPlayTheSame(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/PlayerModelImpl;


# direct methods
.method constructor <init>(Lcom/vk/music/model/PlayerModelImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/PlayerModelImpl;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vk/music/model/PlayerModelImpl$1;->this$0:Lcom/vk/music/model/PlayerModelImpl;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vk/music/model/PlayerModelImpl$1;->this$0:Lcom/vk/music/model/PlayerModelImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/model/PlayerModelImpl;->togglePlayer(Lcom/vkontakte/android/audio/MusicTrack;Ljava/util/List;)V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_0
    const v0, 0x7f08040e

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 106
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/PlayerModelImpl$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
