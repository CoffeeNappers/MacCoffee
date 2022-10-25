.class Lcom/vk/lists/PaginateHelper$5;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/PaginateHelper;->bind(Lcom/vk/lists/PaginateHelper$PaginatedView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginateHelper;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$5;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$5;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$300(Lcom/vk/lists/PaginateHelper;)V

    .line 118
    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 1
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$5;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$300(Lcom/vk/lists/PaginateHelper;)V

    .line 128
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 1
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$5;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$300(Lcom/vk/lists/PaginateHelper;)V

    .line 123
    return-void
.end method
