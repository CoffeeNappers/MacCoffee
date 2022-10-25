.class public Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "DocumentsTabbedHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;,
        Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex",
        "<",
        "Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;",
        ">;>;"
    }
.end annotation


# instance fields
.field private viewPager:Lcom/vkontakte/android/ui/widget/SubPagerOfList;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 76
    const v0, 0x7f030035

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 77
    const v0, 0x7f10018c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/SubPagerOfList;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->viewPager:Lcom/vkontakte/android/ui/widget/SubPagerOfList;

    .line 78
    return-void
.end method


# virtual methods
.method synthetic lambda$onBind$0(Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)V
    .locals 3
    .param p1, "data"    # Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->getParent()Landroid/view/ViewGroup;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget v1, p1, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->index:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    return-void
.end method

.method public onBind(Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex",
            "<",
            "Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "data":Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;, "Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex<Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v0, "baseAdapters":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/widget/SubPagerOfListItem$SubPagerOfListAdapter;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    .line 84
    .local v1, "type":Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;->getDocsAdapter(Landroid/content/Context;)Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 87
    .end local v1    # "type":Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->viewPager:Lcom/vkontakte/android/ui/widget/SubPagerOfList;

    const v3, 0x7f0900e1

    const/4 v4, 0x0

    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)Lcom/vkontakte/android/ui/widget/SubPagerOfList$IScrollToPageView;

    move-result-object v5

    invoke-virtual {v2, v0, v3, v4, v5}, Lcom/vkontakte/android/ui/widget/SubPagerOfList;->setData(Ljava/util/List;ILandroid/graphics/drawable/Drawable;Lcom/vkontakte/android/ui/widget/SubPagerOfList$IScrollToPageView;)V

    .line 89
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    check-cast p1, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->onBind(Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;)V

    return-void
.end method
