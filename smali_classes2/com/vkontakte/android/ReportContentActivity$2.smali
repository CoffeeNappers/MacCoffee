.class Lcom/vkontakte/android/ReportContentActivity$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ReportContentActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ReportContentActivity;->sendReport(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ReportContentActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ReportContentActivity;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ReportContentActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/vkontakte/android/ReportContentActivity$2;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 171
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$2;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    .line 173
    return-void
.end method

.method public success()V
    .locals 3

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$2;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    const v1, 0x7f0805be

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$2;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/vkontakte/android/ReportContentActivity$2;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ReportContentActivity;->setResult(ILandroid/content/Intent;)V

    .line 166
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$2;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    .line 167
    return-void
.end method
