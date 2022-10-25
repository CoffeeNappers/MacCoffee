.class public Lcom/vkontakte/android/activities/SignupActivity;
.super Lcom/vkontakte/android/activities/TabletsDialogActivity;
.source "SignupActivity.java"

# interfaces
.implements Lru/mail/libverify/controls/VerificationListener;


# static fields
.field public static final KEY_AUTH_STATE:Ljava/lang/String; = "auth_state"

.field private static final RESTORE_RESULT:I = 0xcb

.field private static final titles:[I


# instance fields
.field private bdate:Ljava/lang/String;

.field private code:Ljava/lang/String;

.field private codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

.field private controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

.field private curStep:I

.field private firstName:Ljava/lang/String;

.field private gender:I

.field private lastName:Ljava/lang/String;

.field private libverifySessionId:Ljava/lang/String;

.field private libverifySupport:Z

.field private libverifyToken:Ljava/lang/String;

.field private mPhotoBottom:F

.field private mPhotoLeft:F

.field private mPhotoRight:F

.field private mPhotoTop:F

.field private number:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

.field private phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

.field private photo:Ljava/lang/String;

.field private profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

.field private progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

.field private progressDialog:Landroid/app/ProgressDialog;

.field private sid:Ljava/lang/String;

.field private wrap:Landroid/widget/FrameLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/activities/SignupActivity;->titles:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f08059a
        0x7f0806b0
        0x7f08069b
        0x7f0806ab
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;-><init>()V

    .line 56
    iput v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    .line 62
    iput-boolean v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity;->sid:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/activities/SignupActivity;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoTop:F

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/activities/SignupActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/activities/SignupActivity;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoRight:F

    return v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/activities/SignupActivity;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoBottom:F

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/activities/SignupActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p1, "x1"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/SignupActivity;->setStep(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/activities/SignupActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->code:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity;->code:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->password:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->photo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/activities/SignupActivity;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 45
    iget v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoLeft:F

    return v0
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onProfileFragmentDone()V

    return-void
.end method

.method static synthetic access$lambda$1(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onPhoneDone()V

    return-void
.end method

.method static synthetic access$lambda$2(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onCodeDone()V

    return-void
.end method

.method static synthetic access$lambda$3(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onPassDone()V

    return-void
.end method

.method private complete(Lcom/vkontakte/android/api/auth/AuthConfirm;)V
    .locals 1
    .param p1, "authConfirm"    # Lcom/vkontakte/android/api/auth/AuthConfirm;

    .prologue
    .line 395
    new-instance v0, Lcom/vkontakte/android/activities/SignupActivity$4;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/SignupActivity$4;-><init>(Lcom/vkontakte/android/activities/SignupActivity;)V

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/api/auth/AuthConfirm;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 426
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 427
    return-void
.end method

.method private completeSignup()V
    .locals 6

    .prologue
    .line 387
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    if-eqz v0, :cond_0

    .line 388
    new-instance v0, Lcom/vkontakte/android/api/auth/AuthConfirm;

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity;->password:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->sid:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySessionId:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifyToken:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/auth/AuthConfirm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->complete(Lcom/vkontakte/android/api/auth/AuthConfirm;)V

    .line 392
    :goto_0
    return-void

    .line 390
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/auth/AuthConfirm;

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity;->code:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->password:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/auth/AuthConfirm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->complete(Lcom/vkontakte/android/api/auth/AuthConfirm;)V

    goto :goto_0
.end method

.method private onCodeDone()V
    .locals 2

    .prologue
    .line 204
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getCode()Ljava/lang/String;

    move-result-object v0

    .line 205
    .local v0, "code":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const v1, 0x7f08069a

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    .line 210
    :goto_0
    return-void

    .line 208
    :cond_0
    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->verifyCode(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onPassDone()V
    .locals 2

    .prologue
    .line 271
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;->getPassword()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->password:Ljava/lang/String;

    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->password:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    .line 273
    const v0, 0x7f0806ac

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    .line 277
    :goto_0
    return-void

    .line 276
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->completeSignup()V

    goto :goto_0
.end method

.method private onPhoneDone()V
    .locals 4

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->isFilled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 201
    :goto_0
    return-void

    .line 199
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->sid:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/Runnable;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method private onProfileFragmentDone()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->isFilled()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getFirstName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->firstName:Ljava/lang/String;

    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getLastName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->lastName:Ljava/lang/String;

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getGender()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->gender:I

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getBDate()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->bdate:Ljava/lang/String;

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getPhoto()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->photo:Ljava/lang/String;

    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getPhotoLeft()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoLeft:F

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getPhotoTop()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoTop:F

    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getPhotoRight()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoRight:F

    .line 190
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getPhotoBottom()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->mPhotoBottom:F

    .line 191
    invoke-direct {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->setStep(I)V

    .line 193
    :cond_0
    return-void
.end method

.method private requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V
    .locals 9
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "voice"    # Z
    .param p3, "runAfter"    # Ljava/lang/Runnable;
    .param p4, "libVerSupp"    # Z

    .prologue
    .line 280
    new-instance v0, Lcom/vkontakte/android/api/auth/AuthSignup;

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->firstName:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity;->lastName:Ljava/lang/String;

    iget v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->gender:I

    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->bdate:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    move-object v6, p1

    move v7, p2

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/api/auth/AuthSignup;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    new-instance v1, Lcom/vkontakte/android/activities/SignupActivity$2;

    invoke-direct {v1, p0, p3}, Lcom/vkontakte/android/activities/SignupActivity$2;-><init>(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/auth/AuthSignup;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 330
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 331
    return-void
.end method

.method private setStep(I)V
    .locals 8
    .param p1, "step"    # I

    .prologue
    const v5, 0x7f10002b

    .line 213
    iput p1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    .line 214
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->wrap:Landroid/widget/FrameLayout;

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/Runnable;

    move-result-object v4

    const-wide/16 v6, 0x64

    invoke-virtual {v3, v4, v6, v7}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 215
    sget-object v3, Lcom/vkontakte/android/activities/SignupActivity;->titles:[I

    aget v3, v3, p1

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/SignupActivity;->setTitle(I)V

    .line 216
    if-nez p1, :cond_0

    .line 217
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 218
    .local v1, "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 220
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    :cond_0
    const/4 v3, 0x1

    if-ne p1, v3, :cond_2

    .line 221
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    if-nez v3, :cond_1

    .line 222
    new-instance v3, Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .line 223
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 225
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 226
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 228
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    :cond_2
    const/4 v3, 0x2

    if-ne p1, v3, :cond_4

    .line 229
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->phoneFragment:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v2

    .line 231
    .local v2, "phoneNumber":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    if-nez v3, :cond_3

    .line 232
    iget-boolean v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->create(Ljava/lang/String;Z)Lcom/vkontakte/android/fragments/SignupCodeFragment;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .line 233
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->setOnResendListener(Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;)V

    .line 246
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 248
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 249
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->codeFragment:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 251
    iget-boolean v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    if-eqz v3, :cond_4

    .line 254
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onStart(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    .end local v2    # "phoneNumber":Ljava/lang/String;
    :cond_4
    :goto_0
    const/4 v3, 0x3

    if-ne p1, v3, :cond_6

    .line 261
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    if-nez v3, :cond_5

    .line 262
    new-instance v3, Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    .line 263
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 265
    :cond_5
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 266
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->passwordFragment:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-virtual {v1, v5, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 268
    .end local v1    # "ft":Landroid/app/FragmentTransaction;
    :cond_6
    return-void

    .line 255
    .restart local v1    # "ft":Landroid/app/FragmentTransaction;
    .restart local v2    # "phoneNumber":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 256
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
    .line 430
    iget-object v0, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    .line 431
    return-void
.end method

.method private showError(Ljava/lang/String;)V
    .locals 3
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 434
    const-string/jumbo v0, "I/O Error"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f08004f

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 437
    :cond_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 438
    return-void
.end method

.method private verify(Lcom/vkontakte/android/api/auth/AuthConfirm;)V
    .locals 1
    .param p1, "authConfirm"    # Lcom/vkontakte/android/api/auth/AuthConfirm;

    .prologue
    .line 361
    new-instance v0, Lcom/vkontakte/android/activities/SignupActivity$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/SignupActivity$3;-><init>(Lcom/vkontakte/android/activities/SignupActivity;)V

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/api/auth/AuthConfirm;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 383
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 384
    return-void
.end method

.method private verifyCode(Ljava/lang/String;)V
    .locals 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 334
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 335
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    if-eqz v1, :cond_2

    .line 338
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->isValidSmsCode(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 339
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onEnterSmsCode(Ljava/lang/String;)V

    .line 350
    :cond_0
    :goto_0
    return-void

    .line 341
    :cond_1
    sget-object v1, Lru/mail/libverify/api/VerificationApi$FailReason;->INCORRECT_SMS_CODE:Lru/mail/libverify/api/VerificationApi$FailReason;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 343
    :catch_0
    move-exception v0

    .line 344
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 347
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    new-instance v1, Lcom/vkontakte/android/api/auth/AuthConfirm;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p1, v3}, Lcom/vkontakte/android/api/auth/AuthConfirm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->verify(Lcom/vkontakte/android/api/auth/AuthConfirm;)V

    goto :goto_0
.end method

.method private verifyLibverifyToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "session"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 353
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySessionId:Ljava/lang/String;

    .line 354
    iput-object p2, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifyToken:Ljava/lang/String;

    .line 355
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->sid:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 356
    new-instance v0, Lcom/vkontakte/android/api/auth/AuthConfirm;

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->number:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity;->code:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/activities/SignupActivity;->sid:Ljava/lang/String;

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/auth/AuthConfirm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->verify(Lcom/vkontakte/android/api/auth/AuthConfirm;)V

    .line 358
    :cond_0
    return-void
.end method


# virtual methods
.method public hideProgress()V
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 76
    return-void
.end method

.method synthetic lambda$onPhoneDone$0()V
    .locals 1

    .prologue
    .line 200
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->setStep(I)V

    return-void
.end method

.method synthetic lambda$setStep$1()V
    .locals 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    iget v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStepAnimated(I)V

    return-void
.end method

.method synthetic lambda$setStep$2(ZLjava/lang/Runnable;)V
    .locals 3
    .param p1, "voice"    # Z
    .param p2, "action"    # Ljava/lang/Runnable;

    .prologue
    const/4 v2, 0x0

    .line 234
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->libverifySupport:Z

    if-eqz v1, :cond_0

    .line 237
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onResendSms()V

    .line 238
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    :goto_0
    return-void

    .line 239
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 243
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->sid:Ljava/lang/String;

    invoke-direct {p0, v1, p1, p2, v2}, Lcom/vkontakte/android/activities/SignupActivity;->requestCode(Ljava/lang/String;ZLjava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, -0x1

    .line 463
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 465
    if-ne p2, v6, :cond_0

    const/16 v4, 0xcb

    if-ne p1, v4, :cond_0

    .line 466
    if-eqz p3, :cond_0

    .line 467
    const-string/jumbo v4, "access_token"

    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 468
    .local v0, "accessToken":Ljava/lang/String;
    const-string/jumbo v4, "secret"

    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 469
    .local v2, "secret":Ljava/lang/String;
    const-string/jumbo v4, "user_id"

    const/4 v5, 0x0

    invoke-virtual {p3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 470
    .local v3, "userId":I
    if-eqz v3, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 471
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 472
    .local v1, "intent2":Landroid/content/Intent;
    const-string/jumbo v4, "auth_state"

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/auth/VKAuthState;->byAuthData(Ljava/lang/String;Ljava/lang/String;I)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 473
    invoke-virtual {p0, v6, v1}, Lcom/vkontakte/android/activities/SignupActivity;->setResult(ILandroid/content/Intent;)V

    .line 477
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v1    # "intent2":Landroid/content/Intent;
    .end local v2    # "secret":Ljava/lang/String;
    .end local v3    # "userId":I
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 443
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onCancel()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 444
    iget v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 445
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->setStep(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 460
    :cond_0
    :goto_0
    return-void

    .line 449
    :catch_0
    move-exception v0

    .line 450
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 452
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    .line 453
    invoke-direct {p0, v4}, Lcom/vkontakte/android/activities/SignupActivity;->setStep(I)V

    goto :goto_0

    .line 454
    :cond_2
    iget v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    if-nez v1, :cond_3

    .line 455
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/SignupActivity;->setResult(I)V

    .line 456
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->finish()V

    goto :goto_0

    .line 458
    :cond_3
    iget v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/activities/SignupActivity;->setStep(I)V

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
    .line 528
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->onConfirmed()V

    .line 529
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/activities/SignupActivity;->verifyLibverifyToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 531
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const v6, 0x7f10002b

    .line 79
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onCreate(Landroid/os/Bundle;)V

    .line 81
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->progressDialog:Landroid/app/ProgressDialog;

    .line 82
    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->progressDialog:Landroid/app/ProgressDialog;

    const v5, 0x7f08033d

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 86
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    if-nez v4, :cond_0

    .line 87
    invoke-static {p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->registration(Landroid/content/Context;)Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :cond_0
    :goto_0
    const v4, 0x7f0f0024

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/SignupActivity;->setDialogWindowBackgroundResource(I)V

    .line 94
    const v4, 0x7f030216

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/SignupActivity;->setContentView(I)V

    .line 95
    const v4, 0x7f1001b0

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/activities/SignupActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/Toolbar;

    .line 97
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    new-instance v4, Lcom/vkontakte/android/activities/SignupActivity$1;

    invoke-virtual {v3}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/activities/SignupActivity$1;-><init>(Lcom/vkontakte/android/activities/SignupActivity;Landroid/graphics/drawable/Drawable;)V

    iput-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    .line 107
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/SignupActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 109
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 110
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_1

    .line 111
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 112
    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 115
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStepCount(I)V

    .line 117
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/activities/SignupActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    iput-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->wrap:Landroid/widget/FrameLayout;

    .line 119
    new-instance v4, Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/SignupProfileFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .line 120
    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {p0}, Lcom/vkontakte/android/activities/SignupActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/activities/SignupActivity;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    .line 122
    .local v2, "ft":Landroid/app/FragmentTransaction;
    iget-object v4, p0, Lcom/vkontakte/android/activities/SignupActivity;->profileFragment:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v2, v6, v4}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    .line 123
    return-void

    .line 89
    .end local v0    # "actionBar":Landroid/support/v7/app/ActionBar;
    .end local v2    # "ft":Landroid/app/FragmentTransaction;
    .end local v3    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f11000f

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 150
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onError(Lru/mail/libverify/api/VerificationApi$FailReason;)V
    .locals 2
    .param p1, "reason"    # Lru/mail/libverify/api/VerificationApi$FailReason;

    .prologue
    .line 497
    sget-object v0, Lcom/vkontakte/android/activities/SignupActivity$5;->$SwitchMap$ru$mail$libverify$api$VerificationApi$FailReason:[I

    invoke-virtual {p1}, Lru/mail/libverify/api/VerificationApi$FailReason;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 516
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 501
    :pswitch_0
    const v0, 0x7f0806a5

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    .line 518
    :goto_0
    :pswitch_1
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 519
    return-void

    .line 504
    :pswitch_2
    const v0, 0x7f0806a6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 510
    :pswitch_3
    const v0, 0x7f0801f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 513
    :pswitch_4
    const v0, 0x7f08069a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    goto :goto_0

    .line 497
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
    .line 535
    const v0, 0x7f0801f6

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/SignupActivity;->showError(Ljava/lang/String;)V

    .line 536
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 537
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 155
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 176
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 157
    :sswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onBackPressed()V

    goto :goto_0

    .line 160
    :sswitch_1
    iget v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->curStep:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 162
    :pswitch_0
    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onProfileFragmentDone()V

    goto :goto_0

    .line 165
    :pswitch_1
    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onPhoneDone()V

    goto :goto_0

    .line 168
    :pswitch_2
    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onCodeDone()V

    goto :goto_0

    .line 171
    :pswitch_3
    invoke-direct {p0}, Lcom/vkontakte/android/activities/SignupActivity;->onPassDone()V

    goto :goto_0

    .line 155
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f10021d -> :sswitch_1
    .end sparse-switch

    .line 160
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 127
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onPause()V

    .line 130
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->setListener(Lru/mail/libverify/controls/VerificationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :goto_0
    return-void

    .line 131
    :catch_0
    move-exception v0

    .line 132
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
    .line 541
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 542
    return-void
.end method

.method public onProgress(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 488
    if-eqz p1, :cond_0

    .line 489
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->showProgress()V

    .line 493
    :goto_0
    return-void

    .line 491
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/SignupActivity;->hideProgress()V

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 138
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onResume()V

    .line 141
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity;->controller:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->setListener(Lru/mail/libverify/controls/VerificationListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onSmsCodeReceived(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 523
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 524
    return-void
.end method

.method public onStateChanged(Lru/mail/libverify/controls/VerificationController$State;)V
    .locals 2
    .param p1, "state"    # Lru/mail/libverify/controls/VerificationController$State;

    .prologue
    .line 483
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 484
    return-void
.end method

.method public showProgress()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->showDialogSafety(Landroid/app/Dialog;)V

    .line 72
    return-void
.end method
