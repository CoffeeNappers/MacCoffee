.class Lcom/vkontakte/android/activities/SignupActivity$2;
.super Ljava/lang/Object;
.source "SignupActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/SignupActivity;->requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V
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
.field final synthetic this$0:Lcom/vkontakte/android/activities/SignupActivity;

.field final synthetic val$runAfter:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 280
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iput-object p2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->val$runAfter:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 292
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 293
    .local v0, "errorCode":I
    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 329
    :goto_0
    return-void

    .line 296
    :cond_0
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 297
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0801f6

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 298
    :cond_1
    const/16 v1, 0x3ec

    if-ne v0, v1, :cond_2

    .line 299
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801f9

    .line 300
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0806ad

    .line 301
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080694

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$2$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity$2;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 302
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    const/4 v3, 0x0

    .line 307
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 308
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 309
    :cond_2
    const/16 v1, 0x9

    if-eq v0, v1, :cond_3

    const/16 v1, 0x458

    if-ne v0, v1, :cond_5

    .line 310
    :cond_3
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 311
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0806a2

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 313
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->description:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 315
    :cond_5
    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_6

    .line 316
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0806a5

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 317
    :cond_6
    const/16 v1, 0x64

    if-ne v0, v1, :cond_a

    .line 318
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "first_name"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "last_name"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 319
    :cond_7
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0806a4

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    .line 320
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$300(Lcom/vkontakte/android/activities/SignupActivity;I)V

    goto/16 :goto_0

    .line 321
    :cond_8
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "phone"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 322
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0806a6

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 324
    :cond_9
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/SignupActivity;->access$400(Lcom/vkontakte/android/activities/SignupActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto/16 :goto_0

    .line 327
    :cond_a
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/SignupActivity;->access$400(Lcom/vkontakte/android/activities/SignupActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto/16 :goto_0
.end method

.method synthetic lambda$fail$0(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 303
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const-class v2, Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 304
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "phone"

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$500(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 305
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const/16 v2, 0xcb

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/activities/SignupActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 306
    return-void
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
    .line 283
    .local p1, "sid":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Boolean;>;"
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/vkontakte/android/activities/SignupActivity;->access$002(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 284
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v1, v0}, Lcom/vkontakte/android/activities/SignupActivity;->access$102(Lcom/vkontakte/android/activities/SignupActivity;Z)Z

    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->val$runAfter:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity$2;->val$runAfter:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 288
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 280
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/SignupActivity$2;->success(Landroid/util/Pair;)V

    return-void
.end method
