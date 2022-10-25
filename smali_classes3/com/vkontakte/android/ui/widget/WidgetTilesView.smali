.class public Lcom/vkontakte/android/ui/widget/WidgetTilesView;
.super Lcom/vkontakte/android/ui/widget/WidgetItemsView;
.source "WidgetTilesView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/widget/WidgetItemsView",
        "<",
        "Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;",
        ">;"
    }
.end annotation


# instance fields
.field private final viewHost:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetTilesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
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
    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetTilesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v4, 0x0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-virtual {p0, v4, v4, v4, v2}, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->setPadding(IIII)V

    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090027

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    sget v3, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->padding:I

    sub-int v0, v2, v3

    .line 34
    .local v0, "padding":I
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->viewHost:Landroid/widget/LinearLayout;

    .line 35
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->viewHost:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 36
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->viewHost:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v4, v0, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 37
    new-instance v1, Landroid/widget/HorizontalScrollView;

    invoke-direct {v1, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 38
    .local v1, "scrollView":Landroid/widget/HorizontalScrollView;
    invoke-virtual {v1, v4}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 39
    invoke-virtual {v1, v4}, Landroid/widget/HorizontalScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 40
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->viewHost:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 41
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->addView(Landroid/view/View;)V

    .line 42
    return-void
.end method

.method private bind(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTiles$Item;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTiles$Item;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-super {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->bind(I)V

    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 66
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->bind(Lcom/vkontakte/android/api/widget/WidgetTiles$Item;)V

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 68
    :cond_0
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 1
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 57
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 58
    instance-of v0, p1, Lcom/vkontakte/android/api/widget/WidgetTiles;

    if-eqz v0, :cond_0

    .line 59
    check-cast p1, Lcom/vkontakte/android/api/widget/WidgetTiles;

    .end local p1    # "widget":Lcom/vkontakte/android/api/widget/Widget;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetTiles;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->bind(Ljava/util/List;)V

    .line 61
    :cond_0
    return-void
.end method

.method protected bridge synthetic createItemView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->createItemView(Landroid/content/Context;)Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    move-result-object v0

    return-object v0
.end method

.method protected createItemView(Landroid/content/Context;)Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected getViewHost()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesView;->viewHost:Landroid/widget/LinearLayout;

    return-object v0
.end method
