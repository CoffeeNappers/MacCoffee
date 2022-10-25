.class public Lcom/vkontakte/android/ui/widget/WidgetCoverListView;
.super Lcom/vkontakte/android/ui/widget/WidgetItemsView;
.source "WidgetCoverListView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/widget/WidgetItemsView",
        "<",
        "Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    invoke-virtual {p0, v1, v1, v1, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListView;->setPadding(IIII)V

    .line 26
    return-void
.end method

.method private bind(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-super {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->bind(I)V

    .line 44
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 45
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListView;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

    if-lez v0, :cond_0

    const/4 v3, 0x1

    :goto_1
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->bind(Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;Z)V

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    .line 47
    :cond_1
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 1
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 37
    instance-of v0, p1, Lcom/vkontakte/android/api/widget/WidgetCoverList;

    if-eqz v0, :cond_0

    .line 38
    check-cast p1, Lcom/vkontakte/android/api/widget/WidgetCoverList;

    .end local p1    # "widget":Lcom/vkontakte/android/api/widget/Widget;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetCoverList;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListView;->bind(Ljava/util/List;)V

    .line 40
    :cond_0
    return-void
.end method

.method protected bridge synthetic createItemView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListView;->createItemView(Landroid/content/Context;)Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    move-result-object v0

    return-object v0
.end method

.method protected createItemView(Landroid/content/Context;)Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 31
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
