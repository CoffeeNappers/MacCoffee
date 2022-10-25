.class Lcom/vkontakte/android/fragments/PhotosFragment$1;
.super Ljava/lang/Object;
.source "PhotosFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PhotosFragment;->onAttach(Landroid/app/Activity;)V
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
        "Lcom/vkontakte/android/Photo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

.field final synthetic val$tabs:Ljava/util/ArrayList;

.field final synthetic val$titles:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PhotosFragment;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PhotosFragment;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1;->val$tabs:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1;->val$titles:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 160
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 136
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Photo;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v0

    if-lez v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PhotosFragment;->access$000(Lcom/vkontakte/android/fragments/PhotosFragment;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;-><init>(Lcom/vkontakte/android/fragments/PhotosFragment$1;)V

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V

    .line 155
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 133
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PhotosFragment$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
