.class Lcom/vkontakte/android/fragments/feedback/GroupedHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GroupedHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/Notification;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1Int",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x0

    .line 26
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 27
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->itemView:Landroid/view/View;

    check-cast v1, Landroid/widget/TextView;

    .line 28
    .local v1, "tv":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090062

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 29
    .local v0, "padding":I
    const/high16 v2, 0x41780000    # 15.5f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    add-int/2addr v2, v0

    const/high16 v3, 0x41580000    # 13.5f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    const/high16 v4, 0x41700000    # 15.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v1, v2, v3, v0, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 30
    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 31
    const v2, -0xb88b58

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    const/4 v2, 0x1

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 33
    const v2, 0x7f0203bf

    invoke-virtual {v1, v2, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 34
    const/high16 v2, 0x41f00000    # 30.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 35
    return-void
.end method


# virtual methods
.method public attach(Lcom/vkontakte/android/functions/VoidF1Int;)Lcom/vkontakte/android/fragments/feedback/GroupedHolder;
    .locals 0
    .param p1    # Lcom/vkontakte/android/functions/VoidF1Int;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1Int",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;)",
            "Lcom/vkontakte/android/fragments/feedback/GroupedHolder;"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "newsAction":Lcom/vkontakte/android/functions/VoidF1Int;, "Lcom/vkontakte/android/functions/VoidF1Int<Lcom/vkontakte/android/api/models/Notification;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    .line 45
    return-object p0
.end method

.method public onBind(Lcom/vkontakte/android/api/models/Notification;)V
    .locals 7
    .param p1, "e"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    .line 39
    iget-object v1, p1, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 40
    .local v0, "size":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->itemView:Landroid/view/View;

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d005a

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 21
    check-cast p1, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->onBind(Lcom/vkontakte/android/api/models/Notification;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->getAdapterPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/functions/VoidF1Int;->f(Ljava/lang/Object;I)V

    .line 53
    :cond_0
    return-void
.end method
