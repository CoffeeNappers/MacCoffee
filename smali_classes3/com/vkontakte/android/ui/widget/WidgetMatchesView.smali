.class public Lcom/vkontakte/android/ui/widget/WidgetMatchesView;
.super Lcom/vkontakte/android/ui/widget/WidgetItemsView;
.source "WidgetMatchesView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/widget/WidgetItemsView",
        "<",
        "Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
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
    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
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

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    invoke-virtual {p0, v1, v1, v1, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->setPadding(IIII)V

    .line 27
    return-void
.end method

.method private bind(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/Match;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "matches":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/Match;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    invoke-super {p0, v6}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->bind(I)V

    .line 46
    const/4 v2, 0x0

    .line 47
    .local v2, "maxScoreWidth":I
    const/4 v3, 0x0

    .line 48
    .local v3, "showGameIcon":Z
    const/4 v4, 0x0

    .line 50
    .local v4, "showTeamIcons":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v0, v6, :cond_0

    .line 51
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/widget/Match;

    .line 52
    .local v1, "match":Lcom/vkontakte/android/api/widget/Match;
    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/Match;->hasIcon()Z

    move-result v6

    or-int/2addr v3, v6

    .line 53
    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/Match;->getTeamA()Lcom/vkontakte/android/api/widget/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/api/widget/Team;->hasImage()Z

    move-result v6

    or-int/2addr v4, v6

    .line 54
    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/Match;->getTeamB()Lcom/vkontakte/android/api/widget/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/api/widget/Team;->hasImage()Z

    move-result v6

    or-int/2addr v4, v6

    .line 56
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->items:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;

    .line 57
    .local v5, "view":Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;
    invoke-virtual {v5, v1}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->bind(Lcom/vkontakte/android/api/widget/Match;)V

    .line 58
    invoke-virtual {v5}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->measureScoreWidth()I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 50
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 60
    .end local v1    # "match":Lcom/vkontakte/android/api/widget/Match;
    .end local v5    # "view":Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;
    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->items:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v0, v6, :cond_2

    .line 61
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->items:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;

    .line 62
    .restart local v5    # "view":Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->items:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v0, v6, :cond_1

    const/4 v6, 0x1

    :goto_2
    invoke-virtual {v5, v6, v3, v4, v2}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->postBind(ZZZI)V

    .line 60
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 62
    :cond_1
    const/4 v6, 0x0

    goto :goto_2

    .line 64
    .end local v5    # "view":Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;
    :cond_2
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 1
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 37
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetItemsView;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 38
    instance-of v0, p1, Lcom/vkontakte/android/api/widget/WidgetMatches;

    if-eqz v0, :cond_0

    .line 39
    check-cast p1, Lcom/vkontakte/android/api/widget/WidgetMatches;

    .end local p1    # "widget":Lcom/vkontakte/android/api/widget/Widget;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetMatches;->getMatches()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->bind(Ljava/util/List;)V

    .line 41
    :cond_0
    return-void
.end method

.method protected bridge synthetic createItemView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;->createItemView(Landroid/content/Context;)Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;

    move-result-object v0

    return-object v0
.end method

.method protected createItemView(Landroid/content/Context;)Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 32
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
