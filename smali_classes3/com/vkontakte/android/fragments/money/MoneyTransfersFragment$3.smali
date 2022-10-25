.class Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$3;
.super Ljava/lang/Object;
.source "MoneyTransfersFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/DividerItemDecoration$Provider;


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
    .line 204
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public needDrawDividerAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 207
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$400(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    const/4 v0, 0x0

    .line 210
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
