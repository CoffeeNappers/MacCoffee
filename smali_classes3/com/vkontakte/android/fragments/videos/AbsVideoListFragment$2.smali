.class Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "AbsVideoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->doLoadData(II)V
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
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

.field final synthetic val$count:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Landroid/app/Fragment;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->val$count:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$success$0()V
    .locals 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$700(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$800(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 146
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/VideoFile;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$100(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v2

    add-int/2addr v0, v2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$200(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v0, v2

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v2

    if-ge v0, v2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, p1, v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$300(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Ljava/util/List;Z)V

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$400(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$500(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$600(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$400(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;)I

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->val$count:I

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->access$402(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;I)I

    .line 149
    return-void

    .line 140
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 137
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
