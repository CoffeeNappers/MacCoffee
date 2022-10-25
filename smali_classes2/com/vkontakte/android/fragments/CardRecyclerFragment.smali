.class public abstract Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "CardRecyclerFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final TABLET_MIN_WIDTH:I = 0x39c

.field public static final TABLET_PADDING:I = 0x39c


# instance fields
.field private decorator:Lcom/vkontakte/android/ui/CardItemDecorator;


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "perPage"    # I

    .prologue
    .line 23
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 24
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "layout"    # I
    .param p2, "perPage"    # I

    .prologue
    .line 27
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(II)V

    .line 28
    return-void
.end method


# virtual methods
.method protected isTabletDecorator()Z
    .locals 2

    .prologue
    .line 62
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    iget v0, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->scrW:I

    const/16 v1, 0x39c

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 32
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 33
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->updateConfiguration()V

    .line 34
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 45
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->updateConfiguration()V

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->updateDecorator()V

    .line 48
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/CardItemDecorator;
    .locals 7

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    const/4 v4, 0x0

    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->isTabletDecorator()Z

    move-result v1

    .line 67
    .local v1, "isTabletDecorator":Z
    new-instance v0, Lcom/vkontakte/android/ui/CardItemDecorator;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v1, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-direct {v0, v5, v3}, Lcom/vkontakte/android/ui/CardItemDecorator;-><init>(Landroid/support/v7/widget/RecyclerView;Z)V

    .line 68
    .local v0, "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v5, 0x40400000    # 3.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-virtual {v0, v3, v5, v6, v4}, Lcom/vkontakte/android/ui/CardItemDecorator;->setPadding(IIII)V

    .line 69
    if-eqz v1, :cond_1

    const/16 v3, 0x10

    iget v5, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->scrW:I

    add-int/lit16 v5, v5, -0x39c

    div-int/lit8 v5, v5, 0x2

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 70
    .local v2, "pad":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3, v2, v4, v2, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 71
    return-object v0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    .end local v2    # "pad":I
    :cond_0
    move v3, v4

    .line 67
    goto :goto_0

    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    :cond_1
    move v2, v4

    .line 69
    goto :goto_1
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 57
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroyView()V

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

    .line 59
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 38
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/high16 v1, 0x2000000

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setScrollBarStyle(I)V

    .line 40
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->updateDecorator()V

    .line 41
    return-void
.end method

.method protected updateDecorator()V
    .locals 2

    .prologue
    .line 51
    .local p0, "this":Lcom/vkontakte/android/fragments/CardRecyclerFragment;, "Lcom/vkontakte/android/fragments/CardRecyclerFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onCreateCardDecorator()Lcom/vkontakte/android/ui/CardItemDecorator;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->decorator:Lcom/vkontakte/android/ui/CardItemDecorator;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 53
    return-void
.end method
