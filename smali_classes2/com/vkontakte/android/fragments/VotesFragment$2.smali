.class Lcom/vkontakte/android/fragments/VotesFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "VotesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/VotesFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/VotesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/VotesFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/VotesFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VotesFragment$2;->this$0:Lcom/vkontakte/android/fragments/VotesFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 136
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/4 v1, -0x2

    if-ne v0, v1, :cond_0

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VotesFragment$2;->this$0:Lcom/vkontakte/android/fragments/VotesFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/VotesFragment;->access$400(Lcom/vkontakte/android/fragments/VotesFragment;)V

    .line 141
    :goto_0
    return-void

    .line 139
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VotesFragment$2;->this$0:Lcom/vkontakte/android/fragments/VotesFragment;

    iget v1, p1, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;->balance:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/VotesFragment;->access$002(Lcom/vkontakte/android/fragments/VotesFragment;I)I

    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VotesFragment$2;->this$0:Lcom/vkontakte/android/fragments/VotesFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;->products:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/VotesFragment;->onDataLoaded(Ljava/util/List;)V

    .line 132
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 127
    check-cast p1, Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/VotesFragment$2;->success(Lcom/vkontakte/android/api/store/GetGiftsStockBalance$Result;)V

    return-void
.end method
