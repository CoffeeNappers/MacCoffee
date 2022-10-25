.class public Lcom/vkontakte/android/fragments/AuthCheckFragment;
.super Lcom/vkontakte/android/fragments/VKToolbarFragment;
.source "AuthCheckFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;
.implements Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;
.implements Lru/mail/libverify/controls/VerificationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/AuthCheckFragment$TimeUpdater;,
        Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;
    }
.end annotation


# static fields
.field public static final KEY_CODE:Ljava/lang/String; = "code"

.field public static final KEY_SESSION:Ljava/lang/String; = "session"

.field public static final KEY_TOKEN:Ljava/lang/String; = "token"


# instance fields
.field private buttonRetry:Landroid/view/View;

.field private controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

.field private editText:Landroid/widget/EditText;

.field private initTime:J

.field private progressDialog:Landroid/app/ProgressDialog;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private textInfo1:Landroid/widget/TextView;

.field private textInfo2:Landroid/widget/TextView;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;-><init>()V

    .line 111
    new-instance v0, Lcom/vkontakte/android/fragments/AuthCheckFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment$1;-><init>(Lcom/vkontakte/android/fragments/AuthCheckFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/AuthCheckFragment;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;

    .prologue
    .line 52
    iget-wide v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->initTime:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/AuthCheckFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->processSms(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/AuthCheckFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showError(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo2:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->buttonRetry:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/AuthCheckFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->resendCode()V

    return-void
.end method

.method private getLibverifyPhone()Ljava/lang/String;
    .locals 3

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "libverify_phone"

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private isLibverifySupport()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "is_libverify"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private processSms(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 138
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    :goto_0
    return-void

    .line 141
    :cond_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/AuthCheckFragment;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private resendCode()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 394
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->updateText(Z)V

    .line 396
    new-instance v0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;-><init>(Lcom/vkontakte/android/fragments/AuthCheckFragment;Landroid/app/Fragment;)V

    .line 411
    .local v0, "callback":Lcom/vkontakte/android/api/ResultlessCallback;
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->isLibverifySupport()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 414
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onResendSms()V

    .line 415
    invoke-virtual {v0}, Lcom/vkontakte/android/api/ResultlessCallback;->success()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 424
    :goto_0
    return-void

    .line 416
    :catch_0
    move-exception v1

    .line 417
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 418
    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 421
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v2, Lcom/vkontakte/android/api/auth/AuthValidatePhone;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "sid"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getPhone()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 422
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private setResultAndFinish(Ljava/lang/String;)V
    .locals 7
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 250
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 251
    .local v0, "activity":Landroid/app/Activity;
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->isLibverifySupport()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 254
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->isValidSmsCode(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 255
    iget-object v2, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onEnterSmsCode(Ljava/lang/String;)V

    .line 270
    :cond_0
    :goto_0
    return-void

    .line 257
    :cond_1
    sget-object v2, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_SMS_CODE:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 259
    :catch_0
    move-exception v1

    .line 260
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 263
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    if-eqz v0, :cond_0

    .line 264
    const/4 v2, -0x1

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v4, "code"

    .line 265
    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "auth_state"

    .line 266
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "auth_state"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v3

    .line 264
    invoke-virtual {v0, v2, v3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 267
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method private setResultAndFinish(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "session"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 274
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 275
    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "session"

    .line 276
    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "token"

    .line 277
    invoke-virtual {v2, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "auth_state"

    .line 278
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "auth_state"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    .line 275
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 279
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 281
    :cond_0
    return-void
.end method

.method private showError(Ljava/lang/String;)V
    .locals 4
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 514
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 515
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 516
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801f9

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    const/4 v3, 0x0

    .line 517
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 519
    :cond_0
    return-void
.end method

.method private updateText(Z)V
    .locals 6
    .param p1, "sms"    # Z

    .prologue
    .line 383
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo1:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 391
    :goto_0
    return-void

    .line 386
    :cond_0
    if-eqz p1, :cond_1

    .line 387
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo1:Landroid/widget/TextView;

    const v1, 0x7f0800fd

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "phoneMask"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 389
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo1:Landroid/widget/TextView;

    const v1, 0x7f0800fc

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 379
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->invalidateOptionsMenu()V

    .line 380
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 371
    return-void
.end method

.method public getPhone()Ljava/lang/String;
    .locals 2

    .prologue
    .line 427
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hideProgress()V
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 166
    return-void
.end method

.method synthetic lambda$null$0(Ljava/lang/String;)V
    .locals 1
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 152
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 153
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->setResultAndFinish(Ljava/lang/String;)V

    .line 155
    :cond_0
    return-void
.end method

.method synthetic lambda$onCreateContentView$2(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 338
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    .local v0, "code":Ljava/lang/String;
    const/4 v1, 0x6

    if-ne p2, v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 340
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->setResultAndFinish(Ljava/lang/String;)V

    .line 341
    const/4 v1, 0x1

    .line 343
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method synthetic lambda$processSms$1(Ljava/lang/String;)V
    .locals 8
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 142
    const-string/jumbo v3, "(?:VK|\u0412\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u0435).*?([0-9]+).*"

    const/16 v4, 0x28

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 143
    .local v2, "ptn":Ljava/util/regex/Pattern;
    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 144
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 145
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "code":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    if-nez v3, :cond_1

    .line 157
    .end local v0    # "code":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 149
    .restart local v0    # "code":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 150
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/AuthCheckFragment;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v4

    const-wide/16 v6, 0x1f4

    invoke-virtual {v3, v4, v6, v7}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 309
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 310
    const v0, 0x7f0805ec

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->setTitle(I)V

    .line 311
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 366
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->resendCode()V

    .line 367
    return-void
.end method

.method public onCompleted(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "sessionId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "token"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 495
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onConfirmed()V

    .line 496
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->setResultAndFinish(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 498
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 170
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 171
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->setHasOptionsMenu(Z)V

    .line 173
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->progressDialog:Landroid/app/ProgressDialog;

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->progressDialog:Landroid/app/ProgressDialog;

    const v1, 0x7f08033d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 176
    if-eqz p1, :cond_2

    .line 177
    const-string/jumbo v0, "init_time"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->initTime:J

    .line 182
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->isLibverifySupport()Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "android.provider.Telephony.SMS_RECEIVED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "validate_phone_on_start"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 187
    new-instance v0, Lcom/vkontakte/android/api/auth/AuthValidatePhone;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "sid"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getPhone()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, v4}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment$2;-><init>(Lcom/vkontakte/android/fragments/AuthCheckFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 202
    :cond_1
    return-void

    .line 179
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->initTime:J

    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    .line 325
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v8, "is_sms"

    invoke-virtual {v6, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 327
    .local v4, "sms":Z
    const v6, 0x7f030219

    invoke-virtual {p1, v6, p2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    .line 329
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    const v8, 0x7f100563

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    .line 330
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    const v8, 0x7f100564

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo1:Landroid/widget/TextView;

    .line 331
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    const v8, 0x7f100565

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo2:Landroid/widget/TextView;

    .line 332
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    const v8, 0x7f100566

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->buttonRetry:Landroid/view/View;

    .line 334
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 335
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string/jumbo v9, "code"

    const-string/jumbo v10, ""

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 336
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    const/4 v8, 0x6

    invoke-virtual {v6, v8}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 337
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/widget/TextView$OnEditorActionListener;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 346
    if-eqz v4, :cond_0

    .line 347
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    new-instance v8, Lcom/vkontakte/android/fragments/AuthCheckFragment$TimeUpdater;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lcom/vkontakte/android/fragments/AuthCheckFragment$TimeUpdater;-><init>(Lcom/vkontakte/android/fragments/AuthCheckFragment;Lcom/vkontakte/android/fragments/AuthCheckFragment$1;)V

    const-wide/16 v10, 0x1f4

    invoke-virtual {v6, v8, v10, v11}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 353
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->buttonRetry:Landroid/view/View;

    invoke-virtual {v6, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 355
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    const v8, 0x7f100088

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 356
    .local v5, "topBlock":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .local v1, "pl":I
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    .local v3, "pt":I
    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    .local v2, "pr":I
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 357
    .local v0, "pb":I
    new-instance v8, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const/4 v10, -0x1

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v11, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->isTablet:Z

    if-nez v6, :cond_1

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v8, v9, v10, v11, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    invoke-virtual {v5, v8}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 358
    invoke-virtual {v5, v1, v3, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 360
    invoke-direct {p0, v4}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->updateText(Z)V

    .line 361
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    return-object v6

    .line 349
    .end local v0    # "pb":I
    .end local v1    # "pl":I
    .end local v2    # "pr":I
    .end local v3    # "pt":I
    .end local v5    # "topBlock":Landroid/view/View;
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo2:Landroid/widget/TextView;

    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 350
    iget-object v6, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->buttonRetry:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .restart local v0    # "pb":I
    .restart local v1    # "pl":I
    .restart local v2    # "pr":I
    .restart local v3    # "pt":I
    .restart local v5    # "topBlock":Landroid/view/View;
    :cond_1
    move v6, v7

    .line 357
    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 285
    const v0, 0x7f110012

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 286
    const v0, 0x7f10001a

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 287
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 288
    return-void

    .line 286
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 291
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroy()V

    .line 293
    :try_start_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->isLibverifySupport()Z

    move-result v0

    if-nez v0, :cond_0

    .line 294
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 299
    :cond_0
    :goto_0
    return-void

    .line 296
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 315
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroyView()V

    .line 316
    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->view:Landroid/view/View;

    .line 317
    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    .line 318
    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo1:Landroid/widget/TextView;

    .line 319
    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->textInfo2:Landroid/widget/TextView;

    .line 320
    iput-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->buttonRetry:Landroid/view/View;

    .line 321
    return-void
.end method

.method public onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    .locals 2
    .param p1, "reason"    # Lru/mail/libverify/api/VerificationApi$FailReason;

    .prologue
    .line 464
    sget-object v0, Lcom/vkontakte/android/fragments/AuthCheckFragment$4;->$SwitchMap$ru$mail$libverify$api$VerificationApi$FailReason:[I

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$FailReason;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 483
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 468
    :pswitch_0
    const v0, 0x7f0806a5

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showError(Ljava/lang/String;)V

    .line 485
    :goto_0
    :pswitch_1
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 486
    return-void

    .line 471
    :pswitch_2
    const v0, 0x7f0806a6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 477
    :pswitch_3
    const v0, 0x7f0801f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 480
    :pswitch_4
    const v0, 0x7f08069a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 464
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onIvrCallError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    .locals 2
    .param p1, "failReason"    # Lru/mail/libverify/api/VerificationApi$FailReason;

    .prologue
    .line 502
    const v0, 0x7f0801f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showError(Ljava/lang/String;)V

    .line 503
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 504
    return-void
.end method

.method public onNotification(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->processSms(Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 238
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f10001a

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    if-eqz v1, :cond_1

    .line 239
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, "code":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 241
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->setResultAndFinish(Ljava/lang/String;)V

    .line 243
    :cond_0
    const/4 v1, 0x1

    .line 245
    .end local v0    # "code":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 228
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->unSubscribeSmsNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V

    .line 229
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->setListener(Lru/mail/libverify/controls/VerificationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onPause()V

    .line 234
    return-void

    .line 230
    :catch_0
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onPhoneNumberReceived(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 508
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 509
    return-void
.end method

.method public onProgress(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 455
    if-eqz p1, :cond_0

    .line 456
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->showProgress()V

    .line 460
    :goto_0
    return-void

    .line 458
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->hideProgress()V

    goto :goto_0
.end method

.method public onResume()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 206
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onResume()V

    .line 209
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    if-nez v3, :cond_2

    const/4 v1, 0x1

    .line 210
    .local v1, "needStart":Z
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    if-nez v3, :cond_0

    .line 211
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->auth(Landroid/content/Context;)Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    .line 213
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v3, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->subscribeSmsNotificationListener(Lru/mail/libverify/api/VerificationApi$SmsCodeNotificationListener;)V

    .line 214
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v3, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->setListener(Lru/mail/libverify/controls/VerificationListener;)V

    .line 216
    if-eqz v1, :cond_1

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->isLibverifySupport()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 217
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->getLibverifyPhone()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onStart(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v1    # "needStart":Z
    :cond_1
    :goto_1
    return-void

    :cond_2
    move v1, v2

    .line 209
    goto :goto_0

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, "e":Ljava/lang/Exception;
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 303
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 304
    const-string/jumbo v0, "init_time"

    iget-wide v2, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->initTime:J

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 305
    return-void
.end method

.method public onSmsCodeReceived(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 490
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 491
    return-void
.end method

.method public onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V
    .locals 2
    .param p1, "state"    # Lru/mail/libverify/controls/VerificationController$State;

    .prologue
    .line 450
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 451
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 375
    return-void
.end method

.method public showProgress()V
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->showDialogSafety(Landroid/app/Dialog;)V

    .line 162
    return-void
.end method
