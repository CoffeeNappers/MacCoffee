.class Lcom/vkontakte/android/ReportAppsActivity$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ReportAppsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ReportAppsActivity;->sendReport(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ReportAppsActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ReportAppsActivity;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ReportAppsActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/ReportAppsActivity$1;->this$0:Lcom/vkontakte/android/ReportAppsActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 73
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/ReportAppsActivity$1;->this$0:Lcom/vkontakte/android/ReportAppsActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ReportAppsActivity;->finish()V

    .line 75
    return-void
.end method

.method public success()V
    .locals 3

    .prologue
    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ReportAppsActivity$1;->this$0:Lcom/vkontakte/android/ReportAppsActivity;

    const v1, 0x7f0805be

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ReportAppsActivity$1;->this$0:Lcom/vkontakte/android/ReportAppsActivity;

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/vkontakte/android/ReportAppsActivity$1;->this$0:Lcom/vkontakte/android/ReportAppsActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/ReportAppsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ReportAppsActivity;->setResult(ILandroid/content/Intent;)V

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ReportAppsActivity$1;->this$0:Lcom/vkontakte/android/ReportAppsActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ReportAppsActivity;->finish()V

    .line 69
    return-void
.end method
