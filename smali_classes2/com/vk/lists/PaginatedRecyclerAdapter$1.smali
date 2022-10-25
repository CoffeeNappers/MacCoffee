.class Lcom/vk/lists/PaginatedRecyclerAdapter$1;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "PaginatedRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginatedRecyclerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginatedRecyclerAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/PaginatedRecyclerAdapter;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyDataSetChanged()V

    .line 138
    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 1
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 142
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyItemRangeChanged(II)V

    .line 143
    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 1
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 147
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyItemRangeInserted(II)V

    .line 148
    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 1
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyDataSetChanged()V

    .line 158
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 1
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vk/lists/PaginatedRecyclerAdapter$1;->this$0:Lcom/vk/lists/PaginatedRecyclerAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/vk/lists/PaginatedRecyclerAdapter;->notifyItemRangeRemoved(II)V

    .line 153
    return-void
.end method
