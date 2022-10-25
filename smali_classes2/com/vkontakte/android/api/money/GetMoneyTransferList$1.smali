.class Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;
.super Lcom/vkontakte/android/data/Parser;
.source "GetMoneyTransferList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/money/GetMoneyTransferList;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/money/GetMoneyTransferList;

.field final synthetic val$profiles:Landroid/util/SparseArray;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/money/GetMoneyTransferList;Landroid/util/SparseArray;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/money/GetMoneyTransferList;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;->this$0:Lcom/vkontakte/android/api/money/GetMoneyTransferList;

    iput-object p2, p0, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;->val$profiles:Landroid/util/SparseArray;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/MoneyTransfer;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Lcom/vkontakte/android/MoneyTransfer;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/MoneyTransfer;-><init>(Lorg/json/JSONObject;)V

    .line 88
    .local v0, "mt":Lcom/vkontakte/android/MoneyTransfer;
    iget-object v1, p0, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;->val$profiles:Landroid/util/SparseArray;

    iget v2, v0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iput-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 89
    iget-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    if-nez v1, :cond_0

    .line 90
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 93
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;->val$profiles:Landroid/util/SparseArray;

    iget v2, v0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iput-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 94
    iget-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    if-nez v1, :cond_1

    .line 95
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v1, v0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 97
    :cond_1
    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/money/GetMoneyTransferList$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v0

    return-object v0
.end method
