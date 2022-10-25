.class public Lcom/vkontakte/android/CaptchaActivity;
.super Landroid/app/Activity;
.source "CaptchaActivity.java"


# static fields
.field public static isReady:Z

.field public static lastKey:Ljava/lang/String;


# instance fields
.field private image:Landroid/widget/ImageView;

.field private input:Landroid/widget/EditText;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

.field private progress:Landroid/widget/ProgressBar;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/CaptchaActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    return-void
.end method

.method private captchaCanceled()V
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/CaptchaActivity;->lastKey:Ljava/lang/String;

    .line 124
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    .line 125
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/CaptchaActivity;->setResult(I)V

    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/CaptchaActivity;->finish()V

    .line 127
    return-void
.end method

.method private captchaDone()V
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/CaptchaActivity;->lastKey:Ljava/lang/String;

    .line 118
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/CaptchaActivity;->finish()V

    .line 120
    return-void
.end method

.method private displayImage(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 110
    invoke-static {p0, p1}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;Landroid/graphics/Bitmap;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/CaptchaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 114
    return-void
.end method

.method private loadImage()V
    .locals 2

    .prologue
    .line 97
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 106
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 107
    return-void
.end method


# virtual methods
.method synthetic lambda$displayImage$5(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/CaptchaActivity;->image:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/CaptchaActivity;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 113
    return-void
.end method

.method synthetic lambda$loadImage$4()V
    .locals 4

    .prologue
    .line 99
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/CaptchaActivity;->url:Ljava/lang/String;

    invoke-static {v2}, Lcom/vk/core/network/Network;->getURL(Ljava/lang/String;)[B

    move-result-object v1

    .line 100
    .local v1, "imdata":[B
    if-eqz v1, :cond_0

    .line 101
    const/4 v2, 0x0

    array-length v3, v1

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 102
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-direct {p0, v0}, Lcom/vkontakte/android/CaptchaActivity;->displayImage(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "imdata":[B
    :cond_0
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method synthetic lambda$onCreate$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/vkontakte/android/CaptchaActivity;->captchaDone()V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/vkontakte/android/CaptchaActivity;->captchaCanceled()V

    return-void
.end method

.method synthetic lambda$onCreate$2(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/vkontakte/android/CaptchaActivity;->captchaCanceled()V

    return-void
.end method

.method synthetic lambda$onCreate$3()V
    .locals 3

    .prologue
    .line 85
    const-string/jumbo v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/CaptchaActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 86
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 87
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 34
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {p0, v9, v10}, Lcom/vkontakte/android/CaptchaActivity;->overridePendingTransition(II)V

    .line 36
    new-instance v9, Landroid/view/View;

    invoke-direct {v9, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/CaptchaActivity;->setContentView(Landroid/view/View;)V

    .line 38
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 39
    .local v6, "layout":Landroid/widget/LinearLayout;
    const/high16 v9, 0x41400000    # 12.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v7

    .line 40
    .local v7, "padding":I
    const/high16 v9, 0x43020000    # 130.0f

    const/high16 v10, 0x3f800000    # 1.0f

    sget v11, Lcom/vkontakte/android/Global;->displayDensity:F

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v10

    mul-float/2addr v9, v10

    float-to-int v2, v9

    .line 41
    .local v2, "imageWidth":I
    const/high16 v9, 0x42480000    # 50.0f

    const/high16 v10, 0x3f800000    # 1.0f

    sget v11, Lcom/vkontakte/android/Global;->displayDensity:F

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v10

    mul-float/2addr v9, v10

    float-to-int v1, v9

    .line 42
    .local v1, "imageHeight":I
    invoke-virtual {v6, v7, v7, v7, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 43
    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 44
    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 46
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 47
    .local v3, "imgFrame":Landroid/widget/FrameLayout;
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 48
    .local v0, "flParams":Landroid/widget/LinearLayout$LayoutParams;
    iput v7, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 49
    invoke-virtual {v3, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    new-instance v9, Landroid/widget/ProgressBar;

    invoke-direct {v9, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->progress:Landroid/widget/ProgressBar;

    .line 52
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v9, -0x2

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 53
    .local v8, "pbParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v9, 0x11

    iput v9, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 54
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v9, v8}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 57
    new-instance v9, Landroid/widget/ImageView;

    invoke-direct {v9, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->image:Landroid/widget/ImageView;

    .line 58
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x1

    invoke-direct {v5, v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 59
    .local v5, "ivParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v9, 0x11

    iput v9, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 60
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->image:Landroid/widget/ImageView;

    invoke-virtual {v9, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->image:Landroid/widget/ImageView;

    invoke-virtual {v3, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 63
    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 65
    new-instance v9, Landroid/widget/EditText;

    invoke-direct {v9, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    .line 66
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    const/16 v10, 0xb0

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setInputType(I)V

    .line 67
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 68
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v4, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 69
    .local v4, "inParams":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v9, v4}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/CaptchaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    const-string/jumbo v10, "url"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->url:Ljava/lang/String;

    .line 73
    const/4 v9, 0x0

    sput-boolean v9, Lcom/vkontakte/android/CaptchaActivity;->isReady:Z

    .line 74
    new-instance v9, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 75
    invoke-virtual {v9, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const v10, 0x7f080121

    .line 76
    invoke-virtual {v9, v10}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const v10, 0x7f080479

    invoke-static {p0}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v11

    .line 77
    invoke-virtual {v9, v10, v11}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const v10, 0x7f08011f

    invoke-static {p0}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v11

    .line 78
    invoke-virtual {v9, v10, v11}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    invoke-static {p0}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v10

    .line 79
    invoke-virtual {v9, v10}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    .line 80
    invoke-virtual {v9}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 82
    invoke-direct {p0}, Lcom/vkontakte/android/CaptchaActivity;->loadImage()V

    .line 83
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v9}, Landroid/widget/EditText;->requestFocus()Z

    .line 84
    iget-object v9, p0, Lcom/vkontakte/android/CaptchaActivity;->input:Landroid/widget/EditText;

    invoke-static {p0}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;)Ljava/lang/Runnable;

    move-result-object v10

    const-wide/16 v12, 0x1f4

    invoke-virtual {v9, v10, v12, v13}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 88
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/CaptchaActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 93
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 94
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 135
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 136
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 137
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 130
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 131
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 132
    return-void
.end method
