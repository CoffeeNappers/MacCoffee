.class Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    const-string/jumbo v1, "balance"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mBalance:I

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    const-string/jumbo v1, "payment_required"

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mPaymentRequired:Z

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mPaymentRequired:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mActive:Z

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iput-boolean v3, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mPaymentRequired:Z

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->sendGift()V

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->invalidateBalance()V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->access$000(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->access$100(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 128
    :cond_1
    return-void
.end method
