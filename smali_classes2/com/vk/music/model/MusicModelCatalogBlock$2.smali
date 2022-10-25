.class Lcom/vk/music/model/MusicModelCatalogBlock$2;
.super Ljava/lang/Object;
.source "MusicModelCatalogBlock.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/MusicModelCatalogBlock;->load(ZII)V
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
        "Lcom/vk/music/dto/Section;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I

.field final synthetic val$loadOwner:Z


# direct methods
.method constructor <init>(Lcom/vk/music/model/MusicModelCatalogBlock;ZII)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/MusicModelCatalogBlock;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iput-boolean p2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$loadOwner:Z

    iput p3, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioOffset:I

    iput p4, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 211
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    iput-object v1, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->errorMessage:Ljava/lang/String;

    .line 213
    iget v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioOffset:I

    if-nez v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelCatalogBlock$2$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/MusicModelCatalogBlock$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelCatalogBlock;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 218
    :goto_0
    return-void

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelCatalogBlock$2$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/MusicModelCatalogBlock$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelCatalogBlock;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicModel$Callback;->onLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/MusicModel$Callback;->onAudioLoadingError(Lcom/vk/music/model/MusicModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-interface {p1, v0}, Lcom/vk/music/model/MusicModel$Callback;->onLoadingDone(Lcom/vk/music/model/MusicModel;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vk/music/dto/Section;Lcom/vk/music/model/MusicModel$Callback;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/music/dto/Section;
    .param p2, "callback"    # Lcom/vk/music/model/MusicModel$Callback;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-interface {p2, v0, v1}, Lcom/vk/music/model/MusicModel$Callback;->onAudioLoadingDone(Lcom/vk/music/model/MusicModel;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vk/music/dto/Section;)V
    .locals 5
    .param p1, "result"    # Lcom/vk/music/dto/Section;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 185
    iget-object v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/vk/music/model/MusicModelCatalogBlock;->loadRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 186
    iget-boolean v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$loadOwner:Z

    if-eqz v2, :cond_0

    .line 187
    iget-object v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-object v3, p1, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    iput-object v3, v2, Lcom/vk/music/model/MusicModelCatalogBlock;->owner:Ljava/lang/String;

    .line 189
    :cond_0
    iget v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioOffset:I

    if-nez v2, :cond_3

    .line 190
    iget-object v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-boolean v3, v2, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    iget-object v4, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    :goto_0
    and-int/2addr v0, v3

    iput-boolean v0, v2, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    .line 191
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioCount:I

    iput v1, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    .line 192
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    .line 201
    :cond_1
    :goto_1
    iget v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioOffset:I

    if-nez v0, :cond_5

    .line 202
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-static {p0}, Lcom/vk/music/model/MusicModelCatalogBlock$2$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/MusicModelCatalogBlock$2;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelCatalogBlock;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 206
    :goto_2
    return-void

    :cond_2
    move v0, v1

    .line 190
    goto :goto_0

    .line 194
    :cond_3
    iget-object v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-object v3, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    :goto_3
    iput-boolean v0, v2, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    .line 195
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-boolean v0, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->canLoadMore:Z

    if-eqz v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget v1, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioOffset:I

    iget v2, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->val$audioCount:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->offset:I

    .line 197
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    iget-object v0, v0, Lcom/vk/music/model/MusicModelCatalogBlock;->musicTracks:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_4
    move v0, v1

    .line 194
    goto :goto_3

    .line 204
    :cond_5
    iget-object v0, p0, Lcom/vk/music/model/MusicModelCatalogBlock$2;->this$0:Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-static {p0, p1}, Lcom/vk/music/model/MusicModelCatalogBlock$2$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/MusicModelCatalogBlock$2;Lcom/vk/music/dto/Section;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/MusicModelCatalogBlock;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 182
    check-cast p1, Lcom/vk/music/dto/Section;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/MusicModelCatalogBlock$2;->success(Lcom/vk/music/dto/Section;)V

    return-void
.end method
