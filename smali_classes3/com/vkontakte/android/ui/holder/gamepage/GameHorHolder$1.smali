.class Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "GameHorHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;-><init>(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

.field final synthetic val$layoutManager:Landroid/support/v7/widget/LinearLayoutManager;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;Landroid/support/v7/widget/LinearLayoutManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->val$layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 88
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->val$layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    .line 89
    .local v2, "visibleCount":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->val$layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->getItemCount()I

    move-result v1

    .line 90
    .local v1, "totalItemCount":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->val$layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    .line 92
    .local v0, "firstVisibleItem":I
    add-int v3, v2, v0

    add-int/lit8 v4, v1, -0x3

    if-lt v3, v4, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getItem()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 93
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getItem()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    iget-object v4, v3, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->onNeedLoadNextPage:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;->getItem()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    iget v3, v3, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->index:I

    invoke-interface {v4, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;->onNeedLoadNextPage(I)V

    .line 95
    :cond_0
    return-void
.end method
