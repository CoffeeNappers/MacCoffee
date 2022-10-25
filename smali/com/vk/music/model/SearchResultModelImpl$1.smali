.class Lcom/vk/music/model/SearchResultModelImpl$1;
.super Ljava/lang/Object;
.source "SearchResultModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/SearchResultModelImpl;->load(II)V
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
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/SearchResultModelImpl;

.field final synthetic val$offset:I


# direct methods
.method constructor <init>(Lcom/vk/music/model/SearchResultModelImpl;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/SearchResultModelImpl;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    iput p2, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->val$offset:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 250
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/model/SearchResultModelImpl;->access$002(Lcom/vk/music/model/SearchResultModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 251
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    iget v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->val$offset:I

    if-nez v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/model/SearchResultModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/SearchResultModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 257
    :goto_0
    return-void

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/model/SearchResultModelImpl$1;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/SearchResultModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/SearchResultModel$Callback;

    .prologue
    .line 253
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/SearchResultModel$Callback;->onLoadingError(Lcom/vk/music/model/SearchResultModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/SearchResultModel$Callback;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/model/SearchResultModel$Callback;->onLoadingMoreError(Lcom/vk/music/model/SearchResultModel;Lme/grishka/appkit/api/ErrorResponse;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/SearchResultModel$Callback;

    .prologue
    .line 242
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/SearchResultModel$Callback;->onLoadingDone(Lcom/vk/music/model/SearchResultModel;)V

    return-void
.end method

.method synthetic lambda$success$1(Ljava/util/List;Ljava/util/List;Lcom/vk/music/model/SearchResultModel$Callback;)V
    .locals 1
    .param p1, "local"    # Ljava/util/List;
    .param p2, "global"    # Ljava/util/List;
    .param p3, "callback"    # Lcom/vk/music/model/SearchResultModel$Callback;

    .prologue
    .line 244
    iget-object v0, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-interface {p3, v0, p1, p2}, Lcom/vk/music/model/SearchResultModel$Callback;->onLoadingMoreDone(Lcom/vk/music/model/SearchResultModel;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 6
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
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 219
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3, v4}, Lcom/vk/music/model/SearchResultModelImpl;->access$002(Lcom/vk/music/model/SearchResultModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 220
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3}, Lcom/vk/music/model/SearchResultModelImpl;->access$100(Lcom/vk/music/model/SearchResultModelImpl;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 221
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3, v2}, Lcom/vk/music/model/SearchResultModelImpl;->access$102(Lcom/vk/music/model/SearchResultModelImpl;Z)Z

    .line 226
    :cond_0
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3, v4}, Lcom/vk/music/model/SearchResultModelImpl;->access$202(Lcom/vk/music/model/SearchResultModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 227
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3, v4}, Lcom/vk/music/model/SearchResultModelImpl;->access$302(Lcom/vk/music/model/SearchResultModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 228
    iget v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->val$offset:I

    if-nez v3, :cond_1

    .line 229
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3, p1}, Lcom/vk/music/model/SearchResultModelImpl;->access$402(Lcom/vk/music/model/SearchResultModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 230
    const/4 v1, 0x0

    .line 231
    .local v1, "local":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v0, 0x0

    .line 239
    .local v0, "global":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :goto_0
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v4

    const/16 v5, 0x64

    if-ge v4, v5, :cond_2

    :goto_1
    invoke-static {v3, v2}, Lcom/vk/music/model/SearchResultModelImpl;->access$602(Lcom/vk/music/model/SearchResultModelImpl;Z)Z

    .line 241
    iget v2, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->val$offset:I

    if-nez v2, :cond_3

    .line 242
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/SearchResultModelImpl$1;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/model/SearchResultModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 246
    :goto_2
    return-void

    .line 233
    .end local v0    # "global":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .end local v1    # "local":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_1
    iget-object v3, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {v3}, Lcom/vk/music/model/SearchResultModelImpl;->access$400(Lcom/vk/music/model/SearchResultModelImpl;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 234
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .restart local v1    # "local":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 236
    .restart local v0    # "global":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {p1, v1, v0}, Lcom/vk/music/model/SearchResultModelImpl;->access$500(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto :goto_0

    .line 239
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 244
    :cond_3
    iget-object v2, p0, Lcom/vk/music/model/SearchResultModelImpl$1;->this$0:Lcom/vk/music/model/SearchResultModelImpl;

    invoke-static {p0, v1, v0}, Lcom/vk/music/model/SearchResultModelImpl$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/SearchResultModelImpl$1;Ljava/util/List;Ljava/util/List;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/model/SearchResultModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 215
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/SearchResultModelImpl$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
