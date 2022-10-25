.class public abstract Lcom/vkontakte/android/ui/widget/WidgetItemsView;
.super Lcom/vkontakte/android/ui/widget/WidgetTitleView;
.source "WidgetItemsView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lcom/vkontakte/android/ui/widget/WidgetTitleView;"
    }
.end annotation


# instance fields
.field protected final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    .local p0, "this":Lcom/vkontakte/android/ui/widget/WidgetItemsView;, "Lcom/vkontakte/android/ui/widget/WidgetItemsView<TV;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;)V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    .line 19
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
    .line 22
    .local p0, "this":Lcom/vkontakte/android/ui/widget/WidgetItemsView;, "Lcom/vkontakte/android/ui/widget/WidgetItemsView<TV;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 26
    .local p0, "this":Lcom/vkontakte/android/ui/widget/WidgetItemsView;, "Lcom/vkontakte/android/ui/widget/WidgetItemsView<TV;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    .line 27
    return-void
.end method


# virtual methods
.method protected bind(I)V
    .locals 3
    .param p1, "itemsCount"    # I

    .prologue
    .line 34
    .local p0, "this":Lcom/vkontakte/android/ui/widget/WidgetItemsView;, "Lcom/vkontakte/android/ui/widget/WidgetItemsView<TV;>;"
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq p1, v1, :cond_1

    .line 35
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le p1, v1, :cond_0

    .line 36
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->createItemView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    .line 37
    .local v0, "view":Landroid/view/View;, "TV;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->getViewHost()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 40
    .end local v0    # "view":Landroid/view/View;, "TV;"
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 41
    .restart local v0    # "view":Landroid/view/View;, "TV;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->getViewHost()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_0

    .line 45
    .end local v0    # "view":Landroid/view/View;, "TV;"
    :cond_1
    return-void
.end method

.method protected abstract createItemView(Landroid/content/Context;)Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")TV;"
        }
    .end annotation
.end method

.method protected getViewHost()Landroid/view/ViewGroup;
    .locals 0

    .prologue
    .line 30
    .local p0, "this":Lcom/vkontakte/android/ui/widget/WidgetItemsView;, "Lcom/vkontakte/android/ui/widget/WidgetItemsView<TV;>;"
    return-object p0
.end method
