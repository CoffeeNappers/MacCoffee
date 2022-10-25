.class Lcom/vkontakte/android/data/Groups$1$1;
.super Ljava/lang/Object;
.source "Groups.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Groups$1;->run()V
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
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/data/Groups$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/Groups$1;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/data/Groups$1;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/data/Groups$1$1;->this$0:Lcom/vkontakte/android/data/Groups$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 64
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 65
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/cache/GroupsCache;->get()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 66
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 67
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 68
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 52
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Groups$1$1;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 2
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
    .line 55
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 56
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 57
    invoke-static {p1}, Lcom/vkontakte/android/cache/GroupsCache;->replace(Ljava/util/List;)V

    .line 58
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 59
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 60
    return-void
.end method
