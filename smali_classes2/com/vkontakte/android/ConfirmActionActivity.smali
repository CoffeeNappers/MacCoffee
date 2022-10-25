.class public Lcom/vkontakte/android/ConfirmActionActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "ConfirmActionActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ConfirmActionActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ConfirmActionActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ConfirmActionActivity;->confirmAction(Z)V

    return-void
.end method

.method private confirmAction(Z)V
    .locals 4
    .param p1, "confirm"    # Z

    .prologue
    .line 46
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/ConfirmActionBroadcastReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 47
    .local v0, "intent":Landroid/content/Intent;
    if-eqz p1, :cond_0

    const-string/jumbo v1, "com.vkontatke.android.ACTION_CONFIRM_ACTION"

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string/jumbo v1, "hash"

    invoke-virtual {p0}, Lcom/vkontakte/android/ConfirmActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "hash"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    const-string/jumbo v1, "token"

    invoke-virtual {p0}, Lcom/vkontakte/android/ConfirmActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "hash"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->generateToken(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ConfirmActionActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 51
    return-void

    .line 47
    :cond_0
    const-string/jumbo v1, "com.vkontatke.android.ACTION_DECLINE_ACTION"

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    invoke-virtual {p0}, Lcom/vkontakte/android/ConfirmActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "confirm_text"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/ConfirmActionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "notification_id"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 19
    .local v1, "ntfId":I
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f080177

    .line 20
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 21
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f08069d

    new-instance v4, Lcom/vkontakte/android/ConfirmActionActivity$3;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/ConfirmActionActivity$3;-><init>(Lcom/vkontakte/android/ConfirmActionActivity;)V

    .line 22
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f08011f

    new-instance v4, Lcom/vkontakte/android/ConfirmActionActivity$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/ConfirmActionActivity$2;-><init>(Lcom/vkontakte/android/ConfirmActionActivity;)V

    .line 29
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ConfirmActionActivity$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ConfirmActionActivity$1;-><init>(Lcom/vkontakte/android/ConfirmActionActivity;)V

    .line 36
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 42
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 43
    return-void
.end method
