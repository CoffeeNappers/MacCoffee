.class Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "CreateTransferFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$100(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)I

    move-result v1

    neg-int v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    .line 117
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    if-eqz v0, :cond_0

    .line 118
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/api/Group;)V

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$000(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 120
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Group;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/api/Group;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$000(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 111
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 107
    check-cast p1, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;->success(Lcom/vkontakte/android/api/Group;)V

    return-void
.end method
