.class public Lcom/vkontakte/android/fragments/SignupCodeFragment;
.super Lcom/vkontakte/android/fragments/VKFragment;
.source "SignupCodeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;,
        Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;
    }
.end annotation


# static fields
.field private static final KEY_LIBVERIFY_SUPPORT:Ljava/lang/String; = "key_libverify_support"

.field private static final KEY_NUMBER:Ljava/lang/String; = "key_number"


# instance fields
.field private doneFunc:Lcom/vkontakte/android/functions/VoidF0;

.field private initTime:J

.field private listener:Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

.field private phoneNumber:Ljava/lang/String;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private smsCode:Ljava/lang/CharSequence;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKFragment;-><init>()V

    .line 56
    new-instance v0, Lcom/vkontakte/android/fragments/SignupCodeFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$1;-><init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/SignupCodeFragment;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .prologue
    .line 35
    iget-wide v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->initTime:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/SignupCodeFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->processSms(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/SignupCodeFragment;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->smsCode:Ljava/lang/CharSequence;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->listener:Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    return-object v0
.end method

.method public static create(Ljava/lang/String;Z)Lcom/vkontakte/android/fragments/SignupCodeFragment;
    .locals 3
    .param p0, "phoneNumber"    # Ljava/lang/String;
    .param p1, "libverifySupport"    # Z

    .prologue
    .line 41
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "key_number"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const-string/jumbo v2, "key_libverify_support"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 44
    new-instance v1, Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/SignupCodeFragment;-><init>()V

    .line 45
    .local v1, "fragment":Lcom/vkontakte/android/fragments/SignupCodeFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->setArguments(Landroid/os/Bundle;)V

    .line 46
    return-object v1
.end method

.method private processSms(Ljava/lang/String;)V
    .locals 6
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 70
    const-string/jumbo v4, ": ([0-9a-z]+).+(?:VK|\u0412\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u0435)"

    const/16 v5, 0x28

    invoke-static {v4, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 71
    .local v2, "ptn":Ljava/util/regex/Pattern;
    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 72
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 73
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "code":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v5, 0x7f100530

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 75
    .local v3, "textViewSignUpCode":Landroid/widget/TextView;
    if-eqz v3, :cond_0

    .line 76
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->smsCode:Ljava/lang/CharSequence;

    .line 79
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    if-eqz v4, :cond_1

    .line 80
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    invoke-interface {v4}, Lcom/vkontakte/android/functions/VoidF0;->f()V

    .line 83
    .end local v0    # "code":Ljava/lang/String;
    .end local v3    # "textViewSignUpCode":Landroid/widget/TextView;
    :cond_1
    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->smsCode:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->smsCode:Ljava/lang/CharSequence;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method synthetic lambda$null$1()V
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v1, 0x7f100531

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f080696

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v1, 0x7f100533

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 143
    :cond_0
    return-void
.end method

.method synthetic lambda$onCreateView$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$onCreateView$2(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->listener:Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->listener:Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    const/4 v1, 0x1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;->resendCode(ZLjava/lang/Runnable;)V

    .line 145
    :cond_0
    return-void
.end method

.method synthetic lambda$onCreateView$3(Landroid/widget/EditText;)V
    .locals 3
    .param p1, "editTextSignUpCode"    # Landroid/widget/EditText;

    .prologue
    .line 150
    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 152
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v2, 0x7f100538

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 153
    return-void
.end method

.method synthetic lambda$onCreateView$4(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF0;->f()V

    .line 159
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 86
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKFragment;->onCreate(Landroid/os/Bundle;)V

    .line 87
    if-eqz p1, :cond_1

    .line 88
    const-string/jumbo v0, "init_time"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->initTime:J

    .line 92
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->phoneNumber:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_number"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->phoneNumber:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->phoneNumber:Ljava/lang/String;

    .line 95
    :cond_0
    return-void

    .line 90
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->initTime:J

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 13
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    const v8, 0x7f0301f9

    const/4 v9, 0x0

    invoke-virtual {p1, v8, p2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    .line 117
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v9, 0x7f100088

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 118
    .local v6, "topBlock":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    .local v3, "pl":I
    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    .local v5, "pt":I
    invoke-virtual {v6}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    .local v4, "pr":I
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    .line 119
    .local v2, "pb":I
    new-instance v9, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const/4 v11, -0x1

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    int-to-float v12, v8

    iget-boolean v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->isTablet:Z

    if-nez v8, :cond_1

    const/4 v8, 0x1

    :goto_0
    invoke-direct {v9, v10, v11, v12, v8}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    invoke-virtual {v6, v9}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 120
    invoke-virtual {v6, v3, v5, v4, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 122
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x10

    if-lt v8, v9, :cond_0

    .line 123
    new-instance v7, Landroid/animation/LayoutTransition;

    invoke-direct {v7}, Landroid/animation/LayoutTransition;-><init>()V

    .line 124
    .local v7, "trans":Landroid/animation/LayoutTransition;
    const/4 v8, 0x4

    invoke-virtual {v7, v8}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 125
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    check-cast v8, Landroid/view/ViewGroup;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup;

    invoke-virtual {v8, v7}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 128
    .end local v7    # "trans":Landroid/animation/LayoutTransition;
    :cond_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    new-instance v9, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;

    const/4 v10, 0x0

    invoke-direct {v9, p0, v10}, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;-><init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;Lcom/vkontakte/android/fragments/SignupCodeFragment$1;)V

    const-wide/16 v10, 0x1f4

    invoke-virtual {v8, v9, v10, v11}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 130
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v9, 0x7f10052f

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View$OnClickListener;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    :try_start_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v9, 0x7f10052f

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->phoneNumber:Ljava/lang/String;

    invoke-static {v9}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_1
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v9, 0x7f100533

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View$OnClickListener;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v9, 0x7f100530

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 149
    .local v1, "editTextSignUpCode":Landroid/widget/EditText;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;Landroid/widget/EditText;)Ljava/lang/Runnable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 155
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/widget/TextView$OnEditorActionListener;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 161
    new-instance v8, Lcom/vkontakte/android/fragments/SignupCodeFragment$2;

    invoke-direct {v8, p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$2;-><init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 176
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    return-object v8

    .line 119
    .end local v1    # "editTextSignUpCode":Landroid/widget/EditText;
    :cond_1
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    const v9, 0x7f10052f

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 98
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKFragment;->onDestroy()V

    .line 100
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    :goto_0
    return-void

    .line 101
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 184
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKFragment;->onDestroyView()V

    .line 185
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->view:Landroid/view/View;

    .line 186
    return-void
.end method

.method public setNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->phoneNumber:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V
    .locals 0
    .param p1, "doneFunc"    # Lcom/vkontakte/android/functions/VoidF0;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    .line 112
    return-void
.end method

.method public setOnResendListener(Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment;->listener:Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    .line 190
    return-void
.end method
