.class Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$4;
.super Lcom/vkontakte/android/api/SimpleListCallback;
.source "MoneyTransfersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleListCallback",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 251
    .local p2, "fragment":Lme/grishka/appkit/fragments/BaseRecyclerFragment;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment<Lcom/vkontakte/android/MoneyTransfer;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$4;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/MoneyTransfer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 254
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/MoneyTransfer;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleListCallback;->success(Lcom/vkontakte/android/data/VKList;)V

    .line 255
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 251
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$4;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
