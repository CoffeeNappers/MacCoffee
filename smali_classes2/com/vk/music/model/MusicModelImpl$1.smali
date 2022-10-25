.class Lcom/vk/music/model/MusicModelImpl$1;
.super Ljava/lang/Object;
.source "MusicModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicModelImpl;->load(ZZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/MusicModelImpl;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I

.field final synthetic val$loadOwner:Z

.field final synthetic val$loadPlaylists:Z


# direct methods
.method constructor <init>(Lcom/vk/music/model/MusicModelImpl;ZZII)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/MusicModelImpl;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iput-boolean p2, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$loadOwner:Z

    iput-boolean p3, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$loadPlaylists:Z

    iput p4, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioOffset:I

    iput p5, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 268
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->access$002(Lcom/vk/music/model/MusicModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 269
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->access$702(Lcom/vk/music/model/MusicModelImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 271
    iget v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioOffset:I

    if-nez v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelImpl$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 276
    :goto_0
    return-void

    .line 274
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelImpl$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 272
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicModel$Callback;->onLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 274
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicModel$Callback;->onAudioLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/MusicModel$Callback;->onLoadingDone(Lcom/vk/music/model/MusicModel;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 262
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/model/MusicModel$Callback;->onAudioLoadingDone(Lcom/vk/music/model/MusicModel;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 230
    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vk/music/model/MusicModelImpl;->access$002(Lcom/vk/music/model/MusicModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 231
    iget-boolean v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$loadOwner:Z

    if-eqz v2, :cond_1

    .line 232
    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 233
    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/vk/music/model/MusicModelImpl;->access$102(Lcom/vk/music/model/MusicModelImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 235
    :cond_0
    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerImage:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 236
    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->ownerImage:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/vk/music/model/MusicModelImpl;->access$202(Lcom/vk/music/model/MusicModelImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 239
    :cond_1
    iget-boolean v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$loadPlaylists:Z

    if-eqz v2, :cond_4

    .line 240
    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->savedAudios:Lcom/vk/music/dto/Playlist;

    if-eqz v2, :cond_3

    .line 241
    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->playlists:Lcom/vkontakte/android/data/VKList;

    if-nez v2, :cond_2

    .line 242
    new-instance v2, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v2}, Lcom/vkontakte/android/data/VKList;-><init>()V

    iput-object v2, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->playlists:Lcom/vkontakte/android/data/VKList;

    .line 244
    :cond_2
    iget-object v2, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->playlists:Lcom/vkontakte/android/data/VKList;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->savedAudios:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v2, v1, v3}, Lcom/vkontakte/android/data/VKList;->add(ILjava/lang/Object;)V

    .line 246
    :cond_3
    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->playlists:Lcom/vkontakte/android/data/VKList;

    invoke-static {v2, v3}, Lcom/vk/music/model/MusicModelImpl;->access$302(Lcom/vk/music/model/MusicModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 249
    :cond_4
    iget v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioOffset:I

    if-nez v2, :cond_6

    .line 250
    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v3, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {v3}, Lcom/vk/music/model/MusicModelImpl;->access$400(Lcom/vk/music/model/MusicModelImpl;)Z

    move-result v3

    iget-object v4, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    :goto_0
    and-int/2addr v0, v3

    invoke-static {v2, v0}, Lcom/vk/music/model/MusicModelImpl;->access$402(Lcom/vk/music/model/MusicModelImpl;Z)Z

    .line 251
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget v1, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioCount:I

    invoke-static {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->access$502(Lcom/vk/music/model/MusicModelImpl;I)I

    .line 252
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-static {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->access$602(Lcom/vk/music/model/MusicModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 254
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/MusicModelImpl$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl$1;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 264
    :goto_1
    return-void

    :cond_5
    move v0, v1

    .line 250
    goto :goto_0

    .line 256
    :cond_6
    iget-object v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget-object v3, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8

    :goto_2
    invoke-static {v2, v0}, Lcom/vk/music/model/MusicModelImpl;->access$402(Lcom/vk/music/model/MusicModelImpl;Z)Z

    .line 257
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicModelImpl;->access$400(Lcom/vk/music/model/MusicModelImpl;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 258
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    iget v1, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioOffset:I

    iget v2, p0, Lcom/vk/music/model/MusicModelImpl$1;->val$audioCount:I

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->access$502(Lcom/vk/music/model/MusicModelImpl;I)I

    .line 259
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {v0}, Lcom/vk/music/model/MusicModelImpl;->access$600(Lcom/vk/music/model/MusicModelImpl;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;->musicTracks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 262
    :cond_7
    iget-object v0, p0, Lcom/vk/music/model/MusicModelImpl$1;->this$0:Lcom/vk/music/model/MusicModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelImpl$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/MusicModelImpl$1;Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_1

    :cond_8
    move v0, v1

    .line 256
    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 227
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicModelImpl$1;->success(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;)V

    return-void
.end method
