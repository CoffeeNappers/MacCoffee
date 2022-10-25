.class public Lcom/vkontakte/android/ReportAppsActivity;
.super Landroid/app/Activity;
.source "ReportAppsActivity.java"


# static fields
.field private static final SPA_REQUEST_CODE:I = 0x4d2


# instance fields
.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ReportAppsActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    return-void
.end method

.method private sendReport(I)V
    .locals 5
    .param p1, "type"    # I

    .prologue
    const/4 v4, 0x0

    .line 62
    new-instance v0, Lcom/vkontakte/android/api/execute/AppsReport;

    invoke-virtual {p0}, Lcom/vkontakte/android/ReportAppsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "ownerID"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ReportAppsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "appID"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-direct {v0, v1, v2, p1}, Lcom/vkontakte/android/api/execute/AppsReport;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/ReportAppsActivity$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/ReportAppsActivity$1;-><init>(Lcom/vkontakte/android/ReportAppsActivity;Landroid/content/Context;)V

    .line 63
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/execute/AppsReport;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 77
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 78
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 79
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 35
    add-int/lit8 v0, p2, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ReportAppsActivity;->sendReport(I)V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportAppsActivity;->finish()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 44
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 45
    const/16 v0, 0x4d2

    if-ne p2, v0, :cond_0

    .line 46
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 52
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportAppsActivity;->finish()V

    .line 53
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/ReportAppsActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 28
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    iget-boolean v2, v2, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    if-eqz v2, :cond_0

    .line 29
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportAppsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "ownerID"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 30
    .local v1, "ownerId":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportAppsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "appID"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 31
    .local v0, "appId":I
    new-instance v2, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;

    invoke-static {v1, v0}, Lcom/vk/webapp/ReportAppInputData;->getSPAUriForApp(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x4d2

    invoke-virtual {v2, p0, v3}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 39
    .end local v0    # "appId":I
    .end local v1    # "ownerId":I
    :goto_0
    return-void

    .line 33
    :cond_0
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0805bd

    .line 34
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0c0003

    invoke-static {p0}, Lcom/vkontakte/android/ReportAppsActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ReportAppsActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v4

    .line 35
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/ReportAppsActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ReportAppsActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v3

    .line 36
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 37
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/ReportAppsActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 58
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 59
    return-void
.end method
