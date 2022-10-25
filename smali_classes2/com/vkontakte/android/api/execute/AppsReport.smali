.class public Lcom/vkontakte/android/api/execute/AppsReport;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AppsReport.java"


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .param p1, "ownerID"    # I
    .param p2, "appId"    # I
    .param p3, "reason"    # I

    .prologue
    .line 8
    const-string/jumbo v0, "apps.report"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 9
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/execute/AppsReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 10
    const-string/jumbo v0, "app_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/execute/AppsReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "reason"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/execute/AppsReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method
