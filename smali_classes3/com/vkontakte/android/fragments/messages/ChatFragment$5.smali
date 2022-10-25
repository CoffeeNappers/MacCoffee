.class Lcom/vkontakte/android/fragments/messages/ChatFragment$5;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field scrollState:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1051
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 1052
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->scrollState:I

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 0
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 1056
    iput p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->scrollState:I

    .line 1057
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 1061
    if-gez p3, :cond_0

    iget v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->scrollState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 1062
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 1064
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1065
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v2

    if-nez v2, :cond_2

    const/4 v1, 0x0

    .line 1066
    .local v1, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    :goto_0
    instance-of v2, v1, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v2, :cond_1

    .line 1067
    check-cast v1, Landroid/support/v7/widget/LinearLayoutManager;

    .end local v1    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v1}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    .line 1068
    .local v0, "lastPosition":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    if-lt v0, v2, :cond_1

    .line 1069
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 1073
    .end local v0    # "lastPosition":I
    :cond_1
    return-void

    .line 1065
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    goto :goto_0
.end method
