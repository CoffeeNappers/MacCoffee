.class public final Lru/mail/libverify/requests/k;
.super Lru/mail/libverify/requests/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/k$b;,
        Lru/mail/libverify/requests/k$a;,
        Lru/mail/libverify/requests/k$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lru/mail/libverify/requests/e",
        "<",
        "Lru/mail/libverify/requests/response/PushStatusApiResponse;",
        ">;"
    }
.end annotation


# instance fields
.field public final b:Lru/mail/libverify/requests/PushStatusData;


# direct methods
.method public constructor <init>(Lru/mail/libverify/storage/k;Ljava/util/List;Ljava/lang/String;Lru/mail/libverify/requests/k$b;Lru/mail/libverify/requests/k$a;Ljava/lang/String;J)V
    .locals 9
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lru/mail/libverify/requests/k$b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lru/mail/libverify/requests/k$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/storage/k;",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/requests/k$c;",
            ">;",
            "Ljava/lang/String;",
            "Lru/mail/libverify/requests/k$b;",
            "Lru/mail/libverify/requests/k$a;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "statusData can\'t be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lru/mail/libverify/requests/PushStatusData;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p6

    move-wide/from16 v4, p7

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lru/mail/libverify/requests/PushStatusData;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;JLru/mail/libverify/requests/k$b;Lru/mail/libverify/requests/k$a;)V

    iput-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/m;)V
    .locals 2
    .param p1    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/requests/e;-><init>(Lru/mail/libverify/storage/k;)V

    iget-object v0, p2, Lru/mail/libverify/requests/m;->a:Ljava/lang/String;

    const-class v1, Lru/mail/libverify/requests/PushStatusData;

    invoke-static {v0, v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/PushStatusData;

    iput-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    return-void
.end method


# virtual methods
.method protected final a()Lru/mail/libverify/requests/e$a;
    .locals 6

    invoke-super {p0}, Lru/mail/libverify/requests/e;->a()Lru/mail/libverify/requests/e$a;

    move-result-object v2

    const-string/jumbo v1, ""

    iget-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v0, v0, Lru/mail/libverify/requests/PushStatusData;->statusData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/k$c;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lru/mail/libverify/requests/k$c;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "status"

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v0, v0, Lru/mail/libverify/requests/PushStatusData;->pushSessionId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "session_id"

    iget-object v1, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v1, v1, Lru/mail/libverify/requests/PushStatusData;->pushSessionId:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v0, v0, Lru/mail/libverify/requests/PushStatusData;->pushApplicationId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string/jumbo v0, "application_id_old"

    iget-object v1, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v1, v1, Lru/mail/libverify/requests/PushStatusData;->pushApplicationId:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_3
    iget-object v0, p0, Lru/mail/libverify/requests/k;->a:Lru/mail/libverify/storage/k;

    invoke-interface {v0}, Lru/mail/libverify/storage/k;->i()Lru/mail/libverify/utils/k;

    move-result-object v1

    iget-boolean v0, v1, Lru/mail/libverify/utils/k;->a:Z

    if-eqz v0, :cond_7

    const-string/jumbo v0, "device_screen_active"

    const-string/jumbo v1, "1"

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_4
    :goto_1
    iget-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v0, v0, Lru/mail/libverify/requests/PushStatusData;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    if-eqz v0, :cond_5

    const-string/jumbo v0, "delivery_method"

    iget-object v1, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v1, v1, Lru/mail/libverify/requests/PushStatusData;->deliveryMethod:Lru/mail/libverify/requests/k$b;

    invoke-virtual {v1}, Lru/mail/libverify/requests/k$b;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_5
    iget-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v0, v0, Lru/mail/libverify/requests/PushStatusData;->confirmAction:Lru/mail/libverify/requests/k$a;

    if-eqz v0, :cond_6

    const-string/jumbo v0, "confirm_action"

    iget-object v1, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    iget-object v1, v1, Lru/mail/libverify/requests/PushStatusData;->confirmAction:Lru/mail/libverify/requests/k$a;

    invoke-virtual {v1}, Lru/mail/libverify/requests/k$a;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :cond_6
    invoke-virtual {p0, v2}, Lru/mail/libverify/requests/k;->a(Lru/mail/libverify/requests/e$a;)V

    return-object v2

    :cond_7
    const-string/jumbo v0, "device_screen_active"

    const-string/jumbo v3, "0"

    invoke-virtual {v2, v0, v3}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, v1, Lru/mail/libverify/utils/k;->b:Ljava/lang/Long;

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_2
    if-eqz v0, :cond_4

    const-string/jumbo v3, "device_inactive_time"

    iget-object v0, v1, Lru/mail/libverify/utils/k;->b:Ljava/lang/Long;

    if-nez v0, :cond_9

    const-wide/16 v0, 0x0

    :goto_3
    const-wide/16 v4, 0x3e8

    div-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lru/mail/libverify/requests/e$a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_1

    :cond_8
    const/4 v0, 0x0

    goto :goto_2

    :cond_9
    iget-object v0, v1, Lru/mail/libverify/utils/k;->b:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_3
.end method

.method protected final bridge synthetic a(Ljava/lang/String;)Lru/mail/libverify/requests/response/ClientApiResponseBase;
    .locals 1

    const-class v0, Lru/mail/libverify/requests/response/PushStatusApiResponse;

    invoke-static {p1, v0}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/requests/response/PushStatusApiResponse;

    return-object v0
.end method

.method protected final b()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final c()Lru/mail/libverify/requests/m;
    .locals 2

    new-instance v0, Lru/mail/libverify/requests/m;

    iget-object v1, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    invoke-static {v1}, Lru/mail/libverify/utils/json/a;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/m;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected final f()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "pushstatus"

    return-object v0
.end method

.method protected final g()Lru/mail/libverify/requests/l;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/requests/k;->b:Lru/mail/libverify/requests/PushStatusData;

    return-object v0
.end method
