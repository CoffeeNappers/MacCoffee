.class public Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameHorHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;,
        Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;,
        Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private button:Landroid/view/View;

.field private recyclerView:Landroid/support/v7/widget/RecyclerView;

.field private textView:Landroid/widget/TextView;

.field private final visitSource:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 76
    const v1, 0x7f030036

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 77
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->visitSource:Ljava/lang/String;

    .line 79
    const v1, 0x7f1001c0

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->textView:Landroid/widget/TextView;

    .line 80
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v2, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 81
    .local v0, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    const v1, 0x7f1001c2

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 82
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 83
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 84
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->itemView:Landroid/view/View;

    const v2, -0x141210

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 85
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;Landroid/support/v7/widget/LinearLayoutManager;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 97
    const v1, 0x7f1001c1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->button:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    const v1, 0x7f1001bf

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->$(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;)V
    .locals 3
    .param p1, "data"    # Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    .prologue
    .line 103
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-static {v0, p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->access$002(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;Lcom/vkontakte/android/ui/holder/RecyclerHolder;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->textView:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->titleRes:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->button:Landroid/view/View;

    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->getItemCount()I

    move-result v0

    const/4 v2, 0x3

    if-le v0, v2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 107
    return-void

    .line 106
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 35
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 114
    const-class v1, Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    iget-object v2, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->titleRes:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->visitSource:Ljava/lang/String;

    invoke-static {v2, v0, v3}, Lcom/vkontakte/android/fragments/GamesListFragment;->createArgs(Lcom/vkontakte/android/data/CatalogInfo;ILjava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 116
    :cond_0
    return-void
.end method
