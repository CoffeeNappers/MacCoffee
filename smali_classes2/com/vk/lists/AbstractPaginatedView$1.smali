.class Lcom/vk/lists/AbstractPaginatedView$1;
.super Ljava/lang/Object;
.source "AbstractPaginatedView.java"

# interfaces
.implements Lcom/vk/lists/PaginateHelper$UIControl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/AbstractPaginatedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/AbstractPaginatedView;


# direct methods
.method constructor <init>(Lcom/vk/lists/AbstractPaginatedView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/AbstractPaginatedView;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clearSwipeRefreshing()V
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->clearSwipeRefreshing()V

    .line 206
    return-void
.end method

.method public showBigError()V
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->showError()V

    .line 186
    return-void
.end method

.method public showBigLoading()V
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->showBigLoading()V

    .line 176
    return-void
.end method

.method public showNoItems()V
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->showEmpty()V

    .line 201
    return-void
.end method

.method public showRecycler()V
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->showList()V

    .line 196
    return-void
.end method

.method public showSmallError()V
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->showFooterError()V

    .line 191
    return-void
.end method

.method public showSmallLoading()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vk/lists/AbstractPaginatedView$1;->this$0:Lcom/vk/lists/AbstractPaginatedView;

    invoke-virtual {v0}, Lcom/vk/lists/AbstractPaginatedView;->showFooterLoading()V

    .line 181
    return-void
.end method
