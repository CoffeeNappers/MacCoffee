.class Lcom/vkontakte/android/ReportContentActivity$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ReportContentActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ReportContentActivity;->lambda$onCreate$0(Landroid/content/DialogInterface;I)V
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
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/ReportContentActivity$1;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 77
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$1;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    .line 79
    return-void
.end method

.method public success()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$1;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-static {v0}, Lcom/vkontakte/android/ReportContentActivity;->access$000(Lcom/vkontakte/android/ReportContentActivity;)V

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity$1;->this$0:Lcom/vkontakte/android/ReportContentActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    .line 73
    return-void
.end method
