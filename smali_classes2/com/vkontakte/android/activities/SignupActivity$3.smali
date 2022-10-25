.class Lcom/vkontakte/android/activities/SignupActivity$3;
.super Ljava/lang/Object;
.source "SignupActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/SignupActivity;->verify(Lcom/vkontakte/android/api/auth/AuthConfirm;)V
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/SignupActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 361
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 368
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 369
    .local v0, "errorCode":I
    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 382
    :goto_0
    return-void

    .line 372
    :cond_0
    const/16 v1, 0x456

    if-ne v0, v1, :cond_1

    .line 373
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f08069a

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 374
    :cond_1
    const/16 v1, 0x457

    if-ne v0, v1, :cond_2

    .line 375
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const/4 v2, 0x3

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$300(Lcom/vkontakte/android/activities/SignupActivity;I)V

    .line 376
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$600(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$602(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 377
    :cond_2
    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 378
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0801f6

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 380
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$3;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/SignupActivity;->access$400(Lcom/vkontakte/android/activities/SignupActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "uid"    # Ljava/lang/Integer;

    .prologue
    .line 364
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 361
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/SignupActivity$3;->success(Ljava/lang/Integer;)V

    return-void
.end method
