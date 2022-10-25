.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftSendFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "MessageHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Landroid/text/TextWatcher;"
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
    .line 663
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .line 664
    const v0, 0x7f0300b5

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 665
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 666
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 685
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iput-object p1, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mMessage:Ljava/lang/CharSequence;

    .line 686
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->updateFinishOnTouchOutside()V

    .line 687
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 676
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 661
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;->onBind(Ljava/lang/Void;)V

    return-void
.end method

.method public onBind(Ljava/lang/Void;)V
    .locals 0
    .param p1, "item"    # Ljava/lang/Void;

    .prologue
    .line 671
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 681
    return-void
.end method
