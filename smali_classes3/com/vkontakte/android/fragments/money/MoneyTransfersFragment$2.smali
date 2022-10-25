.class Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;
.super Ljava/lang/Object;
.source "MoneyTransfersFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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
    .line 177
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$300(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$300(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)I

    move-result v1

    const/4 v2, 0x0

    const-string/jumbo v3, ""

    const-string/jumbo v4, ""

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->start(Landroid/app/Activity;ILcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :goto_0
    return-void

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->startUserPicker()V

    goto :goto_0
.end method
