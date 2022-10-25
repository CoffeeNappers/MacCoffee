.class Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;
.super Ljava/lang/Object;
.source "MusicSearchResultsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->load(II)V
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
.field final synthetic this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

.field final synthetic val$audioCount:I

.field final synthetic val$audioOffset:I


# direct methods
.method constructor <init>(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iput p2, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioOffset:I

    iput p3, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->access$002(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 161
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    .line 163
    const-string/jumbo v0, "vk"

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    iget v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioOffset:I

    if-nez v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1$$Lambda$3;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;)Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->access$100(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V

    .line 169
    :goto_0
    return-void

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1$$Lambda$4;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;)Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->access$100(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$2(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;->onSearchResultsLoadingError(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$fail$3(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->reason:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;->onSearchResultsLoadingMoreError(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-interface {p1, v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;->onSearchResultsLoadingDone(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vk/music/dto/MusicSearchResult;Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;)V
    .locals 1
    .param p1, "searchResult"    # Lcom/vk/music/dto/MusicSearchResult;
    .param p2, "callback"    # Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-interface {p2, v0, p1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Callback;->onSearchResultsLoadingMoreDone(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/dto/MusicSearchResult;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 5
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
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 137
    iget-object v3, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->access$002(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 139
    new-instance v0, Lcom/vk/music/dto/MusicSearchResult;

    invoke-direct {v0, p1}, Lcom/vk/music/dto/MusicSearchResult;-><init>(Ljava/util/List;)V

    .line 140
    .local v0, "searchResult":Lcom/vk/music/dto/MusicSearchResult;
    iget v3, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioOffset:I

    if-nez v3, :cond_1

    .line 141
    iget-object v3, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    :goto_0
    iput-boolean v1, v3, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    .line 142
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget v2, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioCount:I

    iput v2, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    .line 143
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iput-object v0, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->musicSearchResult:Lcom/vk/music/dto/MusicSearchResult;

    .line 145
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-static {p0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;)Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->access$100(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V

    .line 155
    :goto_1
    return-void

    :cond_0
    move v1, v2

    .line 141
    goto :goto_0

    .line 147
    :cond_1
    iget-object v3, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    :goto_2
    iput-boolean v1, v3, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    .line 148
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-boolean v1, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->canLoadMore:Z

    if-eqz v1, :cond_2

    .line 149
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget v2, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioOffset:I

    iget v3, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->val$audioCount:I

    add-int/2addr v2, v3

    iput v2, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->offset:I

    .line 150
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    iget-object v1, v1, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->musicSearchResult:Lcom/vk/music/dto/MusicSearchResult;

    invoke-virtual {v1, v0}, Lcom/vk/music/dto/MusicSearchResult;->fill(Lcom/vk/music/dto/MusicSearchResult;)V

    .line 153
    :cond_2
    iget-object v1, p0, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->this$0:Lcom/vk/music/attach/loader/MusicSearchResultsLoader;

    invoke-static {p0, v0}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;Lcom/vk/music/dto/MusicSearchResult;)Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader;->access$100(Lcom/vk/music/attach/loader/MusicSearchResultsLoader;Lcom/vk/music/attach/loader/MusicSearchResultsLoader$Notification;)V

    goto :goto_1

    :cond_3
    move v1, v2

    .line 147
    goto :goto_2
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 133
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/attach/loader/MusicSearchResultsLoader$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
