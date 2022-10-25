.class Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "MoneyTransfersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "arg"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$000(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    const/4 v0, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 100
    :cond_1
    :goto_1
    return-void

    .line 80
    :sswitch_0
    const-string/jumbo v5, "com.vkontakte.android.ACTION_MONEY_TRANSFER_SENT"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v0, v1

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "com.vkontakte.android.ACTION_MONEY_TRANSFER_ACCEPTED"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v0, v2

    goto :goto_0

    :sswitch_2
    const-string/jumbo v5, "com.vkontakte.android.ACTION_MONEY_TRANSFER_CANCELLED"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v0, v3

    goto :goto_0

    .line 82
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$100(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V

    goto :goto_1

    .line 86
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    const-string/jumbo v3, "transfer_id"

    invoke-virtual {p2, v3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$200(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;II)V

    goto :goto_1

    .line 93
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    const-string/jumbo v2, "transfer_id"

    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1, v3}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$200(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;II)V

    goto :goto_1

    .line 80
    :sswitch_data_0
    .sparse-switch
        -0x599325ae -> :sswitch_1
        -0x4f92e03d -> :sswitch_0
        -0x3e2ebc1a -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
