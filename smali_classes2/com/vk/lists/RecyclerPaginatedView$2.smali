.class Lcom/vk/lists/RecyclerPaginatedView$2;
.super Ljava/lang/Object;
.source "RecyclerPaginatedView.java"

# interfaces
.implements Lcom/vk/lists/PaginateHelper$DataInfoProvider;


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
    .line 199
    iput-object p1, p0, Lcom/vk/lists/RecyclerPaginatedView$2;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemsCount()I
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$2;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$2;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->getContentItemsCount()I

    move-result v0

    goto :goto_0
.end method

.method public isListEmpty()Z
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$2;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/lists/RecyclerPaginatedView$2;->this$0:Lcom/vk/lists/RecyclerPaginatedView;

    invoke-static {v0}, Lcom/vk/lists/RecyclerPaginatedView;->access$200(Lcom/vk/lists/RecyclerPaginatedView;)Lcom/vk/lists/PaginatedRecyclerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/lists/PaginatedRecyclerAdapter;->getContentItemsCount()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
