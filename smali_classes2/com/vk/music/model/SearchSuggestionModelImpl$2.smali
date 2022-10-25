.class Lcom/vk/music/model/SearchSuggestionModelImpl$2;
.super Ljava/lang/Object;
.source "SearchSuggestionModelImpl.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHints(Ljava/lang/String;)V
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
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;


# direct methods
.method constructor <init>(Lcom/vk/music/model/SearchSuggestionModelImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/model/SearchSuggestionModelImpl;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/model/SearchSuggestionModelImpl;->access$202(Lcom/vk/music/model/SearchSuggestionModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 157
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    invoke-static {p0, p1}, Lcom/vk/music/model/SearchSuggestionModelImpl$2$$Lambda$2;->lambdaFactory$(Lcom/vk/music/model/SearchSuggestionModelImpl$2;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/SearchSuggestionModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 159
    return-void
.end method

.method synthetic lambda$fail$1(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;Lcom/vk/music/model/SearchSuggestionModel$Callback;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
    .param p2, "callback"    # Lcom/vk/music/model/SearchSuggestionModel$Callback;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/vk/music/model/SearchSuggestionModel$Callback;->onHintsLoadingError(Lcom/vk/music/model/SearchSuggestionModel;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$success$0(Lcom/vk/music/model/SearchSuggestionModel$Callback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vk/music/model/SearchSuggestionModel$Callback;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    invoke-interface {p1, v0}, Lcom/vk/music/model/SearchSuggestionModel$Callback;->onHintsLoadingDone(Lcom/vk/music/model/SearchSuggestionModel;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/model/SearchSuggestionModelImpl;->access$202(Lcom/vk/music/model/SearchSuggestionModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 150
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    invoke-static {v0, p1}, Lcom/vk/music/model/SearchSuggestionModelImpl;->access$302(Lcom/vk/music/model/SearchSuggestionModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 151
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->this$0:Lcom/vk/music/model/SearchSuggestionModelImpl;

    invoke-static {p0}, Lcom/vk/music/model/SearchSuggestionModelImpl$2$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/SearchSuggestionModelImpl$2;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/model/SearchSuggestionModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 152
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 146
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/music/model/SearchSuggestionModelImpl$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
