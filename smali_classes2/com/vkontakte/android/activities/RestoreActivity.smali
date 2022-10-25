.class public Lcom/vkontakte/android/activities/RestoreActivity;
.super Lcom/vkontakte/android/activities/TabletsDialogActivity;
.source "RestoreActivity.java"

# interfaces
.implements Lru/mail/libverify/controls/VerificationListener;


# static fields
.field public static final KEY_ACCESS_TOKEN:Ljava/lang/String; = "access_token"

.field public static final KEY_SECRET:Ljava/lang/String; = "secret"

.field public static final KEY_USER_ID:Ljava/lang/String; = "user_id"

.field private static final titles:[I


# instance fields
.field private accessToken:Ljava/lang/String;

.field private authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

.field private codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

.field private controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

.field private curStep:I

.field private libverifySupport:Z

.field private number:Ljava/lang/String;

.field private passHash:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

.field private phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

.field private progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

.field private progressDialog:Landroid/app/ProgressDialog;

.field private secret:Ljava/lang/String;

.field private sid:Ljava/lang/String;

.field private userId:I

.field private wrap:Landroid/widget/FrameLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/activities/RestoreActivity;->titles:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f080220
        0x7f08069b
        0x7f0805d4
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;-><init>()V

    .line 56
    iput v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    .line 63
    iput-boolean v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    .line 71
    new-instance v0, Lcom/vkontakte/android/activities/RestoreActivity$1;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/activities/RestoreActivity$1;-><init>(Lcom/vkontakte/android/activities/RestoreActivity;Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passHash:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/activities/RestoreActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;

    .prologue
    .line 44
    iget v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->userId:I

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/activities/RestoreActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # I

    .prologue
    .line 44
    iput p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->userId:I

    return p1
.end method

.method static synthetic access$202(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->accessToken:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->secret:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/activities/RestoreActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/RestoreActivity;->setStep(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$602(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$702(Lcom/vkontakte/android/activities/RestoreActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    return-void
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/activities/RestoreActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onPhoneDone()V

    return-void
.end method

.method static synthetic access$lambda$1(Lcom/vkontakte/android/activities/RestoreActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onCodeDone()V

    return-void
.end method

.method static synthetic access$lambda$2(Lcom/vkontakte/android/activities/RestoreActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onPassDone()V

    return-void
.end method

.method private completeRestore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "passHash"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "accessToken"    # Ljava/lang/String;
    .param p5, "secret"    # Ljava/lang/String;

    .prologue
    .line 390
    new-instance v1, Lcom/vkontakte/android/api/account/AccountChangePassword;

    invoke-direct {v1, p1, p2, p3}, Lcom/vkontakte/android/api/account/AccountChangePassword;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/vkontakte/android/activities/RestoreActivity$4;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/RestoreActivity$4;-><init>(Lcom/vkontakte/android/activities/RestoreActivity;)V

    .line 391
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/account/AccountChangePassword;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 433
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/api/account/AccountChangePassword$Result;>;"
    const-string/jumbo v1, "access_token"

    invoke-virtual {v0, v1, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 434
    const-string/jumbo v1, "sig"

    invoke-virtual {v0, p5}, Lcom/vkontakte/android/api/VKAPIRequest;->getSig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->persistWithToken()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 435
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 436
    return-void
.end method

.method private onCodeDone()V
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getCode()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->verifyCode(Ljava/lang/String;)V

    .line 281
    return-void
.end method

.method private onPassDone()V
    .locals 6

    .prologue
    .line 271
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;->getPassword()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->password:Ljava/lang/String;

    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->password:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    .line 273
    const v0, 0x7f0806ac

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    .line 277
    :goto_0
    return-void

    .line 276
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passHash:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->password:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->accessToken:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/activities/RestoreActivity;->secret:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/activities/RestoreActivity;->completeRestore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onPhoneDone()V
    .locals 4

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->isFilled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 216
    :goto_0
    return-void

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->number:Ljava/lang/String;

    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Ljava/lang/Runnable;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method private requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V
    .locals 2
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "voice"    # Z
    .param p3, "runAfter"    # Ljava/lang/Runnable;
    .param p4, "libverifySupport"    # Z

    .prologue
    .line 284
    new-instance v0, Lcom/vkontakte/android/api/auth/AuthRestore;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->number:Ljava/lang/String;

    invoke-direct {v0, v1, p1, p2, p4}, Lcom/vkontakte/android/api/auth/AuthRestore;-><init>(Ljava/lang/String;Ljava/lang/String;ZZ)V

    new-instance v1, Lcom/vkontakte/android/activities/RestoreActivity$3;

    invoke-direct {v1, p0, p3}, Lcom/vkontakte/android/activities/RestoreActivity$3;-><init>(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/auth/AuthRestore;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 331
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 332
    return-void
.end method

.method private setStep(I)V
    .locals 8
    .param p1, "step"    # I

    .prologue
    const v5, 0x7f10002b

    .line 219
    iput p1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    .line 220
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->wrap:Landroid/widget/FrameLayout;

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Ljava/lang/Runnable;

    move-result-object v4

    const-wide/16 v6, 0x64

    invoke-virtual {v3, v4, v6, v7}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 221
    sget-object v3, Lcom/vkontakte/android/activities/RestoreActivity;->titles:[I

    aget v3, v3, p1

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->setTitle(I)V

    .line 222
    if-nez p1, :cond_0

    .line 223
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 224
    .local v1, "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 226
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    :cond_0
    const/4 v3, 0x1

    if-ne p1, v3, :cond_2

    .line 227
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v2

    .line 229
    .local v2, "phoneNumber":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    if-nez v3, :cond_1

    .line 230
    iget-boolean v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->create(Ljava/lang/String;Z)Lcom/vkontakte/android/fragments/SignupCodeFragment;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .line 231
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->setOnResendListener(Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;)V

    .line 244
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 247
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 248
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 250
    iget-boolean v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    if-eqz v3, :cond_2

    .line 253
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onStart(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 259
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    .end local v2    # "phoneNumber":Ljava/lang/String;
    :cond_2
    :goto_0
    const/4 v3, 0x2

    if-ne p1, v3, :cond_4

    .line 260
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    if-nez v3, :cond_3

    .line 261
    new-instance v3, Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    .line 262
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 263
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    const v4, 0x7f0805d3

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;->setExplainText(Ljava/lang/String;)V

    .line 265
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 266
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 268
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    :cond_4
    return-void

    .line 254
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    .restart local v2    # "phoneNumber":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private showError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 439
    iget-object v0, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    .line 440
    return-void
.end method

.method private showError(Ljava/lang/String;)V
    .locals 3
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 443
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 444
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 445
    return-void
.end method

.method private verifyCode(Ljava/lang/String;)V
    .locals 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 365
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 366
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    if-eqz v1, :cond_2

    .line 369
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->isValidSmsCode(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 370
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onEnterSmsCode(Ljava/lang/String;)V

    .line 381
    :cond_0
    :goto_0
    return-void

    .line 372
    :cond_1
    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_SMS_CODE:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 374
    :catch_0
    move-exception v0

    .line 375
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 378
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/vkontakte/android/auth/VKAuthState;->restoreWithCode(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-static {v1, v2}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    goto :goto_0
.end method

.method private verifyLibverifyToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "session"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 384
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 385
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/auth/VKAuthState;->restoreWithLibverifyToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-static {v0, v1}, Lcom/vkontakte/android/auth/VKAuth;->authAsync(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthListener;)V

    .line 387
    :cond_0
    return-void
.end method


# virtual methods
.method public hideProgress()V
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 110
    return-void
.end method

.method synthetic lambda$onCreate$0()V
    .locals 3

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setNumber(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onPhoneDone$1()V
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->setStep(I)V

    return-void
.end method

.method synthetic lambda$setStep$2()V
    .locals 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStepAnimated(I)V

    return-void
.end method

.method synthetic lambda$setStep$3(ZLjava/lang/Runnable;)V
    .locals 3
    .param p1, "voice"    # Z
    .param p2, "action"    # Ljava/lang/Runnable;

    .prologue
    const/4 v2, 0x0

    .line 232
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    if-eqz v1, :cond_0

    .line 235
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onResendSms()V

    .line 236
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    :goto_0
    return-void

    .line 237
    :catch_0
    move-exception v0

    .line 238
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 241
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    invoke-direct {p0, v1, p1, p2, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 467
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->authHelper:Lcom/vkontakte/android/auth/VKAuthHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/auth/VKAuthHelper;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 468
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 470
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 450
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onCancel()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    .line 463
    :goto_0
    return-void

    .line 453
    :catch_0
    move-exception v0

    .line 454
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 456
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 457
    invoke-direct {p0, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->setStep(I)V

    goto :goto_0

    .line 458
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    if-nez v1, :cond_2

    .line 459
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onBackPressed()V

    goto :goto_0

    .line 461
    :cond_2
    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->setStep(I)V

    goto :goto_0
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
    .line 521
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onConfirmed()V

    .line 522
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/activities/RestoreActivity;->verifyLibverifyToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 524
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const v9, 0x7f10002b

    const/4 v8, 0x1

    const/4 v5, 0x0

    .line 126
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onCreate(Landroid/os/Bundle;)V

    .line 130
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    if-nez v4, :cond_0

    .line 131
    invoke-static {p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->restore(Landroid/content/Context;)Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :cond_0
    :goto_0
    if-eqz p1, :cond_1

    .line 138
    const-string/jumbo v4, "restore_activity_number"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->number:Ljava/lang/String;

    .line 139
    const-string/jumbo v4, "restore_activity_sid"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    .line 140
    const-string/jumbo v4, "restore_activity_password"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->password:Ljava/lang/String;

    .line 141
    const-string/jumbo v4, "restore_activity_passHash"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passHash:Ljava/lang/String;

    .line 142
    const-string/jumbo v4, "restore_activity_userId"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->userId:I

    .line 143
    const-string/jumbo v4, "restore_activity_accessToken"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->accessToken:Ljava/lang/String;

    .line 144
    const-string/jumbo v4, "restore_activity_secret"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->secret:Ljava/lang/String;

    .line 145
    const-string/jumbo v4, "restore_activity_libverifySupport"

    invoke-virtual {p1, v4, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    .line 148
    :cond_1
    const v4, 0x7f0f0024

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/RestoreActivity;->setDialogWindowBackgroundResource(I)V

    .line 149
    const v4, 0x7f030216

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/RestoreActivity;->setContentView(I)V

    .line 150
    const v4, 0x7f1001b0

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/RestoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/Toolbar;

    .line 152
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    new-instance v4, Lcom/vkontakte/android/activities/RestoreActivity$2;

    invoke-virtual {v3}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/activities/RestoreActivity$2;-><init>(Lcom/vkontakte/android/activities/RestoreActivity;Landroid/graphics/drawable/Drawable;)V

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    .line 162
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/RestoreActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 164
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progressDialog:Landroid/app/ProgressDialog;

    .line 165
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progressDialog:Landroid/app/ProgressDialog;

    const v5, 0x7f08033d

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 167
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 168
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_2

    .line 169
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 170
    invoke-virtual {v0, v8}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 172
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStepCount(I)V

    .line 174
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/activities/RestoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->wrap:Landroid/widget/FrameLayout;

    .line 176
    new-instance v4, Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .line 177
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 179
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->wrap:Landroid/widget/FrameLayout;

    invoke-static {p0}, Lcom/vkontakte/android/activities/RestoreActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity;)Ljava/lang/Runnable;

    move-result-object v5

    const-wide/16 v6, 0xc8

    invoke-virtual {v4, v5, v6, v7}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 182
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    .line 183
    .local v2, "ft":Landroid/app/FragmentTransaction;
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v2, v9, v4}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    .line 185
    iget-object v4, p0, Lcom/vkontakte/android/activities/RestoreActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setShowForgitButton(Z)V

    .line 186
    return-void

    .line 133
    .end local v0    # "actionBar":Landroid/support/v7/app/ActionBar;
    .end local v2    # "ft":Landroid/app/FragmentTransaction;
    .end local v3    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :catch_0
    move-exception v1

    .line 134
    .local v1, "e":Ljava/lang/Exception;
    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v1, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 336
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f11000f

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 337
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    .locals 2
    .param p1, "reason"    # Lru/mail/libverify/api/VerificationApi$FailReason;

    .prologue
    .line 490
    sget-object v0, Lcom/vkontakte/android/activities/RestoreActivity$5;->$SwitchMap$ru$mail$libverify$api$VerificationApi$FailReason:[I

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$FailReason;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 509
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 494
    :pswitch_0
    const v0, 0x7f0806a5

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    .line 511
    :goto_0
    :pswitch_1
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 512
    return-void

    .line 497
    :pswitch_2
    const v0, 0x7f0806a6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 503
    :pswitch_3
    const v0, 0x7f0801f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 506
    :pswitch_4
    const v0, 0x7f08069a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 490
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
    .line 528
    const v0, 0x7f0801f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showError(Ljava/lang/String;)V

    .line 529
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 530
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 342
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 360
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 344
    :sswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onBackPressed()V

    goto :goto_0

    .line 347
    :sswitch_1
    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->curStep:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 349
    :pswitch_0
    invoke-direct {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onPhoneDone()V

    goto :goto_0

    .line 352
    :pswitch_1
    invoke-direct {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onCodeDone()V

    goto :goto_0

    .line 355
    :pswitch_2
    invoke-direct {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->onPassDone()V

    goto :goto_0

    .line 342
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f10021d -> :sswitch_1
    .end sparse-switch

    .line 347
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 190
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onPause()V

    .line 193
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->setListener(Lru/mail/libverify/controls/VerificationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v0

    .line 195
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
    .line 534
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 535
    return-void
.end method

.method public onProgress(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 481
    if-eqz p1, :cond_0

    .line 482
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->showProgress()V

    .line 486
    :goto_0
    return-void

    .line 484
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/RestoreActivity;->hideProgress()V

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 201
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onResume()V

    .line 204
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->setListener(Lru/mail/libverify/controls/VerificationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    :goto_0
    return-void

    .line 205
    :catch_0
    move-exception v0

    .line 206
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;Landroid/os/PersistableBundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;
    .param p2, "outPersistentState"    # Landroid/os/PersistableBundle;

    .prologue
    .line 114
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onSaveInstanceState(Landroid/os/Bundle;Landroid/os/PersistableBundle;)V

    .line 115
    const-string/jumbo v0, "restore_activity_number"

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->number:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    const-string/jumbo v0, "restore_activity_sid"

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->sid:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    const-string/jumbo v0, "restore_activity_password"

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->password:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const-string/jumbo v0, "restore_activity_passHash"

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->passHash:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const-string/jumbo v0, "restore_activity_userId"

    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->userId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 120
    const-string/jumbo v0, "restore_activity_accessToken"

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->accessToken:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string/jumbo v0, "restore_activity_secret"

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->secret:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string/jumbo v0, "restore_activity_libverifySupport"

    iget-boolean v1, p0, Lcom/vkontakte/android/activities/RestoreActivity;->libverifySupport:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 123
    return-void
.end method

.method public onSmsCodeReceived(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 516
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 517
    return-void
.end method

.method public onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V
    .locals 2
    .param p1, "state"    # Lru/mail/libverify/controls/VerificationController$State;

    .prologue
    .line 476
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 477
    return-void
.end method

.method public showProgress()V
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->showDialogSafety(Landroid/app/Dialog;)V

    .line 106
    return-void
.end method
