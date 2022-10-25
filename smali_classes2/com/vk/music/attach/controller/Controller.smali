.class public abstract Lcom/vk/music/attach/controller/Controller;
.super Landroid/support/v4/app/Fragment;
.source "Controller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/attach/controller/Controller$HostController;
    }
.end annotation


# static fields
.field private static final KEY_RECYCLER_STATE:Ljava/lang/String; = "Controller.key.recyclerState"


# instance fields
.field private hostController:Lcom/vk/music/attach/controller/Controller$HostController;

.field private recyclerState:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected final getHostController()Lcom/vk/music/attach/controller/Controller$HostController;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    return-object v0
.end method

.method synthetic lambda$onResume$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->onLeftButtonClicked()V

    return-void
.end method

.method synthetic lambda$onResume$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->onRightButtonClicked()V

    return-void
.end method

.method protected final moveBack()V
    .locals 1

    .prologue
    .line 205
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->moveBack()V

    .line 206
    return-void
.end method

.method protected final moveNext(Ljava/lang/Class;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/controller/Controller;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, "toClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/controller/Controller;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/music/attach/controller/Controller;->moveNext(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 202
    return-void
.end method

.method protected final moveNext(Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/attach/controller/Controller;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 197
    .local p1, "toClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/music/attach/controller/Controller;>;"
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lcom/vk/music/attach/controller/Controller$HostController;->moveNext(Lcom/vk/music/attach/controller/Controller;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 198
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 123
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 124
    check-cast p1, Lcom/vk/music/attach/controller/Controller$HostController;

    .end local p1    # "context":Landroid/content/Context;
    iput-object p1, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    .line 125
    return-void
.end method

.method public onBackClicked()Z
    .locals 1

    .prologue
    .line 179
    const/4 v0, 0x0

    return v0
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p0, p3}, Lcom/vk/music/attach/controller/Controller;->onViewAttached(Landroid/os/Bundle;)V

    .line 155
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    if-eqz p3, :cond_0

    .line 156
    const-string/jumbo v0, "Controller.key.recyclerState"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    if-eqz v0, :cond_1

    .line 159
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->restoreRecyclerState(Landroid/util/SparseArray;)V

    .line 161
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final onDestroyView()V
    .locals 2

    .prologue
    .line 166
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 167
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    .line 170
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->saveRecyclerState(Landroid/util/SparseArray;)V

    .line 171
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/Controller;->onViewDetached()V

    .line 172
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 129
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    .line 131
    return-void
.end method

.method protected onEndOfListReached()V
    .locals 0

    .prologue
    .line 188
    return-void
.end method

.method protected onLeftButtonClicked()V
    .locals 0

    .prologue
    .line 182
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 144
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 145
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 148
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setOnLastReachedListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 149
    return-void
.end method

.method protected onRefreshRequested()V
    .locals 0

    .prologue
    .line 186
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 135
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 136
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/music/attach/controller/Controller$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/controller/Controller;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/music/attach/controller/Controller$$Lambda$2;->lambdaFactory$(Lcom/vk/music/attach/controller/Controller;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-static {p0}, Lcom/vk/music/attach/controller/Controller$$Lambda$3;->lambdaFactory$(Lcom/vk/music/attach/controller/Controller;)Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 139
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->hostController:Lcom/vk/music/attach/controller/Controller$HostController;

    invoke-static {p0}, Lcom/vk/music/attach/controller/Controller$$Lambda$4;->lambdaFactory$(Lcom/vk/music/attach/controller/Controller;)Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setOnLastReachedListener(Lcom/vk/music/view/LastReachedScrollListener$OnLastReachedListener;)V

    .line 140
    return-void
.end method

.method protected onRightButtonClicked()V
    .locals 0

    .prologue
    .line 184
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 116
    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 117
    const-string/jumbo v0, "Controller.key.recyclerState"

    iget-object v1, p0, Lcom/vk/music/attach/controller/Controller;->recyclerState:Landroid/util/SparseArray;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 119
    :cond_0
    return-void
.end method

.method protected onViewAttached(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 174
    return-void
.end method

.method protected onViewDetached()V
    .locals 0

    .prologue
    .line 176
    return-void
.end method

.method public onVoiceSearchResult(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 190
    return-void
.end method
