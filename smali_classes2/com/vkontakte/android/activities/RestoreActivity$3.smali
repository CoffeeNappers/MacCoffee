.class Lcom/vkontakte/android/activities/RestoreActivity$3;
.super Ljava/lang/Object;
.source "RestoreActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/RestoreActivity;->requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V
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
        "Landroid/util/Pair",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/RestoreActivity;

.field final synthetic val$runAfter:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/RestoreActivity;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iput-object p2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->val$runAfter:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 296
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 297
    .local v0, "errorCode":I
    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 330
    :goto_0
    return-void

    .line 300
    :cond_0
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 301
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f0801f6

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 302
    :cond_1
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    const/16 v1, 0x458

    if-ne v0, v1, :cond_4

    .line 303
    :cond_2
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 304
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f0806a2

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 306
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->description:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 308
    :cond_4
    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_5

    .line 309
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f0806a5

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 310
    :cond_5
    const/16 v1, 0x64

    if-ne v0, v1, :cond_9

    .line 311
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "first_name"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "last_name"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 312
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f0806a4

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    .line 313
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$400(Lcom/vkontakte/android/activities/RestoreActivity;I)V

    goto :goto_0

    .line 314
    :cond_7
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "phone"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 315
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f0806a6

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 317
    :cond_8
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto/16 :goto_0

    .line 319
    :cond_9
    const/16 v1, 0xf

    if-ne v0, v1, :cond_c

    .line 320
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "user not found"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 321
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f080202

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 322
    :cond_a
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "not available"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 323
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v3, 0x7f0801ff

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 325
    :cond_b
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto/16 :goto_0

    .line 328
    :cond_c
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto/16 :goto_0
.end method

.method public success(Landroid/util/Pair;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 287
    .local p1, "answer":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Boolean;>;"
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->access$602(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 288
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v1, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->access$702(Lcom/vkontakte/android/activities/RestoreActivity;Z)Z

    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->val$runAfter:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$3;->val$runAfter:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 292
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 284
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/RestoreActivity$3;->success(Landroid/util/Pair;)V

    return-void
.end method
