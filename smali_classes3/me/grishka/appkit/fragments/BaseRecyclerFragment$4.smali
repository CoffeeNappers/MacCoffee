.class Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;
.super Ljava/lang/Object;
.source "BaseRecyclerFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/fragments/BaseRecyclerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;


# direct methods
.method constructor <init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    .prologue
    .line 230
    .local p0, "this":Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;"
    iput-object p1, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 233
    .local p0, "this":Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;"
    iget-object v1, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    iget-object v0, v1, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 234
    .local v0, "list":Landroid/support/v7/widget/RecyclerView;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 235
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->isComputingLayout()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 236
    iget-object v1, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    invoke-static {v1}, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->access$000(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 237
    iget-object v1, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$4;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    invoke-static {v1}, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->access$000(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 242
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    goto :goto_0
.end method
