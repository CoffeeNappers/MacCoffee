.class final Lcom/vkontakte/android/data/Groups$2;
.super Ljava/lang/Object;
.source "Groups.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Groups;->lambda$getGroups$0(Lcom/vkontakte/android/data/Groups$GetGroupsCallback;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$err:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .prologue
    .line 196
    iput-object p1, p0, Lcom/vkontakte/android/data/Groups$2;->val$err:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 208
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 209
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/cache/GroupsCache;->get()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 210
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 211
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/data/Groups$2;->val$err:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 213
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 196
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Groups$2;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 2
    .param p1, "list"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 199
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 200
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 201
    invoke-static {p1}, Lcom/vkontakte/android/cache/GroupsCache;->replace(Ljava/util/List;)V

    .line 202
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 203
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 204
    return-void
.end method
