.class Lcom/vk/sharing/view/SharingView$2;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "SharingView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/view/SharingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/view/SharingView;

.field final synthetic val$targetsLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;


# direct methods
.method constructor <init>(Lcom/vk/sharing/view/SharingView;Landroid/support/v7/widget/LinearLayoutManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 293
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$2;->this$0:Lcom/vk/sharing/view/SharingView;

    iput-object p2, p0, Lcom/vk/sharing/view/SharingView$2;->val$targetsLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 296
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$2;->val$targetsLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    iget-object v1, p0, Lcom/vk/sharing/view/SharingView$2;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-static {v1}, Lcom/vk/sharing/view/SharingView;->access$100(Lcom/vk/sharing/view/SharingView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    .line 297
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$2;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$2;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onListScrolledToTheEnd()V

    .line 301
    :cond_0
    return-void
.end method
