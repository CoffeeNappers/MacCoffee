.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftSendFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "AddHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V
    .locals 5
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 644
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .line 645
    const v0, 0x7f0300b1

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 646
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v2, 0x7f02015e

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0xae7e48

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 647
    return-void
.end method


# virtual methods
.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 642
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->onBind(Ljava/lang/Void;)V

    return-void
.end method

.method public onBind(Ljava/lang/Void;)V
    .locals 2
    .param p1, "item"    # Ljava/lang/Void;

    .prologue
    .line 651
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mAddVisibility:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 652
    return-void

    .line 651
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public onClick()V
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->addRecipient()V

    .line 658
    return-void
.end method
