.class Lcom/vkontakte/android/fragments/AuthCheckFragment$2;
.super Ljava/lang/Object;
.source "AuthCheckFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/AuthCheckFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AuthCheckFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    const v2, 0x7f0806a5

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$300(Lcom/vkontakte/android/fragments/AuthCheckFragment;Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 191
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    const v2, 0x7f0806a5

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$300(Lcom/vkontakte/android/fragments/AuthCheckFragment;Ljava/lang/String;)V

    .line 194
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 188
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;->success(Ljava/lang/Boolean;)V

    return-void
.end method
