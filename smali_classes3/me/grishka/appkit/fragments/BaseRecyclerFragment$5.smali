.class Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;
.super Ljava/lang/Object;
.source "BaseRecyclerFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/grishka/appkit/fragments/BaseRecyclerFragment;->refresh()V
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
    .line 337
    .local p0, "this":Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;"
    iput-object p1, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 340
    .local p0, "this":Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;"
    iget-object v0, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    iget-object v0, v0, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    iget-object v0, v0, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->setRefreshing(Z)V

    .line 342
    iget-object v0, p0, Lme/grishka/appkit/fragments/BaseRecyclerFragment$5;->this$0:Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    iget-object v0, v0, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->setEnabled(Z)V

    .line 344
    :cond_0
    return-void
.end method
