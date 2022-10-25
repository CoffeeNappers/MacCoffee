.class Lme/grishka/appkit/views/UsableRecyclerView$1;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "UsableRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/views/UsableRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/grishka/appkit/views/UsableRecyclerView;


# direct methods
.method constructor <init>(Lme/grishka/appkit/views/UsableRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lme/grishka/appkit/views/UsableRecyclerView;

    .prologue
    .line 53
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 3

    .prologue
    .line 56
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lme/grishka/appkit/preloading/ListPreloader;->update(II)V

    .line 57
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$200(Lme/grishka/appkit/views/UsableRecyclerView;)V

    .line 58
    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 74
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lme/grishka/appkit/preloading/ListPreloader;->update(II)V

    .line 75
    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I
    .param p3, "payload"    # Ljava/lang/Object;

    .prologue
    .line 84
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lme/grishka/appkit/preloading/ListPreloader;->update(II)V

    .line 85
    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 62
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lme/grishka/appkit/preloading/ListPreloader;->update(II)V

    .line 63
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$200(Lme/grishka/appkit/views/UsableRecyclerView;)V

    .line 64
    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 3
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lme/grishka/appkit/preloading/ListPreloader;->update(II)V

    .line 80
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$100(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/preloading/ListPreloader;

    move-result-object v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v1

    iget-object v2, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->access$000(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/RecyclerViewDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lme/grishka/appkit/views/RecyclerViewDelegate;->getVisibleItemCount()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lme/grishka/appkit/preloading/ListPreloader;->update(II)V

    .line 69
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$1;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$200(Lme/grishka/appkit/views/UsableRecyclerView;)V

    .line 70
    return-void
.end method
