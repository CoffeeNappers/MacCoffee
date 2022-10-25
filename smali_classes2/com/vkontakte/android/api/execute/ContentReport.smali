.class public Lcom/vkontakte/android/api/execute/ContentReport;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "ContentReport.java"


# direct methods
.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .param p1, "ownerID"    # I
    .param p2, "itemID"    # I
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "refer"    # Ljava/lang/String;
    .param p5, "reason"    # I
    .param p6, "trackCode"    # Ljava/lang/String;

    .prologue
    .line 10
    const-string/jumbo v0, "execute.reportContent"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "item_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "type"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "reason"

    invoke-virtual {p0, v0, p5}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    const-string/jumbo v0, "ref"

    if-nez p4, :cond_0

    const-string/jumbo p4, ""

    .end local p4    # "refer":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 18
    const-string/jumbo v0, "track_code"

    invoke-virtual {p0, v0, p6}, Lcom/vkontakte/android/api/execute/ContentReport;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    :cond_1
    return-void
.end method
