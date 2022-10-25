.class Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;
.super Ljava/lang/Object;
.source "ActionsBottomSheet.java"

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Binder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/fragment/menu/ActionsBottomSheet;->onCreateActionAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/music/view/adapter/ItemViewHolder$Binder",
        "<",
        "Lcom/vk/music/fragment/menu/Action;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/fragment/menu/ActionsBottomSheet;

.field final synthetic val$lastActionPosition:I


# direct methods
.method constructor <init>(Lcom/vk/music/fragment/menu/ActionsBottomSheet;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/fragment/menu/ActionsBottomSheet;

    .prologue
    .line 119
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;"
    iput-object p1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;->this$0:Lcom/vk/music/fragment/menu/ActionsBottomSheet;

    iput p2, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;->val$lastActionPosition:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vk/music/fragment/menu/Action;I)V
    .locals 5
    .param p1, "refs"    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actionInfo"    # Lcom/vk/music/fragment/menu/Action;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "position"    # I

    .prologue
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;"
    const/16 v4, 0x8

    .line 129
    invoke-virtual {p1}, Lcom/vk/music/view/adapter/ViewRefs;->next()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 130
    .local v0, "label":Landroid/widget/TextView;
    iget v2, p2, Lcom/vk/music/fragment/menu/Action;->iconRes:I

    const v3, 0x7f0f0086

    invoke-static {v0, v2, v3}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 131
    invoke-virtual {p2}, Lcom/vk/music/fragment/menu/Action;->hasTitle()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 132
    iget v2, p2, Lcom/vk/music/fragment/menu/Action;->stringRes:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 136
    :goto_0
    iget v2, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;->val$lastActionPosition:I

    if-ne p3, v2, :cond_2

    .line 137
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 138
    .local v1, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    .line 139
    invoke-virtual {v0}, Landroid/widget/TextView;->requestLayout()V

    .line 145
    .end local v1    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_0
    :goto_1
    return-void

    .line 134
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 140
    :cond_2
    if-nez p3, :cond_0

    .line 141
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 142
    .restart local v1    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    .line 143
    invoke-virtual {v0}, Landroid/widget/TextView;->requestLayout()V

    goto :goto_1
.end method

.method public bridge synthetic onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 119
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;"
    check-cast p2, Lcom/vk/music/fragment/menu/Action;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;->onBind(Lcom/vk/music/view/adapter/ViewRefs;Lcom/vk/music/fragment/menu/Action;I)V

    return-void
.end method

.method public onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .locals 1
    .param p1, "itemView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;"
    new-instance v0, Lcom/vk/music/view/adapter/ViewRefs;

    invoke-direct {v0}, Lcom/vk/music/view/adapter/ViewRefs;-><init>()V

    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ViewRefs;->put(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;

    move-result-object v0

    return-object v0
.end method
