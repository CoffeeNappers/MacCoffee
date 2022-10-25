.class public Lcom/vkontakte/android/ChangePasswordActivity;
.super Landroid/app/Activity;
.source "ChangePasswordActivity.java"


# instance fields
.field private dlg:Landroid/app/AlertDialog;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

.field private textListener:Landroid/text/TextWatcher;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 26
    new-instance v0, Lcom/vkontakte/android/ChangePasswordActivity$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ChangePasswordActivity$1;-><init>(Lcom/vkontakte/android/ChangePasswordActivity;)V

    iput-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->textListener:Landroid/text/TextWatcher;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ChangePasswordActivity;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ChangePasswordActivity;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    return-object v0
.end method

.method private changePassword(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "old"    # Ljava/lang/String;
    .param p2, "nw"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v0, Lcom/vkontakte/android/api/account/AccountChangePassword;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/account/AccountChangePassword;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/ChangePasswordActivity$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/ChangePasswordActivity$2;-><init>(Lcom/vkontakte/android/ChangePasswordActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountChangePassword;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 116
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 117
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/vkontakte/android/ChangePasswordActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 73
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    const v4, 0x7f100259

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "old":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    const v4, 0x7f10025a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "new1":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    const v4, 0x7f10025b

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "new2":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x4

    if-ge v3, v4, :cond_0

    .line 88
    :goto_0
    return-void

    .line 79
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 80
    const v3, 0x7f080496

    invoke-static {p0, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x6

    if-ge v3, v4, :cond_2

    .line 84
    const v3, 0x7f0806ac

    invoke-static {p0, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 87
    :cond_2
    invoke-direct {p0, v2, v0}, Lcom/vkontakte/android/ChangePasswordActivity;->changePassword(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const v6, 0x7f10025b

    const v5, 0x7f10025a

    const v4, 0x7f100259

    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 51
    const v0, 0x7f030069

    invoke-static {p0, v0, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/ChangePasswordActivity;->textListener:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/ChangePasswordActivity;->textListener:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/ChangePasswordActivity;->textListener:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 59
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080125

    .line 60
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ChangePasswordActivity;->view:Landroid/view/View;

    .line 61
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08011f

    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 64
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    invoke-static {p0}, Lcom/vkontakte/android/ChangePasswordActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->dlg:Landroid/app/AlertDialog;

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/ChangePasswordActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 94
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 95
    return-void
.end method
