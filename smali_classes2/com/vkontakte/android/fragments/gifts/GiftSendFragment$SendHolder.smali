.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftSendFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SendHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 710
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .line 711
    const v0, 0x7f0300b2

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 712
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 713
    return-void
.end method


# virtual methods
.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 708
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->onBind(Ljava/lang/Void;)V

    return-void
.end method

.method public onBind(Ljava/lang/Void;)V
    .locals 2
    .param p1, "item"    # Ljava/lang/Void;

    .prologue
    .line 717
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->itemView:Landroid/view/View;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendEnabled:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 718
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mSendText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 719
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 723
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->sendGift()V

    .line 724
    return-void
.end method
