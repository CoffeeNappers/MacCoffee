.class public abstract Lcom/vkontakte/android/auth/VKAuthHelper;
.super Ljava/lang/Object;
.source "VKAuthHelper.java"

# interfaces
.implements Lcom/vkontakte/android/auth/VKAuth$AuthListener;


# static fields
.field private static final REQUEST_PHONE:I = 0x5c71

.field private static final REQUEST_RECEIVE_LIBVERIFY_TOKEN:I = 0x5c6f

.field private static final REQUEST_RECEIVE_PHONE_CODE:I = 0x5c6e

.field public static final REQUEST_VALIDATE_URL:I = 0x5c70


# instance fields
.field private final activity:Landroid/app/Activity;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private tmpAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

.field private tmpState:Lcom/vkontakte/android/auth/VKAuthState;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpState:Lcom/vkontakte/android/auth/VKAuthState;

    .line 29
    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .line 32
    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    .line 33
    return-void
.end method

.method private contains(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "s1"    # Ljava/lang/String;
    .param p2, "s2"    # Ljava/lang/String;

    .prologue
    .line 124
    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$showErrorMessage$0(Landroid/app/Activity;Landroid/content/DialogInterface;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 153
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 154
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 155
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 72
    const/16 v8, 0x5c6f

    if-ne p1, v8, :cond_1

    .line 73
    const/4 v8, -0x1

    if-ne p2, v8, :cond_0

    .line 74
    const-string/jumbo v8, "auth_state"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/auth/VKAuthState;

    .line 75
    .local v2, "helper":Lcom/vkontakte/android/auth/VKAuthState;
    const-string/jumbo v8, "session"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 76
    .local v5, "session":Ljava/lang/String;
    const-string/jumbo v8, "token"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 77
    .local v6, "token":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 78
    invoke-virtual {v2, v5, v6}, Lcom/vkontakte/android/auth/VKAuthState;->setLibverifyToken(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v8

    invoke-static {v8, p0}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    .line 81
    .end local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    .end local v5    # "session":Ljava/lang/String;
    .end local v6    # "token":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x1

    .line 119
    :goto_0
    return v8

    .line 82
    :cond_1
    const/16 v8, 0x5c6e

    if-ne p1, v8, :cond_3

    .line 83
    const/4 v8, -0x1

    if-ne p2, v8, :cond_2

    .line 84
    const-string/jumbo v8, "auth_state"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/auth/VKAuthState;

    .line 85
    .restart local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    const-string/jumbo v8, "code"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "code":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 87
    invoke-virtual {v2, v1}, Lcom/vkontakte/android/auth/VKAuthState;->setValidateCode(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v8

    invoke-static {v8, p0}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    .line 90
    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    :cond_2
    const/4 v8, 0x1

    goto :goto_0

    .line 91
    :cond_3
    const/16 v8, 0x5c70

    if-ne p1, v8, :cond_6

    .line 92
    const/4 v8, -0x1

    if-ne p2, v8, :cond_4

    if-eqz p3, :cond_4

    .line 93
    const-string/jumbo v8, "access_token"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "accessToken":Ljava/lang/String;
    const-string/jumbo v8, "secret"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 95
    .local v4, "secret":Ljava/lang/String;
    const-string/jumbo v8, "user_id"

    const/4 v9, 0x0

    invoke-virtual {p3, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 96
    .local v7, "userId":I
    const-string/jumbo v8, "auth_state"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/auth/VKAuthState;

    .line 98
    .restart local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    if-eqz v7, :cond_5

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 99
    invoke-static {v0, v4, v7}, Lcom/vkontakte/android/auth/VKAuthState;->byAuthData(Ljava/lang/String;Ljava/lang/String;I)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v8

    invoke-static {v8, p0}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    .line 104
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    .end local v4    # "secret":Ljava/lang/String;
    .end local v7    # "userId":I
    :cond_4
    :goto_1
    const/4 v8, 0x1

    goto :goto_0

    .line 100
    .restart local v0    # "accessToken":Ljava/lang/String;
    .restart local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    .restart local v4    # "secret":Ljava/lang/String;
    .restart local v7    # "userId":I
    :cond_5
    if-eqz v2, :cond_4

    .line 101
    invoke-static {v2, p0}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    goto :goto_1

    .line 105
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v2    # "helper":Lcom/vkontakte/android/auth/VKAuthState;
    .end local v4    # "secret":Ljava/lang/String;
    .end local v7    # "userId":I
    :cond_6
    const/16 v8, 0x5c71

    if-ne p1, v8, :cond_8

    .line 106
    const/4 v8, -0x1

    if-ne p2, v8, :cond_7

    iget-object v8, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpState:Lcom/vkontakte/android/auth/VKAuthState;

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    if-eqz v8, :cond_7

    if-eqz p3, :cond_7

    .line 107
    const-string/jumbo v8, "phone"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 108
    .local v3, "phone":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 109
    new-instance v8, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    const/4 v9, 0x1

    iget-object v10, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    iget-object v10, v10, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validationSid:Ljava/lang/String;

    invoke-direct {v8, v3, v3, v9, v10}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 110
    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->validatePhoneOnStart()Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpState:Lcom/vkontakte/android/auth/VKAuthState;

    .line 111
    invoke-virtual {v8, v9}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->setLoginHelper(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    const/16 v10, 0x5c6e

    .line 112
    invoke-virtual {v8, v9, v10}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 115
    .end local v3    # "phone":Ljava/lang/String;
    :cond_7
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpState:Lcom/vkontakte/android/auth/VKAuthState;

    .line 116
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .line 117
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 119
    :cond_8
    const/4 v8, 0x0

    goto/16 :goto_0
.end method

.method public onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 6
    .param p1, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p2, "answer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 39
    const/4 v0, 0x0

    .line 40
    .local v0, "isSms":Z
    iget v1, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    packed-switch v1, :pswitch_data_0

    .line 67
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "unknown validation type"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 69
    :goto_0
    return-void

    .line 42
    :pswitch_0
    const/4 v0, 0x1

    .line 44
    :pswitch_1
    new-instance v1, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    iget-object v2, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->phoneMask:Ljava/lang/String;

    iget-object v3, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validationSid:Ljava/lang/String;

    invoke-direct {v1, v4, v2, v0, v3}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 45
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->setLoginHelper(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    const/16 v3, 0x5c6e

    .line 46
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    goto :goto_0

    .line 49
    :pswitch_2
    new-instance v1, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    iget-object v2, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->phoneMask:Ljava/lang/String;

    iget-object v3, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validationSid:Ljava/lang/String;

    invoke-direct {v1, v4, v2, v5, v3}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 50
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->setLoginHelper(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    move-result-object v1

    .line 51
    invoke-virtual {p1}, Lcom/vkontakte/android/auth/VKAuthState;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->setIsLibverify(Ljava/lang/String;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    const/16 v3, 0x5c6f

    .line 52
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    goto :goto_0

    .line 55
    :pswitch_3
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    const-class v4, Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v3, "url"

    iget-object v4, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->redirectUrl:Ljava/lang/String;

    .line 56
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "return_result"

    .line 57
    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "auth_state"

    .line 58
    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0x5c70

    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 62
    :pswitch_4
    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpState:Lcom/vkontakte/android/auth/VKAuthState;

    .line 63
    iput-object p2, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->tmpAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .line 64
    new-instance v1, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Builder;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/auth/VKAuthHelper;->activity:Landroid/app/Activity;

    const/16 v3, 0x5c71

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    goto :goto_0

    .line 40
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method

.method public showErrorMessage(Landroid/app/Activity;ZILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "closeOnError"    # Z
    .param p3, "result"    # I
    .param p4, "answer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 129
    const/4 v3, 0x3

    if-ne p3, v3, :cond_6

    .line 130
    iget-object v1, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->errorDescription:Ljava/lang/String;

    .line 131
    .local v1, "extraMessage":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 132
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080100

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "msg":Ljava/lang/String;
    :goto_0
    iget-object v3, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "code is invalid"

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/auth/VKAuthHelper;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "wrong code"

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/auth/VKAuthHelper;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 137
    :cond_0
    const v3, 0x7f080107

    invoke-virtual {p1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 146
    .end local v1    # "extraMessage":Ljava/lang/String;
    :cond_1
    :goto_1
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v3, p1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 147
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080102

    .line 148
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080479

    const/4 v5, 0x0

    .line 149
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 150
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 151
    .local v0, "dlg":Landroid/app/AlertDialog;
    if-eqz p2, :cond_2

    .line 152
    invoke-static {p1}, Lcom/vkontakte/android/auth/VKAuthHelper$$Lambda$1;->lambdaFactory$(Landroid/app/Activity;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 157
    :cond_2
    return-void

    .line 134
    .end local v0    # "dlg":Landroid/app/AlertDialog;
    .end local v2    # "msg":Ljava/lang/String;
    .restart local v1    # "extraMessage":Ljava/lang/String;
    :cond_3
    move-object v2, v1

    .restart local v2    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 138
    :cond_4
    iget-object v3, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "too"

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/auth/VKAuthHelper;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "tries"

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/auth/VKAuthHelper;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 139
    const v3, 0x7f080103

    invoke-virtual {p1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 140
    :cond_5
    iget-object v3, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "email"

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/auth/VKAuthHelper;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p4, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "registered"

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/auth/VKAuthHelper;->contains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 141
    const v3, 0x7f080207

    invoke-virtual {p1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 144
    .end local v1    # "extraMessage":Ljava/lang/String;
    .end local v2    # "msg":Ljava/lang/String;
    :cond_6
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080101

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "msg":Ljava/lang/String;
    goto :goto_1
.end method
