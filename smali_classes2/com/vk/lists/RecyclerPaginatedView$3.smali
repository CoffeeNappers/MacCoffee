.class Lcom/vk/lists/RecyclerPaginatedView$3;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "RecyclerPaginatedView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/RecyclerPaginatedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/RecyclerPaginatedView;


# direct methods
.method constructor <init>(Lcom/vk/lists/RecyclerPaginatedView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/RecyclerPaginatedView;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/vk/lists/RecyclerPaginatedView$3;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$3;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$3;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/lists/PaginatedRecyclerAdapter;->isFooterRow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$3;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$300(Lcom/vk/lists/RecyclerPaginatedView;)I

    move-result v0

    .line 217
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
