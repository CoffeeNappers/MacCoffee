.class Lme/grishka/appkit/views/UsableRecyclerView$2;
.super Ljava/lang/Object;
.source "UsableRecyclerView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/grishka/appkit/views/UsableRecyclerView;->init()V
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
    .line 124
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 127
    add-int v0, p2, p3

    add-int/lit8 v1, p4, -0x1

    if-lt v0, v1, :cond_0

    if-eqz p3, :cond_0

    if-eqz p4, :cond_0

    .line 128
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    invoke-interface {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Listener;->onScrolledToLastItem()V

    .line 132
    :cond_0
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    instance-of v0, v0, Lme/grishka/appkit/views/UsableRecyclerView$ExtendedListener;

    if-eqz v0, :cond_1

    .line 133
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView$ExtendedListener;

    invoke-interface {v0, p2, p3, p4}, Lme/grishka/appkit/views/UsableRecyclerView$ExtendedListener;->onScroll(III)V

    .line 135
    :cond_1
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 139
    if-eqz p2, :cond_0

    .line 140
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$2;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v0, v0, Lme/grishka/appkit/views/UsableRecyclerView;->listener:Lme/grishka/appkit/views/UsableRecyclerView$Listener;

    invoke-interface {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Listener;->onScrollStarted()V

    .line 144
    :cond_0
    return-void
.end method
