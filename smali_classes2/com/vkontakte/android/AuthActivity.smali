.class public Lcom/vkontakte/android/AuthActivity;
.super Landroid/accounts/AccountAuthenticatorActivity;
.source "AuthActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/accounts/AccountAuthenticatorActivity;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/facebook/FacebookCallback",
        "<",
        "Lcom/facebook/login/LoginResult;",
        ">;"
    }
.end annotation


# static fields
.field private static CLICKABLE_VIEWS:[I = null

.field private static MEDIUM_VIEWS:[I = null

.field private static final REGISTER_RESULT:I = 0x1f4

.field private static final RESTORE_RESULT:I = 0xcb

.field public static active:Z


# instance fields
.field private authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

.field private fbCallbackMgr:Lcom/facebook/CallbackManager;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

.field progress:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 43
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/AuthActivity;->active:Z

    .line 99
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/AuthActivity;->CLICKABLE_VIEWS:[I

    .line 100
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/vkontakte/android/AuthActivity;->MEDIUM_VIEWS:[I

    return-void

    .line 99
    nop

    :array_0
    .array-data 4
        0x7f100241
        0x7f100243
        0x7f100244
        0x7f100240
    .end array-data

    .line 100
    :array_1
    .array-data 4
        0x7f100240
        0x7f100241
        0x7f100243
        0x7f100245
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/accounts/AccountAuthenticatorActivity;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/AuthActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 48
    new-instance v0, Lcom/vkontakte/android/AuthActivity$1;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/AuthActivity$1;-><init>(Lcom/vkontakte/android/AuthActivity;Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/vkontakte/android/AuthActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/AuthActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AuthActivity;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/AuthActivity;->showAuthProcess()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/AuthActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AuthActivity;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/AuthActivity;->hideAuthProcess()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/AuthActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AuthActivity;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/AuthActivity;->doAuth()V

    return-void
.end method

.method private doAuth()V
    .locals 3

    .prologue
    .line 276
    const v2, 0x7f10023e

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 277
    .local v0, "login":Ljava/lang/String;
    const v2, 0x7f10023f

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 278
    .local v1, "pass":Ljava/lang/String;
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/AuthActivity;->doAuth(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    return-void
.end method

.method private doAuth(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "login"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    .line 282
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 283
    invoke-static {p1, p2}, Lcom/vkontakte/android/auth/VKAuthState;->byLoginPassword(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAuthState;->libverifySupport()Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/AuthActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-static {v0, v1}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    .line 285
    :cond_0
    return-void
.end method

.method private doExternalSignup(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 270
    invoke-static {p1, p2}, Lcom/vkontakte/android/auth/VKAuthState;->byExternalService(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/AuthActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-static {v0, v1}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    .line 271
    return-void
.end method

.method private doFacebookAuth()V
    .locals 4

    .prologue
    .line 260
    invoke-static {}, Lcom/facebook/FacebookSdk;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 261
    invoke-virtual {p0}, Lcom/vkontakte/android/AuthActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/FacebookSdk;->sdkInitialize(Landroid/content/Context;)V

    .line 263
    :cond_0
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/login/LoginManager;->logOut()V

    .line 264
    invoke-static {}, Lcom/facebook/CallbackManager$Factory;->create()Lcom/facebook/CallbackManager;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 265
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    invoke-virtual {v0, v1, p0}, Lcom/facebook/login/LoginManager;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    .line 266
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "email"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "user_birthday"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/facebook/login/LoginManager;->logInWithReadPermissions(Landroid/app/Activity;Ljava/util/Collection;)V

    .line 267
    return-void
.end method

.method private hideAuthProcess()V
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/AuthActivity;->progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 185
    const v0, 0x7f100241

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 186
    return-void
.end method

.method static synthetic lambda$onCreate$3(Landroid/view/View;Landroid/view/View;Z)V
    .locals 3
    .param p0, "facebookView"    # Landroid/view/View;
    .param p1, "facebookDivider"    # Landroid/view/View;
    .param p2, "visible"    # Z

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 160
    if-eqz p2, :cond_0

    move v0, v1

    :goto_0
    invoke-static {p0, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 161
    if-eqz p2, :cond_1

    :goto_1
    invoke-static {p1, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 162
    return-void

    :cond_0
    move v0, v2

    .line 160
    goto :goto_0

    :cond_1
    move v1, v2

    .line 161
    goto :goto_1
.end method

.method private openBrowser(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 253
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "return_result"

    const/4 v2, 0x1

    .line 254
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x5c70

    .line 253
    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/AuthActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 255
    return-void
.end method

.method private showAuthProcess()V
    .locals 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/AuthActivity;->progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->showDialogSafety(Landroid/app/Dialog;)V

    .line 180
    const v0, 0x7f100241

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 181
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/AuthActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/AuthActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$2(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/vkontakte/android/AuthActivity;->doAuth()V

    .line 151
    const/4 v0, 0x1

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 8
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v7, 0xcb

    const/4 v6, -0x1

    .line 223
    iget-object v5, p0, Lcom/vkontakte/android/AuthActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-virtual {v5, p1, p2, p3}, Lcom/vkontakte/android/auth/VKAuthHelper;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 250
    :cond_0
    :goto_0
    return-void

    .line 226
    :cond_1
    const/4 v5, 0x1

    if-ne p2, v5, :cond_2

    if-ne p1, v7, :cond_2

    .line 227
    const-string/jumbo v3, "https://oauth.vk.com/restore?scope=nohttps,all&client_id=2274003&client_secret=hHbZxrka2uZ6jB1inYsH"

    .line 230
    .local v3, "url":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/vkontakte/android/AuthActivity;->openBrowser(Ljava/lang/String;)V

    goto :goto_0

    .line 231
    .end local v3    # "url":Ljava/lang/String;
    :cond_2
    if-ne p2, v6, :cond_3

    if-ne p1, v7, :cond_3

    .line 232
    if-eqz p3, :cond_0

    .line 233
    const-string/jumbo v5, "access_token"

    invoke-virtual {p3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 234
    .local v0, "accessToken":Ljava/lang/String;
    const-string/jumbo v5, "secret"

    invoke-virtual {p3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 235
    .local v2, "secret":Ljava/lang/String;
    const-string/jumbo v5, "user_id"

    const/4 v6, 0x0

    invoke-virtual {p3, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 236
    .local v4, "userId":I
    if-eqz v4, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 237
    invoke-static {v0, v2, v4}, Lcom/vkontakte/android/auth/VKAuthState;->byAuthData(Ljava/lang/String;Ljava/lang/String;I)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/AuthActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-static {v5, v6}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    goto :goto_0

    .line 240
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v2    # "secret":Ljava/lang/String;
    .end local v4    # "userId":I
    :cond_3
    if-ne p2, v6, :cond_4

    const/16 v5, 0x1f4

    if-ne p1, v5, :cond_4

    .line 241
    if-eqz p3, :cond_0

    .line 242
    const-string/jumbo v5, "auth_state"

    invoke-virtual {p3, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/auth/VKAuthState;

    .line 243
    .local v1, "authState":Lcom/vkontakte/android/auth/VKAuthState;
    if-eqz v1, :cond_0

    .line 244
    iget-object v5, p0, Lcom/vkontakte/android/AuthActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-static {v1, v5}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    goto :goto_0

    .line 247
    .end local v1    # "authState":Lcom/vkontakte/android/auth/VKAuthState;
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    if-eqz v5, :cond_0

    .line 248
    iget-object v5, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    invoke-interface {v5, p1, p2, p3}, Lcom/facebook/CallbackManager;->onActivityResult(IILandroid/content/Intent;)Z

    goto :goto_0
.end method

.method public onCancel()V
    .locals 1

    .prologue
    .line 299
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 300
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 190
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 205
    :goto_0
    :pswitch_0
    return-void

    .line 192
    :pswitch_1
    invoke-direct {p0}, Lcom/vkontakte/android/AuthActivity;->doAuth()V

    goto :goto_0

    .line 195
    :pswitch_2
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/activities/SignupActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v2, 0x1f4

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/AuthActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 198
    :pswitch_3
    invoke-direct {p0}, Lcom/vkontakte/android/AuthActivity;->doFacebookAuth()V

    goto :goto_0

    .line 201
    :pswitch_4
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 202
    .local v0, "intent":Landroid/content/Intent;
    const/16 v1, 0xcb

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/AuthActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 190
    :pswitch_data_0
    .packed-switch 0x7f100240
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 115
    invoke-super {p0, p1}, Landroid/accounts/AccountAuthenticatorActivity;->onCreate(Landroid/os/Bundle;)V

    .line 117
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/AuthActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 119
    new-instance v7, Landroid/app/ProgressDialog;

    invoke-direct {v7, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/vkontakte/android/AuthActivity;->progress:Landroid/app/ProgressDialog;

    .line 120
    iget-object v7, p0, Lcom/vkontakte/android/AuthActivity;->progress:Landroid/app/ProgressDialog;

    const v8, 0x7f08033d

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/AuthActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 122
    invoke-virtual {p0}, Lcom/vkontakte/android/AuthActivity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    const-string/jumbo v8, "accountAuthenticatorResponse"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 123
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthUtils;->hasSystemAccount()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 124
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xb

    if-lt v6, v7, :cond_0

    .line 125
    const v6, 0x103006b

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AuthActivity;->setTheme(I)V

    .line 127
    :cond_0
    new-instance v6, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x7f0801f9

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f0800cf

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f080479

    invoke-static {p0}, Lcom/vkontakte/android/AuthActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/AuthActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v8

    .line 128
    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-static {p0}, Lcom/vkontakte/android/AuthActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/AuthActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 166
    :goto_0
    return-void

    .line 133
    :cond_1
    const v7, 0x7f030062

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/AuthActivity;->setContentView(I)V

    .line 135
    sget-object v8, Lcom/vkontakte/android/AuthActivity;->MEDIUM_VIEWS:[I

    array-length v9, v8

    move v7, v6

    :goto_1
    if-ge v7, v9, :cond_3

    aget v2, v8, v7

    .line 136
    .local v2, "id":I
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 137
    .local v3, "textView":Landroid/widget/TextView;
    if-eqz v3, :cond_2

    .line 138
    sget-object v10, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v10, v10, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 135
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 142
    .end local v2    # "id":I
    .end local v3    # "textView":Landroid/widget/TextView;
    :cond_3
    sget-object v7, Lcom/vkontakte/android/AuthActivity;->CLICKABLE_VIEWS:[I

    array-length v8, v7

    :goto_2
    if-ge v6, v8, :cond_5

    aget v2, v7, v6

    .line 143
    .restart local v2    # "id":I
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 144
    .local v4, "view":Landroid/view/View;
    if-eqz v4, :cond_4

    .line 145
    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 149
    .end local v2    # "id":I
    .end local v4    # "view":Landroid/view/View;
    :cond_5
    const v6, 0x7f10023f

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    invoke-static {p0}, Lcom/vkontakte/android/AuthActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/AuthActivity;)Landroid/widget/TextView$OnEditorActionListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 154
    const v6, 0x7f100244

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 155
    .local v1, "facebookView":Landroid/view/View;
    const v6, 0x7f1001cb

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 157
    .local v0, "facebookDivider":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_6

    .line 158
    const v6, 0x7f100239

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/AuthActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/XFrameLayout;

    .line 159
    .local v5, "xFrameLayout":Lcom/vkontakte/android/ui/XFrameLayout;
    invoke-static {v1, v0}, Lcom/vkontakte/android/AuthActivity$$Lambda$4;->lambdaFactory$(Landroid/view/View;Landroid/view/View;)Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/XFrameLayout;->setOnKeyboardStateListener(Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;)V

    .line 165
    .end local v5    # "xFrameLayout":Lcom/vkontakte/android/ui/XFrameLayout;
    :cond_6
    const/4 v6, 0x1

    sput-boolean v6, Lcom/vkontakte/android/AuthActivity;->active:Z

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/AuthActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 209
    invoke-super {p0}, Landroid/accounts/AccountAuthenticatorActivity;->onDestroy()V

    .line 210
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/AuthActivity;->active:Z

    .line 211
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 2
    .param p1, "e"    # Lcom/facebook/FacebookException;

    .prologue
    .line 304
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 305
    const v0, 0x7f0801f9

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 306
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "code"    # I
    .param p2, "evt"    # Landroid/view/KeyEvent;

    .prologue
    .line 214
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 215
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AuthActivity;->setResult(I)V

    .line 216
    invoke-virtual {p0}, Lcom/vkontakte/android/AuthActivity;->finish()V

    .line 217
    const/4 v0, 0x1

    .line 219
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/accounts/AccountAuthenticatorActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 104
    invoke-super {p0}, Landroid/accounts/AccountAuthenticatorActivity;->onPause()V

    .line 105
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 106
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 110
    invoke-super {p0}, Landroid/accounts/AccountAuthenticatorActivity;->onResume()V

    .line 111
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 112
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 169
    invoke-super {p0}, Landroid/accounts/AccountAuthenticatorActivity;->onStart()V

    .line 170
    invoke-static {p0}, Lcom/my/tracker/MyTracker;->onStartActivity(Landroid/app/Activity;)V

    .line 171
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 174
    invoke-super {p0}, Landroid/accounts/AccountAuthenticatorActivity;->onStop()V

    .line 175
    invoke-static {p0}, Lcom/my/tracker/MyTracker;->onStopActivity(Landroid/app/Activity;)V

    .line 176
    return-void
.end method

.method public onSuccess(Lcom/facebook/login/LoginResult;)V
    .locals 2
    .param p1, "loginResult"    # Lcom/facebook/login/LoginResult;

    .prologue
    .line 291
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/AuthActivity;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 292
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getAccessToken()Lcom/facebook/AccessToken;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 293
    const-string/jumbo v0, "facebook"

    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getAccessToken()Lcom/facebook/AccessToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/AuthActivity;->doExternalSignup(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 40
    check-cast p1, Lcom/facebook/login/LoginResult;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/AuthActivity;->onSuccess(Lcom/facebook/login/LoginResult;)V

    return-void
.end method
