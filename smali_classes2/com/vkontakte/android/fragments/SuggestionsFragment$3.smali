.class Lcom/vkontakte/android/fragments/SuggestionsFragment$3;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SuggestionsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestionsFragment;->onSubscribeClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

.field final synthetic val$needSubscribe:Z

.field final synthetic val$p:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFragment;Landroid/content/Context;Lcom/vkontakte/android/UserProfile;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestionsFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->val$p:Lcom/vkontakte/android/UserProfile;

    iput-boolean p4, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->val$needSubscribe:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 177
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->val$p:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->val$needSubscribe:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iput v0, v1, Lcom/vkontakte/android/UserProfile;->online:I

    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SuggestionsFragment;->access$100(Lcom/vkontakte/android/fragments/SuggestionsFragment;)Landroid/widget/BaseAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SuggestionsFragment;->access$100(Lcom/vkontakte/android/fragments/SuggestionsFragment;)Landroid/widget/BaseAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 181
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 182
    return-void

    .line 177
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 172
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->val$p:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->val$needSubscribe:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput v0, v1, Lcom/vkontakte/android/UserProfile;->online:I

    .line 173
    return-void

    .line 172
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 169
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SuggestionsFragment$3;->success(Ljava/lang/Integer;)V

    return-void
.end method
